//
//  Date+Extension.swift
//  SwiftKit-XiaoDe
//
//  Created by 小唐 on 2018/8/20.
//  Copyright © 2018 TangXiaoDe. All rights reserved.
//
//  时间的扩展

import Foundation

public extension Date {

    /// 格式化输出时间  使用UTC时区表示时间  如：yyyy-MM-dd HH:mm:ss
    func string(format: String = "yyyy-MM-dd HH:mm:ss", timeZone: TimeZone? = TimeZone.current) -> String {
        let dateFormatter = DateFormatter()
        // 设置 格式化样式
        dateFormatter.dateFormat = format
        // 设置时区
        dateFormatter.timeZone = timeZone
        let strDate = dateFormatter.string(from: self)
        return strDate
    }

    /// 获取月份日期
    func getMonthDay(timeZone: TimeZone? = TimeZone.current) -> (month: Int, day: Int) {
        let dateFormatter = DateFormatter()
        // 设置时区
        dateFormatter.timeZone = timeZone
        // 设置 格式化样式
        dateFormatter.dateFormat = "MM"
        let month: Int = Int(dateFormatter.string(from: self)) ?? 0
        dateFormatter.dateFormat = "dd"
        let day: Int = Int(dateFormatter.string(from: self)) ?? 0
        return (month: month, day: day)
    }

}

public extension Date {

    static func dateWithString(_ dateString: String, format: String = "yyyy-MM-dd HH:mm:ss", timeZone: TimeZone? = TimeZone.current) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = timeZone
        dateFormatter.dateFormat = format
        return dateFormatter.date(from: dateString)
    }

}

public extension Date {
    /// 是否早于某个时间
    func isEarly(than compareDate: Date) -> Bool {
        return self < compareDate
    }

    /// 是否晚于某个时间
    func isLate(than compareDate: Date) -> Bool {
        return self >= compareDate
    }
}

public extension Date {

    func timeIntervalSecond() -> Int {
        return Int(self.timeIntervalSince1970)
    }
    func timeIntervalMilliSecond() -> UInt64 {
        let onlysecond = UInt64(self.timeIntervalSince1970)
        let onlyMilliSecond = UInt64(self.string(format: "SSS")) ?? UInt64(arc4random() % 1_000)
        let strMilliSecond = String.init(format: "%d%3d", onlysecond, onlyMilliSecond)
        let milliSecond = UInt64(strMilliSecond) ?? UInt64(self.timeIntervalSince1970 * 1_000)
        return milliSecond
    }

}
