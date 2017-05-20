//
//  SwitchSegue.swift
//  Aplan
//
//  Created by 区块国际－yin on 2017/5/4.
//  Copyright © 2017年 blog.aiyinyu.com. All rights reserved.
//

import UIKit

protocol SegueHandelr {
    associatedtype SegueIdentifier: RawRepresentable
}

extension SegueHandelr where Self: UIViewController, SegueIdentifier.RawValue == String {
    func segueIdentifier(for segue: UIStoryboardSegue) -> SegueIdentifier {
        guard let identifier = segue.identifier, let segueIdentifier = SegueIdentifier(rawValue: identifier) else { fatalError("UnKnown segue: \(segue)") }
        return segueIdentifier
    }
    
    func performSegue(withIdentifier segueIdentifier: SegueIdentifier) {
        performSegue(withIdentifier: segueIdentifier.rawValue, sender: nil)
    }
}

func viewController(forStoryboardName: String) -> UIViewController {
    return UIStoryboard(name: forStoryboardName, bundle: nil).instantiateInitialViewController()!
}

class TemplateImageView: UIImageView {
    @IBInspectable var templateImage: UIImage? {
        didSet {
            image = templateImage?.withRenderingMode(.alwaysTemplate)
        }
    }
}
