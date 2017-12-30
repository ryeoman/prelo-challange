//
//  SocialButton.swift
//  prelo-challange
//
//  Created by Homade on 12/30/17.
//  Copyright © 2017 -. All rights reserved.
//

import UIKit

@IBDesignable
class SocialButton: UIButton{
    @IBInspectable var borderColor: UIColor = UIColor.white
    @IBInspectable var titleSelectedColor: UIColor = UIColor.white
    @IBInspectable var borderWidth: CGFloat = 0
    
    override func draw(_ rect: CGRect) {
        let border = CALayer()
        border.backgroundColor = borderColor.cgColor
        border.frame = CGRect(x: 0, y: self.frame.size.height - borderWidth, width:  self.frame.size.width, height: borderWidth)
        self.layer.addSublayer(border)
        self.setTitleColor(titleSelectedColor, for: .highlighted)
    }
}
