//
//  ViewController.swift
//  AES
//
//  Created by tropsci on 16/3/2.
//  Copyright © 2016年 topsci. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let key = "fff"
        let data = "Hello world!".dataUsingEncoding(NSUTF8StringEncoding)
        let edata = data?.AES256Encrypt(key)
        
        
        let path = "\(NSHomeDirectory())/Documents/encrypt.data"
        try! NSFileManager.defaultManager().removeItemAtPath(path)
        edata?.writeToFile(path, atomically: true)
        
        
        print(String(data: edata!, encoding: NSUTF8StringEncoding))
        
        
        let ddata = edata!.AES256Decrypt(key)
        let outString = String(data: ddata!, encoding: NSUTF8StringEncoding)
        print("\(outString)")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

