//
//  Api.swift
//  Negotiate
//
//  Created by 区块国际－yin on 17/2/5.
//  Copyright © 2017年 区块国际－yin. All rights reserved.
//

import Foundation

struct Api {
    static let host = "http://api.isanjie.com/"
    
    static func map(path: String) -> String {
        return host + path
    }
    
    static var goodsParticularsURL: String {
        return map(path: "goods/getgoods")
    }
    ///  .... 接着继续其他接口的书写
}

