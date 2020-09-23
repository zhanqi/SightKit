//
//  UILabel.swift
//  SightKit
//
//  Created by 湛奇 on 2020/9/21.
//

import Foundation


public extension UILabel{
    /// 快捷初始化方法
    convenience init(color: UIColor,font: UIFont,text:String? = nil){
        self.init()
        self.textColor = color
        self.font = font
        self.text = text
    }
    
    @discardableResult func wFont(_ font:UIFont?) -> UILabel{
        self.font = font
        return self
    }
    
    @discardableResult func wTextColor(_ color:UIColor?) -> UILabel{
        self.textColor = color
        return self
    }
    
    @discardableResult func wText(_ text:String?) -> UILabel{
        self.text = text
        return self
    }
    
    @discardableResult func wTextAlignment(_ textAlignment:NSTextAlignment = .left) -> UILabel{
        self.textAlignment = textAlignment
        return self
    }
    
    @discardableResult func wNumberOfLines(_ numberOfLines:Int = 1) -> UILabel{
        self.numberOfLines = numberOfLines
        return self
    }
    
    /// create UILabel with features (UIColor,UIFont,String,UIView,NSTextAlignment,Int)
    /// - UIColor  .textColor
    /// - UIFont  .font
    /// - String  .text
    /// - UIView  .addToSuperView
    /// - NSTextAlignment  .textAlignment
    /// - Int  .numberOfLines
    /// - Parameter features: UIColor ,UIFont,String,UIView ,NSTextAlignment,Int
    @discardableResult func wFeatures(_ features:Any?...) -> UILabel{
        for fea in features {
            if fea is UIColor {
                self.wTextColor(fea as? UIColor)
            }
            if fea is UIFont {
                self.wFont(fea as? UIFont)
            }
            if fea is String {
                self.wText(fea as? String)
            }
            if fea is UIView {
                self.addTo(fea as! UIView)
            }
            if fea is NSTextAlignment {
                self.wTextAlignment(fea as! NSTextAlignment)
            }
            if fea is Int {
                self.wNumberOfLines(fea as! Int)
            }
        }
        return self
    }
    
    // MARK: - 其他属性
    @discardableResult func wHighlightedTextColor(_ color:UIColor?) -> UILabel{
        self.highlightedTextColor = color
        return self
    }
}


public extension UILabel{
    /// SwifterSwift: Required height for a label
    var requiredHeight: CGFloat {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: frame.width, height: CGFloat.greatestFiniteMagnitude))
        label.numberOfLines = 0
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.font = font
        label.text = text
        label.attributedText = attributedText
        label.sizeToFit()
        return label.frame.height
    }
}

public extension UILabel {

    var isTruncated: Bool {

        guard let labelText = text else {
            return false
        }

        let labelTextSize = (labelText as NSString).boundingRect(
            with: CGSize(width: frame.size.width, height: .greatestFiniteMagnitude),
            options: .usesLineFragmentOrigin,
            attributes: [.font: font!],
            context: nil).size

        return labelTextSize.height > bounds.size.height
    }
}
