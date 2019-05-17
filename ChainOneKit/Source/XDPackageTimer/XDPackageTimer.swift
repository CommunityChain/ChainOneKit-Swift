//
//  XDPackageTimer.swift
//  SwiftTemplate
//
//  Created by 小唐 on 2019/4/10.
//  Copyright © 2019 TangXiaoDe. All rights reserved.
//
//  Timer封装，解决内存循环引用问题
/**
 以控制器TimerVC使用Timer为例：
 1. 第一次强引用：TimerVC持有timer作为属性；
    通过设置timer为nil可解除引用、通过弱引用timer可解除引用；
 2. 第二次强引用：TimerVC作为Target被timer持有，而Runloop持有timer；
    通过timer.invalidate()可解除引用；
 但是：作为Target时，在TimerVC的deinit方法中使用timer.invalidate()不可解除循环引用，即使TimerVC若引用timer。
 循环引用：Runloop持有timer，timer持有timer的target即TimerVC，timer需要在TimerVC的deinit方法中使用invalidate方法解除定时器，TimerVC被强引用无法执行deinit解除定时器；
 
 如何解除呢？
    方案0. 合适的位置调用invalidate解除定时器，如viewWillDisApper之类，但不能是deinit中；
    方案1. 使用第三者作为Target：TimerVC持有timer，第三者Target弱引用TimerVC，Runloop持有timer的target即第三者Target。
        方案1方式1. block实现，使用Timer类对象作为target，类似于iOS10中的block实现方案；
        方案1方式2. 封装timer，弱引用target，类似于XDPackageTimer；
        方案1方式3. OC中实现NSProxy，对消息转发进行处理；
        方式2 和 方式3 本质一样：建立一个桥接timer的实例，弱引用target，让timer强引用这个实例。
 **/

import Foundation

public class XDPackageTimer {
    
    fileprivate weak var target: AnyObject!
    fileprivate var selector: Selector
    
    public init(target: AnyObject, selector: Selector) {
        self.target = target
        self.selector = selector
    }
    
    /// 类方法提供timer构造
    public class func timerWithInterval(timeInterval: TimeInterval, target: AnyObject, selector: Selector, userInfo: [String: Any]?, repeats: Bool) -> Timer {
        let packageTimer = XDPackageTimer.init(target: target, selector: selector)
        let timer = Timer.scheduledTimer(timeInterval: timeInterval, target: packageTimer, selector: #selector(timerd(_:)), userInfo: userInfo, repeats: repeats)
        return timer
    }
    
    /// timer方法
    @objc fileprivate func timerd(_ timer: Timer) -> Void {
        _ = self.target.perform(self.selector, with: timer)
    }
    
}
