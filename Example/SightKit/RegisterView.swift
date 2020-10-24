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
        makeNavBarForBaseVC
        let imgBg = UIView().addTo(self).csHeight(100).csTop().csFullfillHorizontal()
        imgBg.addGradient(startColor: UIColor.init(hex: 0xe4cc6c), endColor: UIColor.init(hex: 0xcaa258), isVertical: false)

        let fillableView = SKFillableView().addTo(self).csFullfill()
        
        let backView = addNavView()
        fillableView.fillSubView(view: backView)
        

        phoneField = UITextField().wPlaceholder(text: "请输入手机号", color: UIColor.init(hex: 0xBEBEBE), font: pfr14).border(width: 0.5, color: mainColor).corner(radius: 20)
        fillableView.fillSubView(view: phoneField, height: 40, verticalSpace: 30, leftSpace: 15, rightSpace: 15)
        phoneField.addLeftView(width: 48) { (view) in
            let _ = UIImageView().wBgColor(.red).addTo(view).csCenter().csWidthHeight(22)
        }
        
        codeField = UITextField().wPlaceholder(text: "请输入手机验证码", color: UIColor.init(hex: 0xBEBEBE), font: pfr14).border(width: 0.5, color: UIColor.init(hex: 0xB0BAC5)).corner(radius: 20)
        fillableView.fillSubView(view: codeField, height: 40, verticalSpace: 30, leftSpace: 15, rightSpace: 15)
        codeField.addLeftView(width: 48) { (view) in
            let _ = UIImageView().wBgColor(.red).addTo(view).csCenter().csWidthHeight(22)
        }
        let getCodeView = SKGetVerifyCodeView()
        codeField.addRightView(width: 93, view: getCodeView)
        getCodeView.btn.addTargetClosure { (btn) in
            getCodeView.start()
        }
        let _ = UIView().wBgColor(mainColor).addTo(getCodeView).csCenterY().csLeft().csWidth(1).csHeight(20)

    }
    
    func addNavView() -> UIView{
        let view = UIView().csHeight(NavStatusBarHeight)
        let btn = UIButton().addTo(view).csLeft().csWidthHeight(44).csBottom()
        btn.addTargetClosure { (_) in
            self.viewController?.dismiss(animated: true, completion: nil)
        }
        btn.wBgColor(.red)
        
        UILabel().wFeatures("注册",pfr18,UIColor.white,view).csCenterX().csBottom().csHeight(44)
        return view
    }

}
