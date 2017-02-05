//
//  YYGRequest.swift
//  Negotiate
//
//  Created by 区块国际－yin on 17/2/5.
//  Copyright © 2017年 区块国际－yin. All rights reserved.
//


import Foundation
import Alamofire

protocol Request {
    
    var path: String { get }
    
    var method: HTTPMethod { get }
    
    var parameter: [String: AnyObject] { get }
    
    associatedtype Analysis: Decodable
}

protocol Decodable {
    static func parse(anyData: Any) -> Self?
}

protocol SenderRequest {
    func send<T: Request>(_ p: T, analysis: @escaping (T.Analysis?) -> Void)
}

struct SessionRequestSender: SenderRequest {
    func send<T : Request>(_ p: T, analysis: @escaping (T.Analysis?) -> Void) {
        
        Alamofire.request(p.path, method: p.method, parameters: p.parameter).responseJSON { (response) in
            switch response.result {
            case .success:
                if let anyData = response.result.value, let res = T.Analysis.parse(anyData: anyData) {
                    DispatchQueue.main.async {
                        analysis(res)
                    }
                }
            case .failure(_):
                break
            }
        }
    }
}
