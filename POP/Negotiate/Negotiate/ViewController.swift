//
//  ViewController.swift
//  Negotiate
//
//  Created by 区块国际－yin on 17/2/5.
//  Copyright © 2017年 区块国际－yin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        SessionRequestSender().send(goodsParticulars(goodsId: "580", method: .post), analysis: { ParticularsAnalysis in
//            ParticularsAnalysis?.message
//            ParticularsAnalysis?.tempData
            
        })
    }

}

