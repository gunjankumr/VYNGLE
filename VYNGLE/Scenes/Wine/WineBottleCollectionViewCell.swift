//
//  WineBottleCollectionViewCell.swift
//  VYNGLE
//
//  Created by Sujeet on 9/7/17.
//  Copyright © 2017 VYNGLE. All rights reserved.
//

import UIKit

class WineBottleCollectionViewCell: UICollectionViewCell {
    @IBOutlet var viewBottleMain: CardView?
    @IBOutlet weak var viewBottleBottom: CardView?
    @IBOutlet weak var imgviewBottleMain: UIImageView!
    
    @IBOutlet weak var lblDiscountedPrice: UILabel!
    @IBOutlet weak var lblActualPrice: UILabel!
    @IBOutlet weak var lblBottleFlag: UILabel!
    @IBOutlet weak var lblBottleWineName: UILabel!

    
}
