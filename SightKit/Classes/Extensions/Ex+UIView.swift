//
//  UIView.swift
//  SightKit
//
//  Created by 湛奇 on 2020/9/21.
//

import Foundation

// MARK: - 快捷创建 属性 添加
public extension UIView {
    
    @discardableResult func wBgColor(_ color:UIColor?) -> Self{
        self.backgroundColor = color
        return self
    }
    @discardableResult func wFrame(_ frame:CGRect) -> Self{
        self.frame = frame
        return self
    }
    @discardableResult func wAlpha(_ alpha:CGFloat) -> Self{
        self.alpha = alpha
        return self
    }
    @discardableResult func wTag(_ tag:Int) -> Self{
        self.tag = tag
        return self
    }

    @discardableResult func addTo(_ fatherView:UIView) -> Self{
        fatherView.addSubview(self)
        return self
    }
}

// MARK: - 移除所有 subviews
public extension UIView{
    func removeAllSubviews(){
        subviews.forEach({ $0.removeFromSuperview() })
    }
}


// MARK: - 获取first responder
public extension UIView {
    /// 获取first responder
    func firstResponder() -> UIView? {
        var views = [UIView](arrayLiteral: self)
        var index = 0
        repeat {
            let view = views[index]
            if view.isFirstResponder {
                return view
            }
            views.append(contentsOf: view.subviews)
            index += 1
        } while index < views.count
        return nil
    }
}


// MARK: - 圆角 带颜色的边
public extension UIView{
    
    /// 设置圆角
    @discardableResult func corner(radius:CGFloat) -> Self{
        self.layer.masksToBounds = true
        self.layer.cornerRadius = radius
        return self
    }
    
    /// 设置边
    @discardableResult func border(width:CGFloat,color:UIColor) -> Self{
        self.layer.masksToBounds = true
        self.layer.borderWidth = width
        self.layer.borderColor = color.cgColor
        return self
    }
    
    /// 设置圆角和阴影 make sure the view's backgroundColor is not clear color, then this method will work.
    @discardableResult func corner(radius:CGFloat,shadowColor:UIColor,shadowOffset:CGSize,shadowOpacity:Float,shadowRadius:CGFloat) -> Self {
        layer.cornerRadius = radius
        layer.shadowColor = shadowColor.cgColor;
        layer.shadowOffset = shadowOffset
        layer.shadowOpacity = shadowOpacity;
        layer.shadowRadius = shadowRadius;
        return self
    }
        
    /// 添加阴影,make sure the view's backgroundColor is not clear color, then this method will work.
    ///
    /// - Parameters:
    ///   - color: shadow color (default is #137992).
    ///   - radius: shadow radius (default is 3).
    ///   - offset: shadow offset (default is .zero).
    ///   - opacity: shadow opacity (default is 0.5).
    func addShadow(ofColor color: UIColor = UIColor(red: 0.12, green: 0.12, blue: 0.12, alpha: 0.5), radius: CGFloat = 5, offset: CGSize = CGSize(width: 2, height: 2), opacity: Float = 0.3) {
        layer.shadowColor = color.cgColor
        layer.shadowOffset = offset
        layer.shadowRadius = radius
        layer.shadowOpacity = opacity
        layer.masksToBounds = false
    }
}

// MARK: - 找到view所在的vc
public extension UIView {
    
    /// 找到view所在的vc
    var viewController: UIViewController? {
        var parent: UIResponder? = self
        while parent != nil {
            parent = parent?.next
            if let viewController = parent as? UIViewController {
                return viewController
            }
        }
        return nil
    }
}

// MARK: - 截屏图片
public extension UIView {
    
    /// 截屏图片
    var snapShot: UIImage? {
        UIGraphicsBeginImageContextWithOptions(layer.frame.size, false, 0)
        defer {
            UIGraphicsEndImageContext()
        }
        guard let context = UIGraphicsGetCurrentContext() else { return nil }
        layer.render(in: context)
        return UIGraphicsGetImageFromCurrentImageContext()
    }
}

// MARK: - gradient渐变
public extension UIView {
    
