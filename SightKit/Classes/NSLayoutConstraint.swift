//
//  NSLayoutConstraint.swift
//  SightKit
//
//  Created by 湛奇 on 2020/9/20.
//

#if canImport(Foundation)
import Foundation
#endif

#if canImport(UIKit)
import UIKit
#endif

#if canImport(AppKit)
import AppKit
#endif


public enum LayoutConstraintAttribute : Int {
    case left
    
    case right
    
    case top
    
    case bottom
    
    case width
    
    case height
    
    case centerX
    
    case centerY
    
    case center //特殊处理，包含centerX和centerY
    
    var systemAttribute:NSLayoutConstraint.Attribute {
        get {
            switch self {
            case .left:
                return .left
            case .right:
                return .right
            case .top:
                return .top
            case .bottom:
                return .bottom
            case .width:
                return .width
            case .height:
                return .height
            case .centerX:
                return .centerX
            case .centerY:
                return .centerY
            default:
                return .notAnAttribute
            }
        }
    }
}


#if os(iOS)

public extension UIView {
    @discardableResult fileprivate func baseCsTo(attr:LayoutConstraintAttribute,v:UIView? = nil,attrV:LayoutConstraintAttribute? = nil,relatedBy:NSLayoutConstraint.Relation = .equal,multi:CGFloat = 1.0,constant:CGFloat = 0) -> Self{
        guard let toView = v ?? self.superview else {
            print("no another view or superView,cannot make cs")
            return self
        }
        
        self.translatesAutoresizingMaskIntoConstraints = false
        
        if attr == .center {
            return self
        }else{
            NSLayoutConstraint.init(item: self, attribute: attr.systemAttribute, relatedBy: relatedBy, toItem: toView, attribute: (attrV != nil) ? attrV!.systemAttribute : attr.systemAttribute, multiplier: multi, constant: constant).isActive = true
        }
        return self
    }
    
    @discardableResult func csLeft(_ v:UIView,value:CGFloat,multi:CGFloat) -> Self{
        return baseCsTo(attr: .left, v: v, attrV: nil, relatedBy: .equal, multi: multi, constant: value)
    }
    @discardableResult func csLeft(_ v:UIView,value:CGFloat = 0) -> Self{
        return baseCsTo(attr: .left, v: v, attrV: nil, relatedBy: .equal, multi: 1.0, constant: value)
    }
    @discardableResult func csLeft(_ value:CGFloat = 0) -> Self{
        return baseCsTo(attr: .left,constant: value)
    }

    @discardableResult func csRight(_ v:UIView,value:CGFloat,multi:CGFloat) -> Self{
        return baseCsTo(attr: .right, v: v, attrV: nil, relatedBy: .equal, multi: multi, constant: value)
    }
    @discardableResult func csRight(_ v:UIView,value:CGFloat = 0) -> Self{
        return baseCsTo(attr: .right, v: v, attrV: nil, relatedBy: .equal, multi: 1.0, constant: value)
    }
    @discardableResult func csRight(_ value:CGFloat = 0) -> Self{
        return baseCsTo(attr: .right,constant: value)
    }
    
    @discardableResult func csTop(_ v:UIView,value:CGFloat,multi:CGFloat) -> Self{
        return baseCsTo(attr: .top, v: v, attrV: nil, relatedBy: .equal, multi: multi, constant: value)
    }
    @discardableResult func csTop(_ v:UIView,value:CGFloat = 0) -> Self{
        return baseCsTo(attr: .top, v: v, attrV: nil, relatedBy: .equal, multi: 1.0, constant: value)
    }
    @discardableResult func csTop(_ value:CGFloat = 0) -> Self{
        return baseCsTo(attr: .top,constant: value)
    }
    
    @discardableResult func csBottom(_ v:UIView,value:CGFloat,multi:CGFloat) -> Self{
        return baseCsTo(attr: .bottom, v: v, attrV: nil, relatedBy: .equal, multi: multi, constant: value)
    }
    @discardableResult func csBottom(_ v:UIView,value:CGFloat = 0) -> Self{
        return baseCsTo(attr: .bottom, v: v, attrV: nil, relatedBy: .equal, multi: 1.0, constant: value)
    }
    @discardableResult func csBottom(_ value:CGFloat = 0) -> Self{
        return baseCsTo(attr: .bottom,constant: value)
    }

