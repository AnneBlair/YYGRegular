//
//  YYGText.swift
//  24demo
//
//  Created by 区块国际－yin on 17/2/10.
//  Copyright © 2017年 区块国际－yin. All rights reserved.
//

import UIKit

/// Seting AttributedString
///
/// - Parameters:
///   - color: 颜色 Arry [[RGB,RGB,RGB],[RGB,RGB,RGB]]
///   - content: 内容 Arry ["第一个"，"第二个"]
///   - size: 字体 Arry  [size1,size2]
/// - Returns: 富文本
public func setAttribute(color: [[Int]],content:[String],size: [CGFloat])-> NSMutableAttributedString {
    
    let str = NSMutableAttributedString()
    for i in 0..<color.count {
        str.append(NSAttributedString(string: content[i], attributes: [NSForegroundColorAttributeName: UIColor(hex: color[i][0]), NSFontAttributeName:UIFont.systemFont(ofSize: size[i])]))
    }
    return str
}

/// scientific Notation Transition Normal String
/// 9.0006e+07  Transition   90,006,000
/// - Parameter f_loat: Input
/// - Returns: Output
public func inputFOutputS(f_loat: Double) -> String {
    let numFormat = NumberFormatter()
    numFormat.numberStyle = NumberFormatter.Style.decimal
    let num = NSNumber.init(value: f_loat)
    return numFormat.string(from: num)!
}

// MARK: - 数字转换成字符串金额   11121.01   -> "11,121.01"  三位一个逗号
extension NSNumber {
    var dollars: String {
        let formatter: NumberFormatter = NumberFormatter()
        var result: String?
        formatter.numberStyle = NumberFormatter.Style.decimal
        result = formatter.string(from: self)
        if result == nil {
            return "error"
        }
        return result!
    }
}

extension String {
    /// 截取第一个到第任意位置
    ///
    /// - Parameter end: 结束的位值
    /// - Returns: 截取后的字符串
    func stringCut(end: Int) ->String{
        printLogDebug(self.characters.count)
        if !(end < characters.count) { return "截取超出范围" }
        let sInde = index(startIndex, offsetBy: end)
        return substring(to: sInde)
    }
    
    /// 截取人任意位置到结束
    ///
    /// - Parameter end:
    /// - Returns: 截取后的字符串
    func stringCutToEnd(star: Int) -> String {
        if !(star < characters.count) { return "截取超出范围" }
        let sRang = index(startIndex, offsetBy: star)..<endIndex
        return substring(with: sRang)
    }
    
    /// 字符串任意位置插入
    ///
    /// - Parameters:
    ///   - content: 插入内容
    ///   - locat: 插入的位置
    /// - Returns: 添加后的字符串
    func stringInsert(content: String,locat: Int) -> String {
        if !(locat < characters.count) { return "截取超出范围" }
        let str1 = stringCut(end: locat)
        let str2 = stringCutToEnd(star: locat)
        return str1 + content + str2
    }
}


