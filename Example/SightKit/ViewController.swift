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
        
        let label = UILabel().wNumberOfLines(4).addTo(self.view)
        label.attributedText = "SightKit".toAttrStr.wFont(pfr13).wTextColor(.green) +
            "is".toAttrStr.wFont(pfm16).wTextColor(.black) +
            "powerful".toAttrStr.wFont(pfb20).wTextColor(.red) +
            "and".toAttrStr.wFont(pfb10).wTextColor(.gray) +
            "perfect".toAttrStr.wFont(pfm16).wTextColor(.blue)
//        label.csWith(
//            [ska_right,-20.0],
//            [ska_top,self.view,30],
//            [ska_left,self.view,ska_centerX,40],
//            [ska_bottom,self.view,ska_centerY,skr_greater,20,0.8]
//        )
        
        //此处存疑，[ska_width,100] 是等于self.view的宽度加100，不是我想要的
        UIButton().wBgColor(.gray).addTo(self.view).csWith([ska_center],[ska_width,100],[ska_right,40])
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
