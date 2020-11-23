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
        
        let title = "Button"
        let btn = UIButton().wFeatures(title,pfr15,UIColor.black,self.view,"icon".toImg()).csCenter().csWidth(90).csHeight(80).wBgColor(.gray)
        
        let btn1 = UIButton().wFeatures(title,pfr15,UIColor.black,self.view,"icon".toImg()).cstoBottomOf(view: btn, constant: 10).csCenterX().csWidth(btn).csHeight(btn).wBgColor(.gray)
        btn1.setImgToTop(titleSpace: 10)
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

