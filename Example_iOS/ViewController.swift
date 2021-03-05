//
//  ViewController.swift
//  Example_iOS
//
//  Created by mac on 21/1/2021.
//

import UIKit
import SightKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let label = UILabel().wNumberOfLines(4).addTo(self.view).csCenter().csWidthHeight(250)
        label.attributedText = "SightKit".toAttrStr.wFont(pfr13).wTextColor(.green) +
            "is".toAttrStr.wFont(pfm16).wTextColor(.black) +
            "powerful".toAttrStr.wFont(pfb20).wTextColor(.red) +
            "and".toAttrStr.wFont(pfb10).wTextColor(.gray) +
            "perfecting".toAttrStr.wFont(pfm16).wTextColor(.blue)
        
        SGUrl.sso_login_post.rq(password: "123123", telephone: nil, username: "Jim123") { (res) in
            if res.success {
                let header = res.json?["data"]["tokenHead"].stringValue ?? ""
                let token = res.json?["data"]["token"].stringValue ?? ""
                let appToken = header + token
                SKRq.globalHeader = ["Authorization":appToken]
                SGUrl.sso_info_get.rq(name: "Jim123") { (r) in
                    
                }
                
                SGUrl.cart_list_get.rq { (_) in
                    
                }
            }
        }
        
        SKRq().resumeWithModel { (result, item:YouhuiItem?) in
            
        }
    }


}

class YouhuiItem: SKJsonInitProtocol{
    var activeCode:String = ""
    var Main_Title:String = ""
    var GameType:Int = 0
    var Id:Int = 0
    
    required convenience init(json:SKJSON) {
        self.init()
        self.activeCode = json["activeCode"].stringValue
        self.Main_Title = json["Main_Title"].stringValue
        self.GameType = json["GameType"].intValue
        self.Id = json["Id"].intValue
    }
}
extension SKResult {
    var success:Bool {
        if let code = self.json?["code"].intValue , code == 200 {
            return true
        }
        return false
    }
    
    var errorMsg:String {
        if let error = self.error {
            return error.localizedDescription
        }
        return self.json?["message"].stringValue ?? "未知的错误"
    }
}

//func sgRequest<T>(item:SGCommonUrlProtocol,resultAndModel:@escaping ((SKResult,T)->Void)){
//    let rq = SKRq().wUrl(hostUrl + item.url).wMethod(item.method)
//    for element in item.paramMap.values {
//        if let value = element.value , let  position = SKParamPosition.init(rawValue:element.paramPosition.rawValue) {
//            rq.wParam(key: element.name, value: value, position: position)
//        }
//    }
//    rq.resumeWithModel<String>(resultAndModel)
//}
