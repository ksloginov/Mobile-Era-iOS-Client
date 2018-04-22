//
//  Utils.swift
//  Mobile Era
//
//  Created by Konstantin Loginov on 22/04/2018.
//  Copyright © 2018 FotMob. All rights reserved.
//

import Foundation
import UIKit

extension Collection where Indices.Iterator.Element == Index {
    
    subscript (safe index: Index) -> Iterator.Element? {
        return indices.contains(index) ? self[index] : nil
    }
}

public class UILabelPadding: UILabel {
    
    public var padding = UIEdgeInsets(top: 2, left: 6, bottom: 2, right: 6) {
        didSet {
            invalidateIntrinsicContentSize()
        }
    }
    
    public override func textRect(forBounds bounds: CGRect, limitedToNumberOfLines numberOfLines: Int) -> CGRect {
        let insetRect = UIEdgeInsetsInsetRect(bounds, padding)
        let textRect = super.textRect(forBounds: insetRect, limitedToNumberOfLines: numberOfLines)
        let invertedInsets = UIEdgeInsets(top: -padding.top,
                                          left: -padding.left,
                                          bottom: -padding.bottom,
                                          right: -padding.right)
        return UIEdgeInsetsInsetRect(textRect, invertedInsets)
    }
    
    public override func drawText(in rect: CGRect) {
        super.drawText(in: UIEdgeInsetsInsetRect(rect, padding))
    }
}

extension UIColor {
    public class func fromHex(_ hexValue : Int) -> UIColor {
        return fromHexA(hexValue, 1)
    }
    
    public class func fromHexA(_ hexValue : Int, _  alpha : Float) -> UIColor {
        let red = Float((hexValue & 0xFF0000) >> 16) / Float(255.0)
        let green = Float((hexValue & 0xFF00) >> 8) / Float(255.0)
        let blue = Float((hexValue & 0xFF)) / Float(255.0)
        return UIColor(red: CGFloat(red), green: CGFloat(green), blue: CGFloat(blue), alpha: CGFloat(alpha))
    }
    
    public class func fromRGB(_ r: Int, _ g: Int, _ b: Int) -> UIColor {
        return fromRGBA(r, g, b, 255)
    }
    
    public class func fromRGBA(_ r: Int, _ g: Int, _ b: Int, _ a: Int) -> UIColor {
        return  UIColor(red: CGFloat(r) / 255.0, green: CGFloat(g) / 255.0, blue: CGFloat(b) / 255.0, alpha: CGFloat(a) / 255.0)
    }
}

public class FixedBackgroundView: UIView {
    override public var backgroundColor: UIColor? {
        didSet {
            if backgroundColor?.cgColor.alpha == 0 {
                backgroundColor = oldValue
            }
        }
    }
}
