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
        
        let sView = SKTitleView()
        sView.setTitles(titles: ["btn1","btn2","btn3","btn4","btn5","btn6","btn7","btn7","btn7","btn7","btn7","btn7","btn7","btn7","btn7"], selectIndex: 2, titleBtnConfig: { (btn, text, index) in
            btn.wFeatures(UIColor.black,pfr12)
            btn.setTitleColor(.green, for: .selected)
        }) { (index) in
            print(index)
        }
        sView.addTo(self.view).csCenterY().csFullfillHorizontal().csHeight(60)
        
        sView.addLeftBtn(width: 80, configBtn: { (btn) in
            btn.wFeatures("btn",UIColor.red,pfr14)
            btn.addTargetClosure { (btn) in
                print("tapleft")
            }
        }, tapClosure: nil)
//        sView.addLeftView(width: 100) { (leftView) in
//            leftView.wBgColor(UIColor.brown)
//        }
//        sView.addLeftBtn(width: 80, configBtn: { (btn) in
//            btn.wFeatures("this is btn",UIColor.black,pfr14)
//        }) { (btn) in
//            print("tapped")
//        }
        
//        sView.csScrollViewLeft.constant = 200
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

