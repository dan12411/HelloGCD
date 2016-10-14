//
//  ViewController.swift
//  HelloGCD
//
//  Created by 洪德晟 on 2016/10/14.
//  Copyright © 2016年 洪德晟. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let task1 = {
            for i in 1...5 {
                print("Task1: \(i)")
            }
        }
        let task2 = {
            for i in 1...5 {
                print("Task2: \(i)")
            }
        }
        
        // 在主佇列工作 (main)，不要放同步的工作 (Main Queue)
        // 在主佇列只能放不同步的工作
        // 不會同時做，先做一件再做一件
        //DispatchQueue.main.sync(execute: task1)
        //DispatchQueue.main.async(execute: task1)
        //DispatchQueue.main.async(execute: task2)
//        DispatchQueue.main.async {
//            task1()
//            task2()
//        }
        
        // 在其他佇列工作
        // 可作同步的工作
        // 寫在一起，跟分開寫，意思不一樣，兩條不同執行緒在執行
        // 共時佇列(Concurrent Queue)
        DispatchQueue.global().sync {
            task1()
            task2()
        }
        DispatchQueue.global().sync {
            task1()
        }
        DispatchQueue.global().sync { 
            task2()
        }

    }
}

