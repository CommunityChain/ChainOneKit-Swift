//
//  FileManager+Extension.swift
//  XiaoDeKit-iOS
//
//  Created by 小唐 on 05/02/2018.
//  Copyright © 2018 TangXiaoDe. All rights reserved.
//
//  文件管理器

import Foundation

extension FileManager {
    // 计算指定文件大小，文件夹也属于文件
    func fileSize(_ filePath: String) -> UInt64 {
        var fileSize: UInt64 = 0
        var isDir: ObjCBool = false
        let isExists = self.fileExists(atPath: filePath, isDirectory: &isDir)
        // 不存在处理
        if !isExists {
            return fileSize
        }
        // 文件类型分别处理(文件夹 或 文件)
        if isDir.boolValue {
            // 文件夹 遍历
            let enumerator = self.enumerator(atPath: filePath)
            for subPath in enumerator! {
                // 获得全路径
                let fullPath = filePath.appending("/\(subPath)")
                fileSize += self.fileSize(fullPath)

                //let attr = try! self.attributesOfItem(atPath: fullPath)
                //fileSize += attr[FileAttributeKey.size] as! UInt64
            }
        } else {
            // 文件
            let attr = try! self.attributesOfItem(atPath: filePath)
            fileSize += attr[FileAttributeKey.size] as! UInt64
        }

        return fileSize
    }

}
