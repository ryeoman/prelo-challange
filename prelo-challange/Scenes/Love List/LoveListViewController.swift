//
//  LoveListViewController.swift
//  prelo-challange
//
//  Created by Homade on 12/30/17.
//  Copyright © 2017 -. All rights reserved.
//

import UIKit

class LoveListViewController: UICollectionViewController {
    let cellId = "LoveListCell"
    var page = 1
    var loveItems = [LoveItem]()
    var isLoading = false
    var isBottom = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    func setupView(){
        collectionView?.register(UINib.init(nibName: "LoveListCell", bundle: nil), forCellWithReuseIdentifier: cellId)
        
        if !NetworkReachability.isConnectedToNetwork(){
            let alert = UIAlertController(title: "warning", message: "Please check your network connection", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            return
        }
        
        loadLoveList()
    }
    
    func loadLoveList(){
        LoveListRequest.call(page: page) { (success, items) in
            if items != nil{
                if items!.count > 0{
                    self.loveItems += items!
                    DispatchQueue.main.async {
                        self.collectionView?.reloadData()
                    }
                }else{
                    self.page = self.page - 1
                }
            }
        }
    }
}

extension LoveListViewController: UICollectionViewDelegateFlowLayout{
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return loveItems.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! LoveListCell
        
        let loveItem = loveItems[indexPath.row]
        cell.updateCell(item: loveItem)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: self.view.frame.height / 6.5)
    }
    
    override func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        let lastItem = loveItems.count - 1
        if indexPath.row == lastItem{
            page = page + 1
            print(page)
            loadLoveList()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
}
