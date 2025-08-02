//
//  UIFont+Extension.swift
//  Breaking News
//
//  Created by Hüseyin BAKAR on 1.08.2025.
//

import UIKit

extension UIFont {
    
    public enum ReadexFont: String {
        case bold = "-Bold"
        case medium = "-Medium"
        case regular = "-Regular"
        case semibold = "-SemiBold"
    }
    
    static func Readex(_ type: ReadexFont = .regular, size: CGFloat = UIFont.systemFontSize) -> UIFont {
        return UIFont(name: "ReadexPro\(type.rawValue)", size: size) ?? UIFont.systemFont(ofSize: size)
    }
    
    var isBold: Bool {
        return fontDescriptor.symbolicTraits.contains(.traitBold)
    }
    
    var isItalic: Bool {
        return fontDescriptor.symbolicTraits.contains(.traitItalic)
    }
}
