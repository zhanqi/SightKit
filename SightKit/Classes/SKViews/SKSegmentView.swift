//
//  SKSegmentView.swift
//  SightKit
//
//  Created by 湛奇 on 2020/9/22.
//

import Foundation


/*
 let tview = SKSegmentView.init(titles: ["按钮1","按钮2","按钮3"], configBtnClosure: { (view, btn,index,text) in
     btn.csFullfill()
     btn.wTitle(text).wFont(pfr(20)).wTitleColor(.blue)
     btn.setTitleColor(.red, for: .selected)
 }, configIndiClosure: { (indicator) -> (CGFloat, CGFloat?) in
     indicator.backgroundColor = .red
     indicator.csHeight(3)
     indicator.corner(radius: 1.5)
     return (-10,30)
     return (-10,nil)
 }) { (index) in
     print(index)
 }
 tview.addTo(self.view).csFullfillHorizontal().csHeight(60).csTop(100)
 */

/// view with multi titles ,separated equally, not scrollable
open class SKSegmentView: UIView {
    
    var configBtnClosure: ((_ view:UIView, _ btn:UIButton, _ index:Int , _ text:String)->())!
    var configIndiClosure: ((_ indicator:UIView)->(CGFloat,CGFloat?))!
    var tapClosure: ((_ index:Int) -> ())?
    var titles:[String] = []
    
    /// 初始化
    /// - Parameter titles: 按钮title
    /// - Parameter configBtnClosure: 配置按钮，以及按钮和view的约束关系
    /// - Parameter configIndiClosure: 配置indicator的背景颜色 圆角，高度约束，返回（底部距离，宽度），宽度为空时设定为等与按钮宽
    /// - Parameter tapClosure: 点击block
    public convenience init(titles:[String],configBtnClosure:@escaping ((_ view:UIView, _ btn:UIButton , _ index:Int , _ text:String)->()),configIndiClosure:@escaping ((_ indicator:UIView)->(CGFloat,CGFloat?)),tapClosure:@escaping ((_ index:Int)->())){
        self.init()
        self.configBtnClosure = configBtnClosure
        self.configIndiClosure = configIndiClosure
        self.tapClosure = tapClosure
        self.titles = titles
        buildViews()
    }
    
    public var indicator = UIView()
    var csIndicatorCenterX:NSLayoutConstraint!
    var btnsArray:[UIButton] = []
    func buildViews() {
        var lastView:UIView?
        var currentView:UIView!
        var btn:UIButton!
        for i in 0...(self.titles.count-1) {
            currentView = UIView()
            self.addSubview(currentView)
            currentView.csFullfillVertical()
            if let lastView = lastView {
                currentView.cstoRightOf(view: lastView).csWidth(lastView)
            }else{
                currentView.csLeft()
            }
            if i == self.titles.count-1 {
                currentView.csRight()
            }
            
            btn = UIButton()
            btn.tag = i
            currentView.addSubview(btn)
            btn.addTarget(self, action: #selector(btnTap(btn:)), for: .touchUpInside)
            btnsArray.append(btn)
            
            self.configBtnClosure(currentView,btn,btn.tag,self.titles[i])
            
            if i == 0 {
                btn.isSelected = true
                
                self.addSubview(indicator)
                self.csIndicatorCenterX = NSLayoutConstraint.init(item: indicator, attribute: NSLayoutConstraint.Attribute.centerX, relatedBy: NSLayoutConstraint.Relation.equal, toItem: btn, attribute: NSLayoutConstraint.Attribute.centerX, multiplier: 1.0, constant: 0)
                self.csIndicatorCenterX.isActive = true
                
                let (bottomOffSet,width) = self.configIndiClosure(indicator)
                indicator.csBottom(bottomOffSet)
                //如果有给宽度 ，设置给定宽度 否则 设置等宽高度
                if let width = width {
                    indicator.csWidth(width)
                }else{
                    indicator.csWidth(btn)
                }
            }
            
            lastView = currentView;
        }
    }

    @objc func btnTap(btn:UIButton){
        btnsArray.forEach { (inbtn) in
            inbtn.isSelected = false
        }
        btn.isSelected = true
        
        self.layoutIfNeeded()
        UIView.animate(withDuration: 0.25) {
            self.csIndicatorCenterX.constant = CGFloat(btn.tag) * btn.superview!.frame.size.width
            self.layoutIfNeeded()
        }
        
        self.tapClosure?(btn.tag)
    }
}
