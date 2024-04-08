//
//  UIColorExtension.swift
//  GreenBank.UIComponents
//
//  Created by Hovo Ohanyan on 07.02.24.
//

import UIKit

public extension UIColor {
    convenience init?(hex: String) {
        var cleanedHex = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        cleanedHex = cleanedHex.replacingOccurrences(of: "#", with: "")
        cleanedHex = cleanedHex.replacingOccurrences(of: "0x", with: "")
        
        var rgbValue: UInt64 = 0
        Scanner(string: cleanedHex).scanHexInt64(&rgbValue)
        
        let red = CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0
        let green = CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0
        let blue = CGFloat(rgbValue & 0x0000FF) / 255.0
        
        self.init(red: red, green: green, blue: blue, alpha: 1.0)
    }
    
    func toHex() -> String? {
        guard let components = self.cgColor.components, components.count >= 3 else {
            return nil
        }
        
        let red = Int(components[0] * 255)
        let green = Int(components[1] * 255)
        let blue = Int(components[2] * 255)
        
        let hex = String(format: "#%02X%02X%02X", red, green, blue)
        
        return hex
    }
}
