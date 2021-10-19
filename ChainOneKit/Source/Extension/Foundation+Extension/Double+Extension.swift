//
//  Double+Extension.swift
//  ChainOneKit
//
//  Created by 小唐 on 2019/2/14.
//  Copyright © 2019 ChainOne. All rights reserved.
//
//  小数扩展

import Foundation

public extension Double {

    /// 小数部分的有效位数处理
    func decimalValidDigitsProcess(digits: Int = 4, mode: NumberFormatter.RoundingMode = .down) -> String {

        // 0.00001 使用"\(value)" 或 String(stringInterpolationSegment: value) 会使用科学计数法标记
        // 514.25479966 使用 String(format: "%f", value) 方式会进行舍入
        // 通过将来 double -> String，然后再根据小数部分进行替换处理，其第一部分就有些问题

        // 使用 NumberFormatter 进行格式化处理
        let formatter = NumberFormatter()
        formatter.numberStyle = NumberFormatter.Style.decimal
        formatter.usesGroupingSeparator = false     // 是否显示分隔符
        formatter.roundingMode = mode              // 舍入方式
        //formatter.roundingIncrement = 0.0001        // 保留到哪位小数
        formatter.maximumFractionDigits = digits         // 小数最少位数

        // let result = 18.62321805 - 4.29119543 // result    Double    14.332022619999998
        // 使用NSNumber是14.332022619999998，而使用NSDecimalNumber则是14.33202262，其处理结果根据roundingMode会有差异
        //return formatter.string(from: NSNumber(value: self))!
        return formatter.string(from: NSDecimalNumber(value: self))!
    }

}

public extension Double {

    /// tb中大额数据处理
    func largeDecimalProcess() -> String {
        var strDecimal: String = self.decimalValidDigitsProcess(digits: 4)
        if self > 10_000 {
            strDecimal = String(format: "%d万", Int64(self) / 10_000)
        }
        return strDecimal
    }

}
