//
//  SKSegmentView.swift
//  SightKit
//
//  Created by 湛奇 on 2020/9/22.
//

import Foundation

open class SKSegmentView: UIView {
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        buildViews()
    }
    var titles:[String] = []
    var normalColor:UIColor = UIColor.lightGray
    var selectColor:UIColor = UIColor.black
    var normalFont:UIFont = UIFont.init(name: "PingFangSC-Regular", size: 15)!
    var selectFont:UIFont = UIFont.init(name: "PingFangSC-Medium", size: 17)!
    
    var scrollView:UIScrollView!
    var contentView:UIView!
    var rightBtn:UIButton!
    
    var btns:[UIButton]! = []
    var selectBtn:UIButton?
    
    var titleTapClosure:((_ index:Int)->Void)?
    var rightTapClosure:(()->Void)?
    func buildViews() {
        scrollView = UIScrollView()
        self.addSubview(scrollView)
        scrollView.csTo(attrs: .left,.top,.bottom)
        scrollView.showsHorizontalScrollIndicator = false
        
        contentView = UIView()
        scrollView.addSubview(contentView)
        contentView.csFullfill().csHeight(self)
        
        rightBtn = UIButton()
        self.addSubview(rightBtn)
        rightBtn.csTo(attrs: .top,.right,.bottom).csWidth(60).cstoRightOf(view: scrollView)
        rightBtn.addTarget(self, action: #selector(rightTap), for: .touchUpInside)
        
        let line = UIView.init()
        line.backgroundColor = .lightGray
        self.addSubview(line)
        line.csTo(attrs: .left,.bottom,.right)
        line.csHeight(0.5)
    }
    
    @objc func rightTap(){
        self.rightTapClosure?()
    }
    
    public func setTitles(titles:[String],titleTap:@escaping ((_ index:Int)->Void),rightTap:@escaping (()->Void)){
        guard titles.count > 0 else {
            print("titles is empty")
            return
        }
        self.titleTapClosure = titleTap
        self.rightTapClosure = rightTap
        
        contentView.removeAllSubviews()
        selectBtn = nil
        
        self.titles = titles
        var lastBtn:UIButton?
        for (i,str) in titles.enumerated() {
            let btn = UIButton()
            btn.setTitle(str, for: .normal)
            btn.setTitleColor(normalColor, for: .normal)
            btn.setTitleColor(selectColor, for: .selected)
            btn.titleLabel?.font = normalFont
            btn.tag = i
            
            btn.addTarget(self, action: #selector(titleTap(btn:)), for: .touchUpInside)
            if i == 0 {
                btn.isSelected = true
                btn.titleLabel?.font = selectFont
                selectBtn = btn
            }
            
            contentView.addSubview(btn)
            btn.csTo(attrs: .top,.bottom)
            if lastBtn == nil {
                btn.csLeft()
            }else{
                btn.cstoRightOf(view: lastBtn!)
            }
            if i == titles.count-1{
                btn.csRight()
            }
            btn.csWidth(btn.intrinsicContentSize.width+20)
            
            btns.append(btn)
            lastBtn = btn
        }
    }
    
    @objc func titleTap(btn:UIButton){
        if selectBtn?.tag == btn.tag { return }
        
        selectBtn?.isSelected = false
        selectBtn?.titleLabel?.font = normalFont
        
        selectBtn = btn
        selectBtn?.isSelected = true
        selectBtn?.titleLabel?.font = selectFont
        
        //防止左右滚动越界
        var toX = btn.frame.origin.x-scrollView.frame.size.width/2+btn.frame.size.width/2
        toX = max(0, toX)
        if toX+scrollView.frame.size.width > scrollView.contentSize.width {
            toX = scrollView.contentSize.width - scrollView.frame.size.width
        }
        if scrollView.contentSize.width>scrollView.frame.width{
            scrollView.setContentOffset(CGPoint(x: toX, y: 0), animated: true)
        }
        
        self.titleTapClosure?(btn.tag)
    }
}