    @discardableResult func csCenterX(_ v:UIView,value:CGFloat,multi:CGFloat) -> Self{
        return baseCsTo(attr: .centerX, v: v, attrV: nil, relatedBy: .equal, multi: multi, constant: value)
    }
    @discardableResult func csCenterX(_ v:UIView,value:CGFloat = 0) -> Self{
        return baseCsTo(attr: .centerX, v: v, attrV: nil, relatedBy: .equal, multi: 1.0, constant: value)
    }
    @discardableResult func csCenterX(_ value:CGFloat = 0) -> Self{
        return baseCsTo(attr: .centerX,constant: value)
    }
    
    @discardableResult func csCenterY(_ v:UIView,value:CGFloat,multi:CGFloat) -> Self{
        return baseCsTo(attr: .centerY, v: v, attrV: nil, relatedBy: .equal, multi: multi, constant: value)
    }
    @discardableResult func csCenterY(_ v:UIView,value:CGFloat = 0) -> Self{
        return baseCsTo(attr: .centerY, v: v, attrV: nil, relatedBy: .equal, multi: 1.0, constant: value)
    }
    @discardableResult func csCenterY(_ value:CGFloat = 0) -> Self{
        return baseCsTo(attr: .centerY,constant: value)
    }

    @discardableResult func csCenter(_ v:UIView? = nil) -> Self{
        baseCsTo(attr: .centerX)
        baseCsTo(attr: .centerY)
        return self
    }
    
    @discardableResult func csWidth(_ v:UIView) -> Self{
        return baseCsTo(attr: .width, v: v)
    }
    @discardableResult func csWidth(_ value:CGFloat) -> Self{
        self.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.init(item: self, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: value).isActive = true
        return self
    }
    @discardableResult func csHeight(_ v:UIView) -> Self{
        return baseCsTo(attr: .height, v: v)
    }
    @discardableResult func csHeight(_ value:CGFloat) -> Self{
        self.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.init(item: self, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: value).isActive = true
        return self
    }
    @discardableResult func csWidthHeight(_ value:CGFloat) -> Self{
        self.csWidth(value).csHeight(value)
        return self
    }

    
    
    @discardableResult func cstoTopOf(view:UIView,constant:CGFloat = 0) -> Self{
        self.baseCsTo(attr: .bottom, v: view, attrV: .top, constant: constant)
        return self;
    }

    @discardableResult func cstoBottomOf(view:UIView,constant:CGFloat = 0) -> Self{
        self.baseCsTo(attr: .top, v: view, attrV: .bottom, constant: constant)
        return self;
    }
    
    @discardableResult func cstoRightOf(view:UIView,constant:CGFloat = 0) -> Self{
        self.baseCsTo(attr: .left, v: view, attrV: .right, constant: constant)
        return self;
    }
    
    @discardableResult func cstoLeftOf(view:UIView,constant:CGFloat = 0) -> Self{
        self.baseCsTo(attr: .right, v: view, attrV: .left, constant: constant)
        return self;
    }
    
    @discardableResult func csLeftRight(view:UIView? = nil,constant:CGFloat) -> Self{
        self.baseCsTo(attr: .left, v: view ?? self.superview, constant: constant)
        self.baseCsTo(attr: .right, v: view ?? self.superview,  constant: -constant)
        return self;
    }
    
    /// 用约束填满父视图
    ///
    /// - Parameter edge: 可选的设置边距
    @discardableResult func csFullfill(top:CGFloat = 0,left:CGFloat = 0,bottom:CGFloat = 0,right:CGFloat = 0) -> Self{
        guard let toView = self.superview else { return self}
        
        self.baseCsTo(attr: .top, v: toView, constant: top)
        self.baseCsTo(attr: .left, v: toView, constant: left)
        self.baseCsTo(attr: .bottom, v: toView, constant: bottom)
        self.baseCsTo(attr: .right, v: toView, constant: right)
        
        return self
    }
    
