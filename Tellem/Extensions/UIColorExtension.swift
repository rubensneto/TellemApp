//
//  UIColorExtension.swift
//  Tellem
//
//  Created by User on 16/12/2018.
//  Copyright © 2018 Rubens Neto. All rights reserved.
//

import UIKit

extension UIColor {
    
    struct Tellem {
        static let lightGray = UIColor.lightGray
        static let superLightGray = UIColor(rgbColorCodeRed: 235, green: 235, blue: 235, alpha: 1)
        static let green = UIColor(rgbColorCodeRed: 80, green: 191, blue: 88, alpha: 1)
        static let superLightGreen = UIColor(rgbColorCodeRed: 204, green: 254, blue: 204, alpha: 1)
        static let red = UIColor.red
        static let white = UIColor.white
        static let blue = UIColor(rgbColorCodeRed: 7, green: 109, blue: 240, alpha: 1)
        static let superLightBlue = UIColor(rgbColorCodeRed: 218, green: 233, blue: 253, alpha: 1)
    }
    
    convenience init(rgbColorCodeRed red: Int, green: Int, blue: Int, alpha: CGFloat) {
        let redPart: CGFloat = CGFloat(red) / 255
        let greenPart: CGFloat = CGFloat(green) / 255
        let bluePart: CGFloat = CGFloat(blue) / 255
        
        self.init(red: redPart, green: greenPart, blue: bluePart, alpha: alpha)
    }
}
