//
//  arrayDataSource.swift
//  POC
//
//  Created by 区块国际－yin on 2017/3/9.
//  Copyright © 2017年 blog.aiyinyu.com. All rights reserved.
//

import UIKit

typealias cellConfigureClasure = (_ cell: Any,_ item: Any,_ indexPath: IndexPath)->Void

class arrayDataSource: NSObject,UITableViewDataSource {

    private var items: [Any]?
    private var cellIdentifier: String?
    private var configureCellClasure: cellConfigureClasure
    
    init(anItems: [Any],identifier: String,clasure: @escaping cellConfigureClasure) {
        items = anItems
        cellIdentifier = identifier
        configureCellClasure = clasure
    }
    
    //MARK:            dataSource        ________________________________________________________________________________________________
    
    func itemAtIndexPath(indexpath: IndexPath) -> Any {
        return items![indexpath.row]
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (items?.count)!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier!, for: indexPath)
        let item = itemAtIndexPath(indexpath: indexPath)
        configureCellClasure(cell,item,indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
}
