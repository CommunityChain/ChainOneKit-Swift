//
//  Timer+Extension.swift
//  SwiftKit-XiaoDe
//
//  Created by 小唐 on 25/06/2018.
//  Copyright © 2018 TangXiaoDe. All rights reserved.
//
//  Timer的扩展

import Foundation

extension Timer {

    /// 暂停
    func pause() {
        if self.isValid {
            self.fireDate = Date.distantFuture
        }
    }

    /// 唤醒
    func resume() {
        if self.isValid {
            self.fireDate = Date()
        }
    }

    /// 指定时间后唤醒
    func resumeAfterInterval(_ interval: TimeInterval ) {
        if self.isValid {
            self.fireDate = Date(timeIntervalSinceNow: interval)
        }
    }

    /// 停止 - 建议使用处自己写，并设置为nil

}
