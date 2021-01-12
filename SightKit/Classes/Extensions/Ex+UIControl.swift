//
//  Ex+UIControl.swift
//  SightKit
//
//  Created by jim on 2021/1/13.
//

import Foundation

class Target {
    
    private let t: () -> ()
    init(target t: @escaping () -> ()) { self.t = t }
    @objc private func s() { t() }
    
    public var action: Selector {
        return #selector(s)
    }
}

protocol PropertyProvider {
    associatedtype PropertyType: Any
    
    static var property: PropertyType { get set }
}

protocol ExtensionPropertyStorable: class {
    associatedtype Property: PropertyProvider
}
extension ExtensionPropertyStorable {
    
    typealias Storable = Property.PropertyType
    
    var property: Storable {
        get { return objc_getAssociatedObject(self, String(describing: type(of: Storable.self))) as? Storable ?? Property.property }
        set { return objc_setAssociatedObject(self, String(describing: type(of: Storable.self)), newValue, .OBJC_ASSOCIATION_RETAIN) }
    }
}
extension UIControl: ExtensionPropertyStorable {
    
    class Property: PropertyProvider {
        static var property = [String: Target]()
    }
    
    public func addAction(with controlEvent: UIControl.Event = .touchUpInside, target: @escaping () ->()) {
        let key = String(describing: controlEvent)
        let target = Target(target: target)
        addTarget(target, action: target.action, for: controlEvent)
        property[key] = target
    }
    
    public func removeAction(with controlEvent: UIControl.Event = .touchUpInside) {
        let key = String(describing: controlEvent)
        let target = property[key]
        removeTarget(target, action: target?.action, for: controlEvent)
        property[key] = nil
    }
}
