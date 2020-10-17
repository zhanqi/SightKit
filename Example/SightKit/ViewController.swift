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
        let tview = SKSegmentView.init(titles: ["按钮1","按钮2","按钮3"], configBtnClosure: { (view, btn,index,text) in
            btn.csFullfill()
            btn.wTitle(text).wFont(pfr(20)).wTitleColor(.blue)
            btn.setTitleColor(.red, for: .selected)
        }, configIndiClosure: { (indicator) -> (CGFloat, CGFloat?) in
            indicator.backgroundColor = .red
            indicator.csHeight(3)
            indicator.corner(radius: 1.5)
            return (-10,30)
            return (-10,nil)
        }) { (index) in
            print(index)
            
        }
        tview.addTo(self.view).csLeft(10).csRight(-10).csHeight(60).csTop(100)
        tview.wBgColor(.white)
        tview.corner(radius: 10, shadowColor: .black, shadowOffset: CGSize.init(width: 0, height: 2), shadowOpacity: 0.5, shadowRadius: 2)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

