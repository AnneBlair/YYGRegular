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
public func setAttribute(color: [[CGFloat]],content:[String],size: [CGFloat])-> NSMutableAttributedString {
    
    let str = NSMutableAttributedString()
    for i in 0..<color.count {
        str.append(NSAttributedString(string: content[i], attributes: [NSForegroundColorAttributeName: UIColor(red: color[i][0]/255.0, green: color[i][1]/255.0, blue: color[i][2]/255.0, alpha: 1), NSFontAttributeName:UIFont.systemFont(ofSize: size[i])]))
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
