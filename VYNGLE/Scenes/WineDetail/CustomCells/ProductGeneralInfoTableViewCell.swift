//
//  ProductGeneralInfoTableViewCell.swift
//  VYNGLE
//
//  Created by Sujeet on 9/15/17.
//  Copyright © 2017 VYNGLE. All rights reserved.
//

import UIKit

class ProductGeneralInfoTableViewCell: UITableViewCell {

    @IBOutlet weak var productGeneralInfoLabel: UILabel!
    @IBOutlet weak var productGeneralInfoView: CardView?
    
    /* override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = UIColor.clear
        self.productGeneralInfoLabel.layer.borderWidth = 1
        self.productGeneralInfoLabel.layer.borderColor = UIColor.clear.cgColor
        self.productGeneralInfoLabel.layer.masksToBounds = true
        
        self.productGeneralInfoView.layer.shadowOpacity = 0.18
        self.productGeneralInfoView.layer.shadowOffset = CGSize(width: 0, height: 2)
        self.productGeneralInfoView.layer.shadowRadius = 2
        self.productGeneralInfoView.layer.shadowColor = UIColor.brown.cgColor
        self.productGeneralInfoView.layer.masksToBounds = false
 
        productGeneralInfoLabel.font = wineTitle
        productGeneralInfoLabel.layer.borderWidth = 1
        productGeneralInfoLabel.layer.borderColor = wineCollectionViewBorderColor.cgColor
        productGeneralInfoLabel.layer.cornerRadius = 5.0
        productGeneralInfoLabel.layer.shadowColor = UIColor.black.cgColor
        productGeneralInfoLabel.layer.shadowOpacity = 0.5
        productGeneralInfoLabel.layer.shadowRadius = 0.5
        productGeneralInfoLabel.layer.shadowOffset = CGSize.zero
        
        
        productGeneralInfoView.layer.cornerRadius = 2.0
        productGeneralInfoView.layer.masksToBounds = true

    }*/
}
