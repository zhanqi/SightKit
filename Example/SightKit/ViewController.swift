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
        
        let v = UIImageView()
        v.image = "https://awesome-tips.gitbook.io/ios/yin-shi-pin/content-2https://awesome-tips.gitbook.io/ios/yin-shi-pin/content-2https://awesome-tips.gitbook.io/ios/yin-shi-pin/content-2https://awesome-tips.gitbook.io/ios/yin-shi-pin/content-2".toQRcodeImg()
        self.view.addSubview(v)
        v.csCenter()
        
        let visual = SKVisualEffectView()
        self.view.addSubview(visual)
        visual.csCenter().csWidthHeight(300)
        visual.blurRadius = 5.3
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

