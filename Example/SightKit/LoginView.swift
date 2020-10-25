//
//  LoginView.swift
//  SightKit_Example
//
//  Created by mac on 23/10/2020.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import UIKit
import SightKit

let mainColor = UIColor.init(hex: 0xD29341)

class LoginView: UIView {
    required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    override init(frame: CGRect) {
        super.init(frame: frame)
        buildViews()
    }
    var sView:SKSegmentView!
    
    var fieldsView:UIView!
    var phoneField:UITextField!
    var codeField:UITextField!
    
    var accountField:UITextField!
    var passWordField:UITextField!
    
    var isQuickLogin = true
    func buildViews() {
        let fillableView = SKFillableView().addTo(self).csFullfill()
        
        addBackBtn()
        
        let imgBg = UIView()
        fillableView.fillSubView(view: imgBg)
        imgBg.csHeight_W_H_Rate(125/91)
        imgBg.addGradient(startColor: UIColor.init(hex: 0xe4cc6c), endColor: UIColor.init(hex: 0xcaa258), isVertical: false)
        
        UIImageView().addTo(imgBg).csCenter(imgBg)
        
        let containView = UIView().wBgColor(.white)
        containView.corner(radius: 20, shadowColor: .gray, shadowOffset: CGSize.zero, shadowOpacity: 0.2, shadowRadius: 3)
        fillableView.fillSubView(view: containView, height: nil, verticalSpace: -55, leftSpace: 13, rightSpace: 13)
        
        sView = SKSegmentView.init(titles: ["快速登录","账号密码登录"], configBtnClosure: { (view, btn,index,text) in
            btn.csFullfill()
            btn.wTitle(text).wFont(pfr(16)).wTitleColor(UIColor.init(hex: 0x333333))
            btn.setTitleColor(mainColor, for: .selected)
        }, configIndiClosure: { (indicator) -> (CGFloat, CGFloat?) in
            indicator.backgroundColor = mainColor
            indicator.csHeight(2)
            return (-5,40)
        }) { (index) in
            if self.isQuickLogin, index == 1{
                self.isQuickLogin = false
                self.makeAccountLoginView()
                self.endEditing(true)
            }
            if !self.isQuickLogin, index == 0{
                self.isQuickLogin = true
                self.makeQuickLoginView()
                self.endEditing(true)
            }
        }
        sView.addTo(containView).csFullfillHorizontal().csTop().csHeight(50)
        
        fieldsView = UIView().addTo(containView).cstoBottomOf(view: sView, constant: 27).csFullfillHorizontal()
        makeQuickLoginView()
        
        let registerBtn = UIButton().wFeatures("立即注册",mainColor,containView,pfr13).csLeft(44).cstoBottomOf(view: fieldsView, constant: 0).csHeight(42)
        registerBtn.setTitleColor(.gray, for: .highlighted)
        registerBtn.addTarget(self, action: #selector(regiestBtnTap), for: .touchUpInside)
        
        let forgetBtn = UIButton().wFeatures("忘记密码?",UIColor.init(hex: 0xBEBEBE),containView,pfr13).csRight(-44).csCenterY(registerBtn).csHeight(42)
        forgetBtn.setTitleColor(.gray, for: .highlighted)
        forgetBtn.addTarget(self, action: #selector(forgetBtnTap), for: .touchUpInside)
        
        let loginBtn = UIButton().wFeatures("登录",UIColor.white,pfr16,containView).cstoBottomOf(view: registerBtn, constant: 33).csLeftRight(constant: 25).csHeight(38)
        loginBtn.corner(radius: 19).addGradient(startColor: UIColor.init(hex: 0xe4cc6c), endColor: UIColor.init(hex: 0xcaa258), isVertical: false)
        loginBtn.setBackgroundColor(.lightGray, for: .highlighted)
        loginBtn.addTarget(self, action: #selector(loginBtnTap), for: .touchUpInside)
        
        let wxLoginBtn = UIButton().wFeatures("微信登录",mainColor,pfr16,containView).cstoBottomOf(view: loginBtn, constant: 20).csLeftRight(constant: 25).csHeight(38)
        wxLoginBtn.corner(radius: 19).corner(radius: 19).border(width: 0.5, color: mainColor)
        wxLoginBtn.setBackgroundColor(.lightGray, for: .highlighted)
        wxLoginBtn.addTarget(self, action: #selector(wxBtnTap), for: .touchUpInside)
        
        wxLoginBtn.csBottom(-30)
    }
    
    @objc func regiestBtnTap(){
        
    }
    @objc func forgetBtnTap(){
        
    }
    @objc func loginBtnTap(){
        
    }
    @objc func wxBtnTap(){
        
    }
    func addBackBtn(){
        let view = UIView().addTo(self).csTop().csFullfillHorizontal().csHeight(NavStatusBarHeight)
        let btn = UIButton().addTo(view).csLeft().csWidthHeight(44).csBottom()
        btn.addTargetClosure { (_) in
            self.viewController?.dismiss(animated: true, completion: nil)
        }
        btn.wBgColor(.red)
    }
    func makeQuickLoginView(){
        fieldsView.removeAllSubviews()
        
        phoneField = UITextField().wPlaceholder(text: "请输入手机号", color: UIColor.init(hex: 0xBEBEBE), font: pfr14).addTo(fieldsView).border(width: 0.5, color: mainColor).corner(radius: 20)
        phoneField.csTop().csLeftRight(constant: 25).csHeight(40)
        phoneField.addLeftView(width: 48) { (view) in
            let _ = UIImageView().wBgColor(.red).addTo(view).csCenter().csWidthHeight(22)
        }
        
        codeField = UITextField().wPlaceholder(text: "请输入手机验证码", color: UIColor.init(hex: 0xBEBEBE), font: pfr14).addTo(fieldsView).border(width: 0.5, color: UIColor.init(hex: 0xB0BAC5)).corner(radius: 20)
        codeField.cstoBottomOf(view: phoneField, constant: 20).csLeftRight(constant: 25).csHeight(40)
        codeField.addLeftView(width: 48) { (view) in
            let _ = UIImageView().wBgColor(.red).addTo(view).csCenter().csWidthHeight(22)
        }
        let getCodeView = SKGetVerifyCodeView()
        codeField.addRightView(width: 93, view: getCodeView)
        getCodeView.btn.addTargetClosure { (btn) in
            getCodeView.start()
        }
        let _ = UIView().wBgColor(mainColor).addTo(getCodeView).csCenterY().csLeft().csWidth(1).csHeight(20)
        
        codeField.csBottom()
        
        UITextField.connectAllTxtFieldFields(txtfields: phoneField,codeField)
    }
    
    func makeAccountLoginView(){
        fieldsView.removeAllSubviews()
        
        accountField = UITextField().wPlaceholder(text: "请输入账号", color: UIColor.init(hex: 0xBEBEBE), font: pfr14).addTo(fieldsView).border(width: 0.5, color: mainColor).corner(radius: 20)
        accountField.csTop().csLeftRight(constant: 25).csHeight(40)
        accountField.addLeftView(width: 48) { (view) in
            let _ = UIImageView().wBgColor(.red).addTo(view).csCenter().csWidthHeight(22)
        }
        
        passWordField = UITextField().wPlaceholder(text: "请输入密码", color: UIColor.init(hex: 0xBEBEBE), font: pfr14).addTo(fieldsView).border(width: 0.5, color: UIColor.init(hex: 0xB0BAC5)).corner(radius: 20)
        passWordField.cstoBottomOf(view: accountField, constant: 20).csLeftRight(constant: 25).csHeight(40)
        passWordField.addLeftView(width: 48) { (view) in
            let _ = UIImageView().wBgColor(.red).addTo(view).csCenter().csWidthHeight(22)
        }
        passWordField.isSecureTextEntry = true
        passWordField.csBottom()
        
        UITextField.connectAllTxtFieldFields(txtfields: accountField,passWordField)
    }
}
