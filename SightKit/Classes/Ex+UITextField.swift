//
//  Ex+UITextField.swift
//  SightKit
//
//  Created by 湛奇 on 2020/9/21.
//

import Foundation

public extension UITextField {
    
    /// 仅仅判断 text是否不为空且长度大于0
    func hasText() -> Bool {
        if let text = self.text {
            if text.count > 0 {
                return true
            }
        }
        return false
    }
}

public extension UITextField {
    @discardableResult func wFont(_ font:UIFont?) -> UITextField {
        self.font = font
        return self
    }
    
    @discardableResult func wTextColor(_ color:UIColor?) -> UITextField {
        self.textColor = color
        return self
    }
    
    /// 设置 placeholder ，字体 颜色
    @discardableResult func wPlaceholder(text:String,color:UIColor,font:UIFont) -> UITextField{
        let attrStr = NSMutableAttributedString.init(string: text)
        attrStr.addAttribute(NSAttributedString.Key.font, value: font, range: NSRange(location: 0, length: text.count))
        attrStr.addAttribute(NSAttributedString.Key.foregroundColor, value: color, range: NSRange(location: 0, length: text.count))
        self.attributedPlaceholder = attrStr
        return self
    }
    
    /// create UI with features
    /// - UIColor  .textColor
    /// - UIFont  .font
    /// - String  .placeholder
    /// - UIView  .addToSuperView
    /// - Parameter features: UIColor ,UIFont,String,UIView
    @discardableResult func wFeatures(_ features:Any?...) -> UITextField{
        for fea in features {
            if fea is UIColor {
                self.wTextColor(fea as? UIColor)
            }
            if fea is UIFont {
                self.wFont(fea as? UIFont)
            }
            if fea is String {
                self.placeholder = fea as? String
            }
            if fea is UIView {
                self.addTo(fea as! UIView)
            }
        }
        return self
    }
    
    /// 是居中还是填满
    enum TextFieldLeftRightFillWay {
        case center,fullFill
    }
    @discardableResult func wLeftView(view:UIView, width:CGFloat,fillWay:TextFieldLeftRightFillWay) -> UITextField {
        self.setLeftPadding(width)
        
        if fillWay == .center {
            view.addTo(self).csCenterY()
            NSLayoutConstraint.init(item: view, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .left, multiplier: 1.0, constant: width/2).isActive = true
        }else{
            view.addTo(self).csFullfillVertical().csLeft().csWidth(width)
        }
        return self
    }
    @discardableResult func wRightView(view:UIView, width:CGFloat,fillWay:TextFieldLeftRightFillWay) -> UITextField {
        self.setRightPadding(width)
        
        if fillWay == .center {
            view.addTo(self).csCenterY()
            NSLayoutConstraint.init(item: view, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .right, multiplier: 1.0, constant: -width/2).isActive = true
        }else{
            view.addTo(self).csFullfillVertical().csRight().csWidth(width)
        }
        return self
    }
}


public extension UITextField {
    
    /// 是否合格的邮件地址
    var hasValidEmail: Bool {
        return text!.range(of: "(?:[a-z0-9!#$%\\&'*+/=?\\^_`{|}~-]+(?:\\.[a-z0-9!#$%\\&'*+/=?\\^_`{|}" +
            "~-]+)*|\"(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21\\x23-\\x5b\\x5d-\\" +
            "x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])*\")@(?:(?:[a-z0-9](?:[a-" +
            "z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\\[(?:(?:25[0-5" +
            "]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-" +
            "9][0-9]?|[a-z0-9-]*[a-z0-9]:(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21" +
            "-\\x5a\\x53-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])+)\\])",
                           options: String.CompareOptions.regularExpression,
                           range: nil, locale: nil) != nil
    }
}


public extension UITextField {
    
    /// 设置左边偏移距离
    func setLeftPadding(_ amount:CGFloat){
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: 1))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
    
    /// 设置右边偏移距离
    func setRightPadding(_ amount:CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: 1))
        self.rightView = paddingView
        self.rightViewMode = .always
    }
}