    @discardableResult func csFullfillHorizontal(v:UIView? = nil) -> Self{
        guard let toView = v ?? self.superview else { return self}
        self.csTo(attrs: .left,.right, v: toView)
        return self
    }
    @discardableResult func csFullfillVertical(v:UIView? = nil) -> Self{
        guard let toView = v ?? self.superview else { return self}
        self.csTo(attrs: .top,.bottom, v: toView)
        return self
    }
    @discardableResult func csFullFillTo(view:UIView) -> Self{
        self.baseCsTo(attr: .top, v: view, constant: 0)
        self.baseCsTo(attr: .left, v: view, constant: 0)
        self.baseCsTo(attr: .bottom, v: view, constant: 0)
        self.baseCsTo(attr: .right, v: view, constant: 0)
        return self
    }
    
    @discardableResult func csTo(attrs:LayoutConstraintAttribute...,v:UIView? = nil) -> Self{
        guard let toView = v ?? self.superview else { return self}
        
        for att in attrs {
            self.baseCsTo(attr: att, v: toView, constant: 0)
        }
        return self
    }
    
    // MARK: - greaterThanOrEqual
    @discardableResult func csHeightGreaterThanOrEqual(_ value:CGFloat) -> Self{
        self.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.init(item: self, attribute: .height, relatedBy: .greaterThanOrEqual, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant:value).isActive = true
        return self
    }
    @discardableResult func csWidthGreaterThanOrEqual(_ value:CGFloat) -> Self{
        self.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.init(item: self, attribute: .width, relatedBy: .greaterThanOrEqual, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: value).isActive = true
        return self
    }
    @discardableResult func csTopGreaterThanOrEqual(_ value:CGFloat = 0) -> Self{
        self.baseCsTo(attr: .top, v: nil, attrV: nil, relatedBy: .greaterThanOrEqual, multi: 1.0, constant: value)
        return self
    }
    @discardableResult func csLeftGreaterThanOrEqual(_ value:CGFloat = 0) -> Self{
        self.baseCsTo(attr: .left, v: nil, attrV: nil, relatedBy: .greaterThanOrEqual, multi: 1.0, constant: value)
        return self
    }
    @discardableResult func csBottomGreaterThanOrEqual(_ value:CGFloat = 0) -> Self{
        self.baseCsTo(attr: .bottom, v: nil, attrV: nil, relatedBy: .greaterThanOrEqual, multi: 1.0, constant: value)
        return self
    }
    @discardableResult func csRightGreaterThanOrEqual(_ value:CGFloat = 0) -> Self{
        self.baseCsTo(attr: .right, v: nil, attrV: nil, relatedBy: .greaterThanOrEqual, multi: 1.0, constant: value)
        return self
    }
    @discardableResult func csCenterXGreaterThanOrEqual(_ value:CGFloat = 0) -> Self{
        self.baseCsTo(attr: .centerX, v: nil, attrV: nil, relatedBy: .greaterThanOrEqual, multi: 1.0, constant: value)
        return self
    }
    @discardableResult func csCenterYGreaterThanOrEqual(_ value:CGFloat = 0) -> Self{
        self.baseCsTo(attr: .centerY, v: nil, attrV: nil, relatedBy: .greaterThanOrEqual, multi: 1.0, constant: value)
        return self
    }
    
    // MARK: - lessThanOrEqual
    @discardableResult func csHeightLessThanOrEqual(_ value:CGFloat) -> Self{
        self.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.init(item: self, attribute: .height, relatedBy: .lessThanOrEqual, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant:value).isActive = true
        return self
    }
    @discardableResult func csWidthLessThanOrEqual(_ value:CGFloat) -> Self{
        self.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.init(item: self, attribute: .width, relatedBy: .lessThanOrEqual, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: value).isActive = true
        return self
    }
    @discardableResult func csTopLessThanOrEqual(_ value:CGFloat = 0) -> Self{
        self.baseCsTo(attr: .top, v: nil, attrV: nil, relatedBy: .lessThanOrEqual, multi: 1.0, constant: value)
        return self
    }
    @discardableResult func csLeftLessThanOrEqual(_ value:CGFloat = 0) -> Self{
        self.baseCsTo(attr: .left, v: nil, attrV: nil, relatedBy: .lessThanOrEqual, multi: 1.0, constant: value)
        return self
    }
    @discardableResult func csBottomLessThanOrEqual(_ value:CGFloat = 0) -> Self{
        self.baseCsTo(attr: .bottom, v: nil, attrV: nil, relatedBy: .lessThanOrEqual, multi: 1.0, constant: value)
        return self
    }
    @discardableResult func csRightLessThanOrEqual(_ value:CGFloat = 0) -> Self{
        self.baseCsTo(attr: .right, v: nil, attrV: nil, relatedBy: .lessThanOrEqual, multi: 1.0, constant: value)
        return self
    }
    @discardableResult func csCenterXLessThanOrEqual(_ value:CGFloat = 0) -> Self{
        self.baseCsTo(attr: .centerX, v: nil, attrV: nil, relatedBy: .lessThanOrEqual, multi: 1.0, constant: value)
        return self
    }
    @discardableResult func csCenterYLessThanOrEqual(_ value:CGFloat = 0) -> Self{
        self.baseCsTo(attr: .centerY, v: nil, attrV: nil, relatedBy: .lessThanOrEqual, multi: 1.0, constant: value)
        return self
    }
    
