//
//  LoveListCell.swift
//  prelo-challange
//
//  Created by Homade on 12/30/17.
//  Copyright © 2017 -. All rights reserved.
//

import UIKit
import Kingfisher

class LoveListCell: UICollectionViewCell {

    @IBOutlet weak var itemImage: UIImageView!
    @IBOutlet weak var itemName: UILabel!
    @IBOutlet weak var itemPrice: UILabel!
    let formatHelper = FormatHelper()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func updateCell(item: LoveItem){
        let urtlStr = item.display_picts![0]
        if (!urtlStr.isEmpty){
            let url = URL(string:  urtlStr)
            itemImage.kf.setImage(with: url)
        }
        
        itemName.text = item.name
        itemPrice.text = formatHelper.numberToCurrency(from: item.price!)
    }

}
