//
//  SKStackView.swift
//  SightKit
//
//  Created by mac on 16/11/2020.
//

import UIKit

class SKStackView<T>: UIView {
    typealias ConfigSingleView = (_ item:T,_ subView:UIView,_ isFirst:Bool)->()
    typealias ConfigTapView = (_ item:T,_ index:Int)->()
    var array:[T] = []

    func updateWith(array:[T],allowMultiSelect:Bool,width:CGFloat,config:ConfigSingleView){
        self.array.append(contentsOf: array)
        var last:UIView?
        for (index,value) in self.array.enumerated(){
            let view = UIView().addTo(self).csFullfillVertical().csWidth(width)
            if let last = last {
                view.cstoRightOf(view: last, constant: 0)
            }else{
                view.csLeft()
            }
            
            last = view
        }
    }
    
    
}


