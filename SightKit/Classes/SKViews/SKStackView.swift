//
//  SKStackView.swift
//  SightKit
//
//  Created by mac on 16/11/2020.
//

import UIKit

open class SKStackView<T>: UIView {
    public typealias ConfigSingleView = (_ item:T,_ subView:UIView,_ isFirst:Bool)->()
    public typealias ConfigSelection = (_ item:T,_ view:UIView,_ select:Bool)->()
    
    var array:[T] = []
    var views:[UIView] = []
    var allowMultiSelect = false
    var selectedIndexs:[Int] = []
    var configSelect:ConfigSelection!
    public func updateWith(array:[T],allowMultiSelect:Bool,width:CGFloat,configView:ConfigSingleView,configSelect:@escaping ConfigSelection){
        self.array.removeAll()
        self.array.append(contentsOf: array)
        self.allowMultiSelect = allowMultiSelect
        self.selectedIndexs.removeAll()
        self.configSelect = configSelect
        
        self.views.removeAll()
        self.removeAllSubviews()
        var last:UIView?
        for (index,value) in self.array.enumerated(){
            let view = UIView().addTo(self).csFullfillVertical().csWidth(width)
            if let last = last {
                view.cstoRightOf(view: last, constant: 0)
            }else{
                view.csLeft()
            }
            configView(value,view,index==0)
            
            let btn = UIButton().addTo(view).wTag(index).csFullfill()
            btn.addTarget(self, action: #selector(btnTap(btn:)), for: .touchUpInside)
            
            self.views.append(view)
            last = view
        }
    }
    
    @objc func btnTap(btn:UIButton){
        let contain = selectedIndexs.contains { (index) -> Bool in
            return index == btn.tag
        }
        
        if contain {
            selectedIndexs.remove(element: btn.tag)
        }else{
            if !allowMultiSelect {
                selectedIndexs.removeAll()
            }
            selectedIndexs.append(btn.tag)
        }
        
        for (index,value) in array.enumerated(){
            let contain = selectedIndexs.contains { (inIndex) -> Bool in
                return inIndex == index
            }
            configSelect(value,views[index],contain)
        }
    }
}


