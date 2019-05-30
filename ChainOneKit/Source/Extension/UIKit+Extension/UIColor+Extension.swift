//
//  UIColor+Extension.swift
//  SwiftKit-XiaoDe
//
//  Created by 小唐 on 25/06/2018.
//  Copyright © 2018 ChainOne. All rights reserved.
//
//  UIColor的扩展

import Foundation
import UIKit

// MARK: - Initialization Function

public extension UIColor {
    convenience init(red: Int, green: Int, blue: Int, alpha: CGFloat = 1.0) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")

        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: alpha)
    }
    convenience init(R red: UInt8, G green: UInt8, B blue: UInt8, A alapha: CGFloat = 1.0) {
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: alapha)
    }

    convenience init(hex: Int, alpha: CGFloat = 1.0) {
        self.init(red: CGFloat((hex >> 16) & 0xff) / 255.0, green: CGFloat((hex >> 8) & 0xff) / 255.0, blue: CGFloat(hex & 0xff) / 255.0, alpha: alpha)
    }
}

// MARK: - Random
public extension UIColor {
    static var random: UIColor {
        return UIColor.randomColor()
    }

    // randomColor
    class func randomColor() -> UIColor {
        let randR = CGFloat(arc4random_uniform(256)) / CGFloat(255.0)
        let randG = CGFloat(arc4random_uniform(256)) / CGFloat(255.0)
        let randB = CGFloat(arc4random_uniform(256)) / CGFloat(255.0)
        let randA = CGFloat(arc4random_uniform(256)) / CGFloat(255.0)

        return UIColor(red: randR, green: randG, blue: randB, alpha: randA)
    }
}
