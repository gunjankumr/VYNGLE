//
//  CommonMethods.swift
//  VYNGLE
//
//  Created by Sujeet on 8/26/17.
//  Copyright © 2017 Sujeet. All rights reserved.
//

import Foundation
import UIKit

class CommonMethods {
    func makeButtonRound(btn: UIButton) -> UIButton {
        btn.layer.cornerRadius = 0.5 * btn.bounds.size.width
        btn.clipsToBounds = true
        return btn
    }

    func alertWithOneButton(title: String, errorText: String, btnTitle: String, currentViewController: UIViewController) {
        let alert = UIAlertController(title: title, message: errorText, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: btnTitle, style: .default))
        currentViewController.present(alert, animated: true, completion: nil)
    }
    func alertWithTwoButtons(title: String, errorText: String, btnTitle1: String, btnTitle2: String, currentViewController: UIViewController, handler :@escaping(UIAlertAction) -> Void) {
        let alert = UIAlertController(title: title, message: errorText, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: btnTitle1, style: .default, handler: nil))
        alert.addAction(UIAlertAction(title: btnTitle2, style: .default, handler: handler))
        currentViewController.present(alert, animated: true, completion: nil)
    }
}