    func addGradient(startColor: UIColor,endColor: UIColor,startPoint:CGPoint,endPoint:CGPoint) {
        guard let superView = self.superview else {
            print("no superview , addGradient() faild")
            return
        }
        let gView = UIGradientView()
        superView.insertSubview(gView, belowSubview: self)
        gView.csFullFillTo(view: self)
        gView.layer.masksToBounds = self.layer.masksToBounds;
        gView.layer.cornerRadius = self.layer.cornerRadius;
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [startColor.cgColor,endColor.cgColor]
        gradientLayer.locations = [0,1.0]
        gradientLayer.startPoint = startPoint
        gradientLayer.endPoint = endPoint
        gradientLayer.frame = gView.bounds;
        gView.layer.addSublayer(gradientLayer)
        gView.gradientLayer = gradientLayer;
    }
    /// 添加渐变
    func addGradient(startColor: UIColor,endColor: UIColor,isVertical:Bool) {
        if isVertical {
            addGradient(startColor: startColor, endColor: endColor, startPoint: CGPoint(x: 0, y: 0), endPoint: CGPoint(x: 0, y: 1))
        }else{
            addGradient(startColor: startColor, endColor: endColor, startPoint: CGPoint(x: 0, y: 0), endPoint: CGPoint(x: 1, y: 0))
        }
    }
}
open class UIGradientView: UIView {
    var gradientLayer:CAGradientLayer!
    override open func layoutSubviews() {
        super.layoutSubviews()
        self.gradientLayer.frame = self.bounds
    }
}

// MARK: - 获取 创建 指定tag的子view
public extension UIView {
    typealias tagViewClosure = ()->UIView
    
    /// 返回指定tag的子view
    ///
    /// - Parameters:
    ///   - tag: tag of the subView
    ///   - creatClosure: if the sbuView with tag not exist,create in this closure,dont forget to set the right tag in the closure
    /// - Returns: the view with the tag
    func viewWithTag(tag:Int,creatClosure:tagViewClosure) -> UIView {
        return self.viewWithTag(tag) ?? creatClosure()
    }
}


// MARK: - 设置部分或全部圆角
public extension UIView{
    /// 部分或全部圆角，在设置约束之后调用即可生效
    ///
    /// - Parameters:
    ///   - corners: array of corners to change (example: [.bottomLeft, .topRight]).
    ///   - radius: radius for selected corners.
    @discardableResult func roundCorners(_ corners: UIRectCorner, radius: CGFloat) -> Self{
        self.layoutIfNeeded() //这句使得本方法适用于约束
        
        let maskPath = UIBezierPath(
            roundedRect: bounds,
            byRoundingCorners: corners,
            cornerRadii: CGSize(width: radius, height: radius))
        
        let shape = CAShapeLayer()
        shape.path = maskPath.cgPath
        layer.mask = shape
        
        return self
    }
}

// MARK: - 添加若干个圆角的背景图
public extension UIView {
    func addCornerBg(corners:UIRectCorner,bgColor:UIColor,radius:CGFloat){
        guard let superView = self.superview else { return }
        let cView = CornerBgView()
        superView.insertSubview(cView, belowSubview: self)
        cView.csFullFillTo(view: self)
        
        cView.backgroundColor = bgColor
        cView.corners = corners
        cView.radius = radius
    }
}
open class CornerBgView : UIView {
    var radius:CGFloat = 0
    var corners:UIRectCorner = []
    
    open override func draw(_ rect: CGRect) {
        let maskPath = UIBezierPath(
            roundedRect: bounds,
            byRoundingCorners: corners,
            cornerRadii: CGSize(width: radius, height: radius))
        
        let shape = CAShapeLayer()
        shape.path = maskPath.cgPath
        layer.mask = shape
    }
}


public extension UIView {
    
    /// divide the view  horizontally equally with several subviews
    /// - Parameters:
    ///   - num: number of subviews
    ///   - viewEnum: closure to config the subview
    /// - Returns: self
    func divideHorizon(num:Int,viewEnum:((_ subView:UIView,_ index:Int)->())){
        guard num > 0 else {
            return
        }
        
        for i in 0...num-1 {
            let view = UIView().addTo(self).csFullfillVertical().csHorizonSeperate(num: CGFloat(num), index: Int(i))
            viewEnum(view,i)
        }
    }
    /// divide the view  vertically equally with several subviews
    /// - Parameters:
    ///   - num: number of subviews
    ///   - viewEnum: closure to config the subview
    /// - Returns: self
    func divideVertical(num:Int,viewEnum:((_ subView:UIView,_ index:Int)->())){
        guard num > 0 else {
            return
        }
        
        for i in 0...num-1 {
            let view = UIView().addTo(self).csFullfillHorizontal().csVerticalSeperate(num: CGFloat(num), index: Int(i))
            viewEnum(view,i)
        }
    }
}
