//
//  ThemeColor.swift
//  Bangpa
//
//  Created by 이동건 on 31/07/2018.
//  Copyright © 2018 이동건. All rights reserved.
//

import UIKit

extension UIColor {
    convenience init(hex: Int){
        self.init(red: CGFloat((hex & 0xFF0000) >> 16) / 255.0, green: CGFloat((hex & 0x00FF00) >> 8) / 255.0, blue: CGFloat(hex & 0x0000FF) / 255.0, alpha: 1)
    }
    
    static var themeOrange: UIColor {
        return UIColor(hex: 0xf5a623)
    }
    
    static var footerColor: UIColor {
        return UIColor(red: 242/255.0, green: 242/255.0, blue: 242/255.0, alpha: 1)
    }
    
    static var themeBlue: UIColor {
        return UIColor(red: 17/255.0, green: 99/255.0, blue: 251/255.0, alpha: 1)
    }
}
