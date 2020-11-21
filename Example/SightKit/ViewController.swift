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
        
        
        let sView = SKSegmentView.init(titles: ["快速登录","账号密码登录"], configBtnClosure: { (view, btn,index,text) in
            btn.csFullfill()
            btn.wTitle(text).wFont(pfr(16)).wTitleColor(UIColor.init(hex: 0x333333))
            btn.setTitleColor(UIColor.init(hex: 0xD29341), for: .selected)
        }, configIndiClosure: { (indicator) -> (bottomOffset:CGFloat, width:CGFloat?) in
            indicator.backgroundColor = UIColor.init(hex: 0xD29341)
            indicator.csHeight(2)
            return (-5,40)
        }) { (index) in
            print(index)
        }
        sView.addTo(self.view).csCenterY().csFullfillHorizontal().csHeight(50)

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

