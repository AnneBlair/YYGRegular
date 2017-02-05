//
//  RequestCenter.swift
//  Negotiate
//
//  Created by 区块国际－yin on 17/2/5.
//  Copyright © 2017年 区块国际－yin. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON


/// 商品详情请求
struct goodsParticulars: Request {

    var goodsId: String
    
    var path: String {
        return Api.goodsParticularsURL
    }
    
    var method: HTTPMethod = .post
    
    var parameter: [String : AnyObject] {
        return ["goods_id": goodsId as AnyObject]
    }
    
    typealias Analysis = ParticularsAnalysis
}

extension ParticularsAnalysis: Decodable {
    static func parse(anyData: Any) -> ParticularsAnalysis? {
        return ParticularsAnalysis(anyData: anyData)
    }
}

struct ParticularsAnalysis {
    
    var message: Bool
    var tempData: Any
    
    init?(anyData: Any) {
        
        let obj = JSON(anyData)
        
        guard let name = obj["errno"].int else {
            self.message = false
            return nil
        }
        
        if name == 2000 {
            self.message = true
            self.tempData = anyData
        } else {
            self.message = false
            self.tempData = anyData
            
        }
    }
}
