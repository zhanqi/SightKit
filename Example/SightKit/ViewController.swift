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
        
        let label = UILabel().wNumberOfLines(4).addTo(self.view).csCenter()
        label.attributedText = "SightKit".toAttrStr().wFont(font: pfr13).wTextColor(color: .green) +
            "is".toAttrStr().wFont(font: pfm16).wTextColor(color: .black) +
            "powerful".toAttrStr().wFont(font: pfb20).wTextColor(color: .red) +
            "and".toAttrStr().wFont(font: pfb10).wTextColor(color: .gray) +
            "perfect".toAttrStr().wFont(font: pfm16).wTextColor(color: .blue)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

