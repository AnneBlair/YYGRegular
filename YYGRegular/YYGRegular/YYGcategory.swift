//
//  YYGcategory.swift
//  Ecshop
//
//  Created by 区块国际－yin on 16/10/24.
//  Copyright © 2016年 区块国际－yin. All rights reserved.
//


import Foundation
import UIKit

func printLogDebug<T>(_ message: T,
                   file: String = #file,
                   method: String = #function,
                   line: Int = #line
    )
{
    #if DEBUG
        print("------------------\(line) lineBegin-------------------------\n类名称: \((file as NSString).lastPathComponent)\n方法名: \(method)\n信息: \(message)\n------------------\(line) line  End-------------------------")
    #endif
}

/// 根据相应的组数对号入座
///
/// - sectionNum1: 第一组
/// - sectionNum2: 第二组
/// - sectionNum3: 第三组
/// - sectionNum4: 第四组
enum sectionNum: Int {
    case sectionNum1
    case sectionNum2
    case sectionNum3
    case sectionNum4
}

let UIScreeWidth: CGFloat = UIScreen.main.bounds.size.width
let UIScreeHeight: CGFloat = UIScreen.main.bounds.size.height



		