public extension UITextField {
    
    /// 唤起键盘时，键盘上方添加完成按钮  .inputView 可以使得不唤起键盘 而是唤起 一个自定义的view
    @IBInspectable var doneAccessory: Bool{
        get{
            return self.doneAccessory
        }
        set(hasDone){
            if hasDone{
                addDoneButtonOnKeyboard()
            }
        }
    }
    
    /// 唤起键盘时，键盘上方添加完成按钮 .inputView 可以使得不唤起键盘 而是唤起 一个自定义的view
    fileprivate func addDoneButtonOnKeyboard()
    {
        let doneToolbar: UIToolbar = UIToolbar(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 50))
        doneToolbar.barStyle = .default
        
        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        
        let done: UIBarButtonItem = UIBarButtonItem.init(barButtonSystemItem: .done, target: self, action: #selector(self.doneButtonAction))
        
        let items = [flexSpace, done]
        doneToolbar.items = items
        doneToolbar.sizeToFit()
        
        self.inputAccessoryView = doneToolbar
    }
    
    @objc func doneButtonAction(){
        self.resignFirstResponder()
    }
}

extension UITextField {
    
    /// 使得输入框依次唤起键盘 使用举例：UITextField.connectAllTxtFieldFields(txtfields: [txtField, txtField2, txtField3])
    class func connectAllTxtFieldFields(txtfields:[UITextField]) -> Void {
        guard let last = txtfields.last else {
            return
        }
        for i in 0 ..< txtfields.count - 1 {
            txtfields[i].returnKeyType = .next
            txtfields[i].addTarget(txtfields[i+1], action: #selector(UIResponder.becomeFirstResponder), for: .editingDidEndOnExit)
        }
        last.returnKeyType = .done
        last.addTarget(last, action: #selector(UIResponder.resignFirstResponder), for: .editingDidEndOnExit)
    }
}


private var KeyMaxLength: Int = 0
public extension UITextField {
    
    /// 最大允许输入长度
    @IBInspectable var maxLength: Int {
        get {
            if let length = objc_getAssociatedObject(self, &KeyMaxLength) as? Int {
                return length
            } else {
                return Int.max
            }
        }
        set {
            objc_setAssociatedObject(self, &KeyMaxLength, newValue, .OBJC_ASSOCIATION_RETAIN)
            addTarget(self, action: #selector(checkMaxLength), for: .editingChanged)
        }
    }
    
    @objc func checkMaxLength(textField: UITextField) {
        guard let prospectiveText = self.text,
            prospectiveText.count > maxLength
            else {
                return
        }
        
        let selection = selectedTextRange
        let maxCharIndex = prospectiveText.index(prospectiveText.startIndex, offsetBy: maxLength)
        text = String.init(prospectiveText.prefix(upTo: maxCharIndex))
        selectedTextRange = selection
    }
}


// MARK: - Block方式 获取 输入文字变化
public typealias UITextFieldTargetClosure = (UITextField) -> ()
open class TextFieldClosureWrapper: NSObject {
    let closure: UITextFieldTargetClosure
    init(_ closure: @escaping UITextFieldTargetClosure) {
        self.closure = closure
    }
}
public extension UITextField {
    private struct AssociatedKeys {
        static var targetClosure = "targetClosure"
    }
    
    private var targetClosure: UITextFieldTargetClosure? {
        get {
            guard let closureWrapper = objc_getAssociatedObject(self, &AssociatedKeys.targetClosure) as? TextFieldClosureWrapper else { return nil }
            return closureWrapper.closure
        }
        set(newValue) {
            guard let newValue = newValue else { return }
            objc_setAssociatedObject(self, &AssociatedKeys.targetClosure, TextFieldClosureWrapper(newValue), objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    /// block方式点击回调
    func addTargetClosure(closure: @escaping UITextFieldTargetClosure) {
        targetClosure = closure
        addTarget(self, action: #selector(closureAction), for: .editingChanged)
    }
    
    @objc func closureAction() {
        guard let targetClosure = targetClosure else { return }
        targetClosure(self)
    }
}

