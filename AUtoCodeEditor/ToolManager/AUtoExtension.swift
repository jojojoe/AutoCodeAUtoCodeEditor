//
//  AUtoExtension.swift
//  AUtoCodeEditor
//
//  Created by JOJO on 2023/5/29.
//

import UIKit

class AUtoExtension: NSObject {
    static let leftStr: String = "left"
    static let centerStr: String = "center"
    static let rightStr: String = "right"
}

enum FontCusNames: String {
    case SFProRegular = "SFProText-Regular"
    case SFProMedium = "SFProText-Medium"
    case SFProSemiBold = "SFProText-Semibold"
    case SFProBold = "SFProText-Bold"
    case MontLight = "Montserrat-Light"
    case MontRegular = "Montserrat-Regular"
    case MontMedium = "Montserrat-Medium"
    case MontSemiBold = "Montserrat-SemiBold"
    case MontBold = "Montserrat-Bold"
    
    
    func font(sizePoint: CGFloat) -> UIFont {
        return UIFont(name: rawValue, size: sizePoint) ?? UIFont.systemFont(ofSize: sizePoint)
    }
}


enum ColorTool: String {
    case ColorClear = "#FFFFFF00"
    case ColorF0F0F0 = "#F0F0F0"
    case Color000000 = "#000000"
    case ColorFFFFFF = "#FFFFFF"
    case ColorD9D9D9 = "#D9D9D9"
    
    func color() -> UIColor {
        return UIColor(hexString: self.rawValue) ?? UIColor.white
    }
}

extension UIColor {
    func toHexString() -> String {
        if let components = self.cgColor.components {
            let r = Float(components[0])
            let g = Float(components[1])
            let b = Float(components[2])
            let hexString = String(format: "%02X%02X%02X", Int(r * 255), Int(g * 255), Int(b * 255))
            return "#\(hexString)"
        }
        return ""
    }
}



