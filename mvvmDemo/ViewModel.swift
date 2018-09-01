//
//  ViewModel.swift
//  mvvmDemo
//
//  Created by hao yin on 2018/8/31.
//  Copyright © 2018年 hao yin. All rights reserved.
//

import Foundation

public protocol ViewLayer:class{
    func update()
}
public protocol ViewModel:class{
    var viewLayer:ViewLayer? {get set}
    func dataUpdate()
}
extension ViewModel{
    public func dataUpdate(){
        DispatchQueue.main.async {
            self.viewLayer?.update()
        }
    }
}
public let VMQueue = DispatchQueue(label: "vm")
