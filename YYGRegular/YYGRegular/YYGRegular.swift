//
//  YYGRegular.swift
//  Ecshop
//
//  Created by 区块国际－yin on 16/11/3.
//  Copyright © 2016年 区块国际－yin. All rights reserved.
//

import UIKit

class YYGRegular: NSObject {

    
}






struct RegexHelper {
    
    let regex: NSRegularExpression
    
    init(_ pattern: String) throws {
        try regex = NSRegularExpression(pattern: pattern, options: .caseInsensitive)
    }
    
    func match(_ input: String) -> Bool {
        let matches = regex.matches(in: input, options: [], range: NSMakeRange(0, input.utf16.count))
        return matches.count > 0
    }
    
}
/// 邮箱的正则表达式
let mailPattern = "^([a-z0-9_\\.-]+)@([\\da-z\\.-]+)\\.([a-z\\.]{2,6})$"
