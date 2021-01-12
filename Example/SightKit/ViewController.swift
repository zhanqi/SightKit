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
        
        let btn = UIButton().addTo(self.view).csFullFillTo(view: label).addAction {
            
        }
//        btn.addTarget(for: .touchUpInside) {
//            print("touch up inside ")
//        }
//        btn.removeTarget(for: .touchUpInside)
//        btn.addTarget(for: .touchUpInside) {
//            print("another touch ")
//        }
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
