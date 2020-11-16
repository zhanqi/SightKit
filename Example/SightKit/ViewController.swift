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
        
        
        
        
        let v = SKStackView<Person>().addTo(self.view).csCenterY().csFullfillHorizontal().csHeight(60).wBgColor(.lightGray)
        
        v.updateWith(array: [Person(age: 1),Person(age: 2),Person(age: 3),Person(age: 4)], allowMultiSelect: true, width: 50) { (p, v, isfirst) in
            UILabel().wFeatures(pfr12,UIColor.red,v,NSTextAlignment.center).csFullfill().wText("\(p.age)").wTag(1)
        } configSelect: { (p, v, select) in
            let label = v.viewWithTag(1)
            label?.backgroundColor = select ? .green : .blue
        }

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

struct Person {
    var age = 0
}
