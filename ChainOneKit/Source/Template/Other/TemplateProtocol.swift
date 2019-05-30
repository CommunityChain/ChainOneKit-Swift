//
//  TemplateProtocol.swift
//  SwiftKit-XiaoDe
//
//  Created by 小唐 on 13/02/2018.
//  Copyright © 2018 ChainOne. All rights reserved.
//
//  protocol 的使用模板

import Foundation
import UIKit

protocol TemplateProtocol {
    
}

protocol TemplateClassProtocol: class {
    
}

// MARK: - Opitional Protocol

/**
OC中关于可选协议实现的方案
 
Swift关于可选协议实现的方案
 方案1：协议中声明接口，协议的extension中默认实现该接口；
 方案2：协议中不声明该接口，直接在协议的extension中实现该接口作为默认实现；
 方案3：在方案2的基础上对该协议的扩展进行限定
 **/

protocol TemplateOptionalProtocol: class {
    func mustFunction() -> Void
    // optional
    func optionalFunction() -> Void
}
extension TemplateOptionalProtocol {
    func optionalFunction() -> Void {
        
    }
}

protocol TemplateOptionalProtocol2 {
    func mustFunction() -> Void
}
extension TemplateOptionalProtocol2 {
    func optionalFunction() -> Void {
        
    }
}


protocol TemplateOptionalProtocol3 {
    func mustFunction() -> Void
}
extension TemplateOptionalProtocol3 where Self: UIViewController {
    func optionalFunction() -> Void {
        
    }
}

class TemplateClass1 {
    
}
extension TemplateClass1: TemplateOptionalProtocol {
    func mustFunction() -> Void {
        
    }
}

class TemplateClass2 {
    
}
extension TemplateClass2: TemplateOptionalProtocol2 {
    func mustFunction() -> Void {
        
    }
}



class TemplateClass3: UIViewController {

}
extension TemplateClass3: TemplateOptionalProtocol3 {
    func mustFunction() -> Void {

    }
}


