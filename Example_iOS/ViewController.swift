//
//  ViewController.swift
//  Example_iOS
//
//  Created by mac on 21/1/2021.
//

import UIKit
import SightKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let label = UILabel().wNumberOfLines(4).addTo(self.view).csCenter().csWidthHeight(250)
        label.attributedText = "SightKit".toAttrStr.wFont(pfr13).wTextColor(.green) +
            "is".toAttrStr.wFont(pfm16).wTextColor(.black) +
            "powerful".toAttrStr.wFont(pfb20).wTextColor(.red) +
            "and".toAttrStr.wFont(pfb10).wTextColor(.gray) +
            "perfecting".toAttrStr.wFont(pfm16).wTextColor(.blue)

    }


}