    // MARK: - 在父视图 均分放置
    
    /// 水平均分 放置某个子view
    /// - Parameter num: 均分数量
    /// - Parameter index: 第几个view，从0开始，请填入整数
    @discardableResult func csHorizonSeperate(num:CGFloat,index:CGFloat) -> Self{
        guard index < num else {
            print("index out of range ,cannot set horizonSeperate")
            return self
        }
        self.baseCsTo(attr: .width, v: nil, attrV: .width, relatedBy: .equal, multi: 1/num, constant: 0)
        self.baseCsTo(attr: .centerX, v: nil, attrV: .centerX, relatedBy: .equal, multi: (1+index*2)/num, constant: 0)
        return self
    }
    /// 垂直均分 放置某个子view
    /// - Parameter num: 均分数量
    /// - Parameter index: 第几个view，从0开始， 请填入整数
    @discardableResult func csVerticalSeperate(num:CGFloat,index:CGFloat) -> Self{
        guard index < num else {
            print("index out of range ,cannot set verticalSeperate")
            return self
        }
        self.baseCsTo(attr: .height, v: nil, attrV: .height, relatedBy: .equal, multi: 1/num, constant: 0)
        self.baseCsTo(attr: .centerY, v: nil, attrV: .centerY, relatedBy: .equal, multi: (1+index*2)/num, constant: 0)
        return self
    }
    
