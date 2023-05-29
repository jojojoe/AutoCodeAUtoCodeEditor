//
//  AUtoExtension.swift
//  AUtoCodeEditor
//
//  Created by JOJO on 2023/5/29.
//

import UIKit

class AUtoExtension: NSObject {

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





