//
//  ViewController.swift
//  mvvmDemo
//
//  Created by hao yin on 2018/8/31.
//  Copyright © 2018年 hao yin. All rights reserved.
//

import UIKit

class ViewController: UIViewController,ViewLayer {
    func update() {
        self.le.text = vm.str
        self.b.text = vm.i
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(le)
        self.view.addSubview(b)
        vm.viewLayer = self
        vm.request(i: 100)
        // Do any additional setup after loading the view, typically from a nib.
    }
    let le = UILabel(frame: CGRect(x: 0, y: 0, width: 300, height: 40))
    let b = UILabel(frame: CGRect(x: 0, y: 100, width: 300, height: 40))
    let vm = VCViewModel()
}

class VCViewModel:ViewModel{
    weak var viewLayer: ViewLayer?
    var str:String = ""
    var i:String = ""
    func request(i:Int){
        VMQueue.asyncAfter(deadline: .now() + .seconds(1)) {
            self.str = "\(i) s"
            self.i = "\(i) h"
            self.dataUpdate()
        }
    }
}
