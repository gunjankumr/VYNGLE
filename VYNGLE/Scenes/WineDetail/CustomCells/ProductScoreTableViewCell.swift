//
//  ProductScoreTableViewCell.swift
//  VYNGLE
//
//  Created by Sujeet on 9/15/17.
//  Copyright © 2017 VYNGLE. All rights reserved.
//

import UIKit

class ProductScoreTableViewCell: UITableViewCell {
    @IBOutlet weak var criticScore1Label: UILabel!
    @IBOutlet weak var criticScore2Label: UILabel!
    @IBOutlet weak var criticScore3Label: UILabel!
    
    @IBOutlet weak var criticScoreView: UIView?
    @IBOutlet weak var criticScoreSecondView: CardView?


   /* override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = UIColor.clear
        self.criticScore1Label.layer.borderWidth = 1
        self.criticScore1Label.layer.borderColor = UIColor.clear.cgColor
        self.criticScore1Label.layer.masksToBounds = true
        
        self.criticScore2Label.layer.borderWidth = 1
        self.criticScore2Label.layer.borderColor = UIColor.clear.cgColor
        self.criticScore2Label.layer.masksToBounds = true
        
        self.criticScore3Label.layer.borderWidth = 1
        self.criticScore3Label.layer.borderColor = UIColor.clear.cgColor
        self.criticScore3Label.layer.masksToBounds = true
        
        
        self.criticScoreView.layer.shadowOpacity = 0.18
        self.criticScoreView.layer.shadowOffset = CGSize(width: 0, height: 2)
        self.criticScoreView.layer.shadowRadius = 2
        self.criticScoreView.layer.shadowColor = UIColor.brown.cgColor
        self.criticScoreView.layer.masksToBounds = false
 
        
        
        criticScore1Label.font = wineTitle
        criticScore1Label.layer.borderWidth = 1
        criticScore1Label.layer.borderColor = wineCollectionViewBorderColor.cgColor
        criticScore1Label.layer.cornerRadius = 5.0
        criticScore1Label.layer.shadowColor = UIColor.black.cgColor
        criticScore1Label.layer.shadowOpacity = 0.5
        criticScore1Label.layer.shadowRadius = 0.5
        criticScore1Label.layer.shadowOffset = CGSize.zero
        
        criticScore2Label.font = wineTitle
        criticScore2Label.layer.borderWidth = 1
        criticScore2Label.layer.borderColor = wineCollectionViewBorderColor.cgColor
        criticScore2Label.layer.cornerRadius = 5.0
        criticScore2Label.layer.shadowColor = UIColor.black.cgColor
        criticScore2Label.layer.shadowOpacity = 0.5
        criticScore2Label.layer.shadowRadius = 0.5
        criticScore2Label.layer.shadowOffset = CGSize.zero

        criticScore3Label.font = wineTitle
        criticScore3Label.layer.borderWidth = 1
        criticScore3Label.layer.borderColor = wineCollectionViewBorderColor.cgColor
        criticScore3Label.layer.cornerRadius = 5.0
        criticScore3Label.layer.shadowColor = UIColor.black.cgColor
        criticScore3Label.layer.shadowOpacity = 0.5
        criticScore3Label.layer.shadowRadius = 0.5
        criticScore3Label.layer.shadowOffset = CGSize.zero

        
        criticScoreSecondView.layer.borderWidth = 1
        criticScoreSecondView.layer.borderColor = wineCollectionViewBorderColor.cgColor
        criticScoreSecondView.layer.cornerRadius = 5.0
        criticScoreSecondView.layer.shadowColor = UIColor.black.cgColor
        criticScoreSecondView.layer.shadowOpacity = 0.5
        criticScoreSecondView.layer.shadowRadius = 0.5
        criticScoreSecondView.layer.shadowOffset = CGSize.zero


        criticScoreView.layer.cornerRadius = 2.0
        criticScoreView.layer.masksToBounds = true

    }
    */


}
