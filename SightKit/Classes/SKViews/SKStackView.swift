//
//  SKStackView.swift
//  SightKit
//
//  Created by mac on 16/11/2020.
//

import UIKit

/** 横向/纵向 添加 单选 多选单元
 ## 使用示例
 ```
 struct Person {
     var age = 0
 }
 let v = SKStackView<Person>().addTo(self.view).csCenterY().csFullfillHorizontal().wBgColor(.lightGray)
 v.updateWith(array: [Person(age: 1),Person(age: 2),Person(age: 3)],direction: .vertical, widthHeight: 50, option: .multi) { (p, v, index, select) in
     let label = v.viewWithTag(tag: 100) { () -> UIView in
         return UILabel().wFeatures(pfr12,UIColor.black,NSTextAlignment.center,v,"\(p.age)").csFullfill().wTag(100)
     }
     label.backgroundColor = select ? .red : .blue
 } select: { (array) in
     print(array)
 }
 */
open class SKStackView<T>: UIView {
    public typealias ConfigSingleView = (_ item:T,_ subView:UIView,_ index:Int,_ select:Bool)->()
    public typealias ConfigSelectionChange = (_ selections:[T])->()
    public enum SelectOption {
        /// 最多只能选一个
        case single
        /// 始终选择一个
        case alwaysSingle
        /// 允许多选
        case multi
    }
    public enum Direction {
        case horizon
        case vertical
    }
    
    var array:[T] = []
    var views:[UIView] = []
    var option = SelectOption.single
    var selectedIndexs:[Int] = []
    var configView:ConfigSingleView!
    var selectClosure:ConfigSelectionChange!
    public func updateWith(array:[T],direction:Direction,widthHeight:CGFloat,option:SelectOption,configV:@escaping ConfigSingleView,select:@escaping ConfigSelectionChange){
        self.array.removeAll()
        self.array.append(contentsOf: array)
        self.option = option
        self.selectedIndexs.removeAll()
        self.configView = configV
        self.selectClosure = select
        
        self.views.removeAll()
        self.removeAllSubviews()
        var last:UIView?
        for (index,value) in self.array.enumerated(){
            let view = UIView().addTo(self)
            if direction == .horizon {
                view.csFullfillVertical().csWidth(widthHeight).csRightLessThanOrEqual()
                if let last = last {
                    view.cstoRightOf(view: last, constant: 0)
                }else{
                    view.csLeft()
                }
            }else{
                view.csFullfillHorizontal().csHeight(widthHeight).csBottomLessThanOrEqual()
                if let last = last {
                    view.cstoBottomOf(view: last, constant: 0)
                }else{
                    view.csTop()
                }
            }
            self.configView(value,view,index,false)
            
            let btn = UIButton().addTo(view).wTag(index).csFullfill()
            btn.addTarget(self, action: #selector(btnTap(btn:)), for: .touchUpInside)
            
            self.views.append(view)
            last = view
        }
        
        if array.count > 0, option == .alwaysSingle {
            selectedIndexs.append(0)
            updateUI()
        }
    }
    
    @objc func btnTap(btn:UIButton){
        let c = selectedIndexs.contains(btn.tag)
        if c {
            if option == .alwaysSingle {
                
            }else{
                selectedIndexs.remove(element: btn.tag)
            }
        }else{
            if option == .single || option == .alwaysSingle {
                selectedIndexs.removeAll()
            }
            selectedIndexs.append(btn.tag)
        }
        
        updateUI()
        selectClosure(self.selectArray())
    }
    func updateUI(){
        for (index,value) in array.enumerated(){
            let c = selectedIndexs.contains(index)
            configView(value,views[index],index,c)
        }
    }
    
    public func selectIndex(_ index:Int){
        if !selectedIndexs.contains(index){
            if option == .single || option == .alwaysSingle {
                selectedIndexs.removeAll()
            }
            selectedIndexs.append(index)
            updateUI()
        }
    }
    public func unselectIndex(_ index:Int){
        if selectedIndexs.count == 1 , option == .alwaysSingle {
            print("option is .alwaysOne , cannt clear all")
            return
        }
        
        if selectedIndexs.contains(index){
            selectedIndexs.remove(element: index)
            updateUI()
        }
    }
    
    func selectArray()->[T]{
        var a = [T]()
        for (index,value) in array.enumerated(){
            if selectedIndexs.contains(index){
                a.append(value)
            }
        }
        return a
    }
}


