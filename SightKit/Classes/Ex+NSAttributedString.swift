//
//  NSAttributedString.swift
//  SightKit
//
//  Created by 湛奇 on 2020/9/21.
//

import Foundation

#if canImport(Foundation)
import Foundation
#endif

#if canImport(UIKit)
import UIKit
#endif

#if canImport(AppKit)
import AppKit
#endif




#if os(iOS)

public extension String {
    func toAttrStr() -> NSAttributedString {
        return NSAttributedString.init(string: self)
    }
}

public extension NSAttributedString {
    @discardableResult func wFont(font:UIFont,subStr:String? = nil) -> NSAttributedString{
        let text = subStr ?? self.string
        let attributedString = NSMutableAttributedString.init(attributedString: self)
        if text == self.string {
            attributedString.addAttribute(NSAttributedString.Key.font, value: font, range: NSRange(location: 0, length: text.count))
        }else{
            let fullStr = self.string as NSString
            attributedString.addAttribute(.font, value: font,range: fullStr.range(of: text))
        }
        return attributedString
    }
    @discardableResult func wTextColor(color:UIColor,subStr:String? = nil) -> NSAttributedString{
        let text = subStr ?? self.string
        let attributedString = NSMutableAttributedString.init(attributedString: self)
        if text == self.string {
            attributedString.addAttribute(NSAttributedString.Key.foregroundColor, value: color, range: NSRange(location: 0, length: text.count))
        }else{
            let fullStr = self.string as NSString
            attributedString.addAttribute(NSAttributedString.Key.foregroundColor, value: color, range: fullStr.range(of: text))
        }
        return attributedString
    }

}
#endif


#if os(macOS)

public extension String {
    func toAttrStr() -> NSAttributedString {
        return NSAttributedString.init(string: self)
    }
}

public extension NSAttributedString{
    @discardableResult func wFont(font:NSFont,subStr:String? = nil) -> NSAttributedString{
        let text = subStr ?? self.string
        let attributedString = NSMutableAttributedString.init(attributedString: self)
        if text == self.string {
            attributedString.addAttribute(NSAttributedString.Key.font, value: font, range: NSRange(location: 0, length: text.count))
        }else{
            let fullStr = self.string as NSString
            attributedString.addAttribute(.font, value: font,range: fullStr.range(of: text))
        }
        return attributedString
    }
    @discardableResult func wTextColor(color:NSColor,subStr:String? = nil) -> NSAttributedString{
        let text = subStr ?? self.string
        let attributedString = NSMutableAttributedString.init(attributedString: self)
        if text == self.string {
            attributedString.addAttribute(NSAttributedString.Key.foregroundColor, value: color, range: NSRange(location: 0, length: text.count))
        }else{
            let fullStr = self.string as NSString
            attributedString.addAttribute(NSAttributedString.Key.foregroundColor, value: color, range: fullStr.range(of: text))
        }
        return attributedString
    }
}
#endif
