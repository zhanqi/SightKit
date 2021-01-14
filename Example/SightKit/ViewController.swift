//
//  ViewController.swift
//  SightKit
//
//  Created by zaky0006 on 09/17/2020.
//  Copyright (c) 2020 zaky0006. All rights reserved.
//

import UIKit
import SightKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(named: "home_title_BgImg")?.resizableImage(withCapInsets: UIEdgeInsets.zero, resizingMode: .stretch), for: .default)
        self.navigationController?.navigationBar.isTranslucent = false
        
        let label = UILabel().wNumberOfLines(4).addTo(self.view).csCenter().csWidthHeight(120)
        label.attributedText = "SightKit".toAttrStr.wFont(pfr13).wTextColor(.green) +
            "is".toAttrStr.wFont(pfm16).wTextColor(.black) +
            "powerful".toAttrStr.wFont(pfb20).wTextColor(.red) +
            "and".toAttrStr.wFont(pfb10).wTextColor(.gray) +
            "perfect".toAttrStr.wFont(pfm16).wTextColor(.blue)
        
//        self.view.addSubviewHorizontal { (v) in
//            v.csWidth(90)
//        }
//        self.view.addSubViewVerticalRepeat(num: 5) { (v, index) in
//            v.csHeight(90)
//        }
//        SKRq().wUrl("https://google.com").resume { (result) in
//            print(result)
//        }
        
        let btn = UIButton().addTo(self.view).csFullFillTo(view: label)
//        btn.addTarget(for: .touchUpInside) {
//            print("touch up inside ")
//        }
//        btn.removeTarget(for: .touchUpInside)
//        btn.addTarget(for: .touchUpInside) {
//            print("another touch ")
//        }
        
        openRequestLog = true
//        skRq(urlString: "http://47.115.54.215:8085/sso/getAuthCode?telephone=186323", method: .get, paraDic: [:], configRqHead: nil) { (data, response, error) in
//
//        }
//        skRq(urlString: "https://jsonplaceholder.typicode.com/todos/1", method: .get, paraDic: [:], configRqHead: nil) { (data, response, error) in
//
//        }
        SKRq().wUrl("http://47.115.54.215:8085/sso/getAuthCode?telephone=186323").resume { (result) in
            if let json = result.json {
                let code = json["data"].stringValue
                SKRq().wUrl("http://47.115.54.215:8085/sso/register").wPost().wParam(["分享码":"1234","密码":"123456","手机号":"186323","用户名":"james","验证码":code]).resume { (r) in
                    
                }
                
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

//class SKResponse<T> {
//
//    case Success(T),error(V)
//
//    var data:Data?
//}