    // MARK: - SafeArea 相关
    @discardableResult func csSafeAreaTop(_ value:CGFloat = 0) -> Self{
        guard let toView = self.superview else { return self }
        if #available(iOS 11.0, *) {
            self.topAnchor.constraint(equalTo: toView.safeAreaLayoutGuide.topAnchor, constant: value).isActive = true
        } else {
            self.topAnchor.constraint(equalTo: toView.topAnchor, constant: value).isActive = true
        }
        return self
    }
     @discardableResult func csSafeAreaLeft(_ value:CGFloat = 0) -> Self{
         guard let toView = self.superview else { return self }
         if #available(iOS 11.0, *) {
             self.leftAnchor.constraint(equalTo: toView.safeAreaLayoutGuide.leftAnchor, constant: value).isActive = true
         } else {
             self.leftAnchor.constraint(equalTo: toView.leftAnchor, constant: value).isActive = true
         }
         return self
     }
    @discardableResult func csSafeAreaBottom(_ value:CGFloat = 0) -> Self{
        guard let toView = self.superview else { return self }
        if #available(iOS 11.0, *) {
            self.bottomAnchor.constraint(equalTo: toView.safeAreaLayoutGuide.bottomAnchor, constant: value).isActive = true
        } else {
            self.bottomAnchor.constraint(equalTo: toView.bottomAnchor, constant: value).isActive = true
        }
        return self
    }
    @discardableResult func csSafeAreaRight(_ value:CGFloat = 0) -> Self{
        guard let toView = self.superview else { return self }
        if #available(iOS 11.0, *) {
            self.rightAnchor.constraint(equalTo: toView.safeAreaLayoutGuide.rightAnchor, constant: value).isActive = true
        } else {
            self.rightAnchor.constraint(equalTo: toView.rightAnchor, constant: value).isActive = true
        }
        return self
    }
    
    @discardableResult func csSafeAreaFullfillHorizontal() -> Self{
        return csSafeAreaLeft().csSafeAreaRight()
    }
    @discardableResult func csSafeAreaFullfillVertical() -> Self{
        return csSafeAreaTop().csSafeAreaBottom()
    }
    @discardableResult func csSafeAreaFullFill() -> Self{
        return csSafeAreaFullfillHorizontal().csSafeAreaFullfillVertical()
    }
    
    
    @discardableResult func csSafeAreaTopGreaterThanOrEqual(_ value:CGFloat = 0) -> Self{
        guard let toView = self.superview else { return self }
        if #available(iOS 11.0, *) {
            self.topAnchor.constraint(greaterThanOrEqualTo: toView.safeAreaLayoutGuide.topAnchor, constant: value).isActive = true
        } else {
            self.topAnchor.constraint(greaterThanOrEqualTo: toView.topAnchor, constant: value).isActive = true
        }
        return self
    }
    @discardableResult func csSafeAreaLeftGreaterThanOrEqual(_ value:CGFloat = 0) -> Self{
        guard let toView = self.superview else { return self }
        if #available(iOS 11.0, *) {
            self.leftAnchor.constraint(greaterThanOrEqualTo: toView.safeAreaLayoutGuide.leftAnchor, constant: value).isActive = true
        } else {
            self.leftAnchor.constraint(greaterThanOrEqualTo: toView.leftAnchor, constant: value).isActive = true
        }
        return self
    }
    @discardableResult func csSafeAreaBottomGreaterThanOrEqual(_ value:CGFloat = 0) -> Self{
        guard let toView = self.superview else { return self }
        if #available(iOS 11.0, *) {
            self.bottomAnchor.constraint(greaterThanOrEqualTo: toView.safeAreaLayoutGuide.bottomAnchor, constant: value).isActive = true
        } else {
            self.bottomAnchor.constraint(greaterThanOrEqualTo: toView.bottomAnchor, constant: value).isActive = true
        }
        return self
    }
    @discardableResult func csSafeAreaRightGreaterThanOrEqual(_ value:CGFloat = 0) -> Self{
        guard let toView = self.superview else { return self }
        if #available(iOS 11.0, *) {
            self.rightAnchor.constraint(greaterThanOrEqualTo: toView.safeAreaLayoutGuide.rightAnchor, constant: value).isActive = true
        } else {
            self.rightAnchor.constraint(greaterThanOrEqualTo: toView.rightAnchor, constant: value).isActive = true
        }
        return self
    }

    @discardableResult func csSafeAreaTopLessThanOrEqual(_ value:CGFloat = 0) -> Self{
        guard let toView = self.superview else { return self }
        if #available(iOS 11.0, *) {
            self.topAnchor.constraint(lessThanOrEqualTo: toView.safeAreaLayoutGuide.topAnchor, constant: value).isActive = true
        } else {
            self.topAnchor.constraint(lessThanOrEqualTo: toView.topAnchor, constant: value).isActive = true
        }
        return self
    }
     @discardableResult func csSafeAreaLeftLessThanOrEqual(_ value:CGFloat = 0) -> Self{
         guard let toView = self.superview else { return self }
         if #available(iOS 11.0, *) {
             self.leftAnchor.constraint(lessThanOrEqualTo: toView.safeAreaLayoutGuide.leftAnchor, constant: value).isActive = true
         } else {
             self.leftAnchor.constraint(lessThanOrEqualTo: toView.leftAnchor, constant: value).isActive = true
         }
         return self
     }
    @discardableResult func csSafeAreaBottomLessThanOrEqual(_ value:CGFloat = 0) -> Self{
        guard let toView = self.superview else { return self }
        if #available(iOS 11.0, *) {
            self.bottomAnchor.constraint(lessThanOrEqualTo: toView.safeAreaLayoutGuide.bottomAnchor, constant: value).isActive = true
        } else {
            self.bottomAnchor.constraint(lessThanOrEqualTo: toView.bottomAnchor, constant: value).isActive = true
        }
        return self
    }
    @discardableResult func csSafeAreaRightLessThanOrEqual(_ value:CGFloat = 0) -> Self{
        guard let toView = self.superview else { return self }
        if #available(iOS 11.0, *) {
            self.rightAnchor.constraint(lessThanOrEqualTo: toView.safeAreaLayoutGuide.rightAnchor, constant: value).isActive = true
        } else {
            self.rightAnchor.constraint(lessThanOrEqualTo: toView.rightAnchor, constant: value).isActive = true
        }
        return self
    }
}

#endif

