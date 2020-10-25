//
//  RegisterView.swift
//  SightKit_Example
//
//  Created by mac on 24/10/2020.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import Foundation
import SightKit

class RegisterView: UIView {
    required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    override init(frame: CGRect) {
        super.init(frame: frame)
        buildViews()
    }
    
    var phoneField:UITextField!
    var codeField:UITextField!
    var passWordField:UITextField!
    var passWordConfirmField:UITextField!
    func buildViews() {
        let imgBg = UIView().addTo(self).csHeight(200).csTop().csFullfillHorizontal()
        imgBg.addGradient(startColor: UIColor.init(hex: 0xe4cc6c), endColor: UIColor.init(hex: 0xcaa258), isVertical: false)

        let backView = addNavView()
        
        let bg = UIView().wBgColor(.white).addTo(self).cstoBottomOf(view: backView).csFullfillHorizontal().csBottom()
        bg.corner(radius: 20)
        
        phoneField = UITextField().wPlaceholder(text: "请输入手机号", color: UIColor.init(hex: 0xBEBEBE), font: pfr14).addTo(bg).border(width: 0.5, color: mainColor).corner(radius: 20)
        phoneField.csTop(30).csLeftRight(constant: 25).csHeight(40)
        phoneField.addLeftView(width: 48) { (view) in
            let _ = UIImageView().wBgColor(.red).addTo(view).csCenter().csWidthHeight(22)
        }
        
        codeField = UITextField().wPlaceholder(text: "请输入手机验证码", color: UIColor.init(hex: 0xBEBEBE), font: pfr14).addTo(bg).border(width: 0.5, color: UIColor.init(hex: 0xB0BAC5)).corner(radius: 20)
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
        
        passWordField = UITextField().wPlaceholder(text: "请设置6-20位登录密码", color: UIColor.init(hex: 0xBEBEBE), font: pfr14).addTo(bg).border(width: 0.5, color: UIColor.init(hex: 0xB0BAC5)).corner(radius: 20)
        passWordField.cstoBottomOf(view: codeField, constant: 20).csLeftRight(constant: 25).csHeight(40)
        passWordField.addLeftView(width: 48) { (view) in
            let _ = UIImageView().wBgColor(.red).addTo(view).csCenter().csWidthHeight(22)
        }

        passWordConfirmField = UITextField().wPlaceholder(text: "请再次输入密码", color: UIColor.init(hex: 0xBEBEBE), font: pfr14).addTo(bg).border(width: 0.5, color: UIColor.init(hex: 0xB0BAC5)).corner(radius: 20)
        passWordConfirmField.cstoBottomOf(view: passWordField, constant: 20).csLeftRight(constant: 25).csHeight(40)
        passWordConfirmField.addLeftView(width: 48) { (view) in
            let _ = UIImageView().wBgColor(.red).addTo(view).csCenter().csWidthHeight(22)
        }

        let agreeIcon = UIImageView().wBgColor(.red).addTo(bg).csWidthHeight(30).csLeft(25+24-15).cstoBottomOf(view: passWordConfirmField, constant: 10)
        let agreeLabel = UILabel().wFeatures("我同意",pfr13,bg).csCenterY(agreeIcon).cstoRightOf(view: agreeIcon, constant: 15)
        let policyBtn = UIButton().wFeatures("《注册协议》",bg,mainColor,pfr13).cstoRightOf(view: agreeLabel).csCenterY(agreeLabel).csHeight(40)
        policyBtn.setTitleColor(.gray, for: .highlighted)
        
        let registerBtn = UIButton().wFeatures("完成",UIColor.white,pfr16,bg).cstoBottomOf(view: policyBtn, constant: 52).csLeftRight(constant: 25).csHeight(38)
        registerBtn.corner(radius: 19).addGradient(startColor: UIColor.init(hex: 0xe4cc6c), endColor: UIColor.init(hex: 0xcaa258), isVertical: false)
        registerBtn.setBackgroundColor(.lightGray, for: .highlighted)
        registerBtn.addTarget(self, action: #selector(registerBtnTap), for: .touchUpInside)

        UITextField.connectAllTxtFieldFields(txtfields: phoneField,codeField,passWordField,passWordConfirmField)
    }
    @objc func registerBtnTap(){
        
    }
    func addNavView() -> UIView{
        let view = UIView().addTo(self).csHeight(NavStatusBarHeight).csTop().csFullfillHorizontal()
        let btn = UIButton().addTo(view).csLeft().csWidthHeight(44).csBottom()
        btn.addTargetClosure { (_) in
            self.viewController?.dismiss(animated: true, completion: nil)
        }
        btn.wBgColor(.red)
        
        UILabel().wFeatures("注册",pfr18,UIColor.white,view).csCenterX().csBottom().csHeight(44)
        return view
    }

}
