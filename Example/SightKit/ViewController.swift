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
        
        
        
        let btn = UIButton().wFeatures(self.view,UIColor.black,"按钮").csCenter().csWidthHeight(50)
        btn.addTargetClosure { (btn) in
            let vc = UIViewController()
            vc.view.backgroundColor = UIColor.gray
            UIApplication.shared.keyWindow!.switchRootViewController(to: vc)
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

