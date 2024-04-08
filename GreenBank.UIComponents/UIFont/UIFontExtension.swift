//
//  UIFontExtension.swift
//  GreenBank.UIComponents
//
//  Created by Er Baghdasaryan on 16.01.24.
//

import UIKit

public extension UIFont {
    
    static func SFProMedium(size: Int) -> UIFont? {
        return UIFont(name: "SFProDisplay-Medium", size: CGFloat(size))
    }
    
    static func SFProRegular(size: Int) -> UIFont? {
        return UIFont(name: "SFProText-Regular", size: CGFloat(size))
    }
    
    static func SFProSemiBold(size: Int) -> UIFont? {
        return UIFont(name: "SFProDisplay-Semibold", size: CGFloat(size))
    }
    
    static func SFProBold(size: Int) -> UIFont? {
        return UIFont(name: "SFProDisplay-Bold", size: CGFloat(size))
    }
}
