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
        
        
        
        let f = SKFillableView().addTo(self.view).csFullfill()
        let v = UIView()
        f.fillSubView(view: v, height: 1200, verticalSpace: 0, leftSpace: 0, rightSpace: 0)

//        let s = UIScrollView().addTo(self.view).csFullfill()
//        let v = UIView().addTo(s).csFullfill().csWidth(s)
//        let subv = UIView().addTo(v).csTop().csFullfillHorizontal().csHeight(2000).csBottomLessThanOrEqual()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

