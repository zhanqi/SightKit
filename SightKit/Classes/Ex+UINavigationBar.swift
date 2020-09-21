//
//  Ex+UINavigationBar.swift
//  SightKit
//
//  Created by 湛奇 on 2020/9/21.
//

import Foundation


/*
 设置导航栏背景图片
 //        UINavigationBar.appearance().setBackgroundImage("home_title_BgImg".toImage(), forBarMetrics: .Default)
 
 设置导航栏背景图片 让图片填满导航栏
 self.navigationController?.navigationBar.setBackgroundImage(UIImage(named: "home_title_BgImg")?.resizableImage(withCapInsets: UIEdgeInsets.zero, resizingMode: .stretch), for: .default)
 
 左右customview的宽高设置
 let rightItem = UIBarButtonItem(customView: view)
 rightItem.customView?.widthAnchor.constraint(equalToConstant: 120).isActive = true
 rightItem.customView?.heightAnchor.constraint(equalToConstant: 44).isActive = true
 self.navigationItem.rightBarButtonItem = rightItem

 */

// MARK: - Methods
public extension UINavigationBar {

    /// SwifterSwift: Set Navigation Bar title, title color and font.
    ///
    /// - Parameters:
    ///   - font: title font
    ///   - color: title text color (default is .black).
    func setTitleFont(_ font: UIFont, color: UIColor = .black) {
        var attrs = [NSAttributedString.Key: Any]()
        attrs[.font] = font
        attrs[.foregroundColor] = color
        titleTextAttributes = attrs
    }
}
