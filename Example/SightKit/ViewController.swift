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
        
        UIView().addTo(self.view).csCenter().csWidthHeight(60).wBgColor("542444".toColor.wAlpha(0.4))
        
        HttpManager.GetRequestSession(urlstr: "http://apis.eolinker.com/common/weather/get15DaysWeatherByArea", parameters: [:]) { (response) in
            
        } Fail: { (error) in
            
        }
//
//
//        HttpManager.GetRequestSession(urlstr:"http://apis.eolinker.com/common/weather/get15DaysWeatherByArea", parameters:["productKey":params.productKey!,"area":params.area!], Success: { (response) in
//
//                        let dict = response as? NSDictionary
//                        if (dict == nil)
//                        {
//                            return;
//                        }
//                        print("原生请求返回数据",dict!)
//
//                    }) { (error) in
//
//                        print("请求出错",error)
//
//                    }
//
//                } else
//                {
//
//                }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

class HttpManager {
    static var SessionManager = URLSession()

    class func GetRequestSession(urlstr:String,parameters:NSDictionary?,Success:@escaping(_ response:Any) ->Void,Fail:@escaping(_ error:NSError) ->Void) -> Void {
        var _UrlStr:String = urlstr
        if (parameters != nil) {
            let JSONArr:NSMutableArray = NSMutableArray()
            for key:Any in (parameters?.allKeys)!
            {
                let JSONString = ("\(key)\("=")\(parameters![key] as! String)")
                JSONArr.add(JSONString)
            }
            let paramStr = JSONArr.componentsJoined(by:"&")
            _UrlStr.append("?"+paramStr)
            print("请求字符串"+_UrlStr)
        }
        let _url = URL.init(string:(_UrlStr.urlEncoded()))
        var urlRequest = URLRequest.init(url: _url!)
        urlRequest.httpMethod = "GET"
        
        let configuration:URLSessionConfiguration = URLSessionConfiguration.default
        HttpManager.SessionManager = URLSession(configuration: configuration)
        
        let task = HttpManager.SessionManager.dataTask(with:urlRequest){ (data, response, error) in
            if ((error) == nil)
            {
                if(data == nil)
                {
                    return;
                }
                let jsonData = try!JSONSerialization.jsonObject(with: data! as Data, options: .mutableContainers)
                Success(jsonData);
            }
            else
            {
                Fail(error! as NSError)
                
            }

        }
        task.resume();
        }
}

extension String {
    
    //将原始的url编码为合法的url
    func urlEncoded() -> String {
        let encodeUrlString = self.addingPercentEncoding(withAllowedCharacters:
            .urlQueryAllowed)
        return encodeUrlString ?? ""
    }
    
    //将编码后的url转换回原始的url
    func urlDecoded() -> String {
        return self.removingPercentEncoding ?? ""
}

}
