//
//  Encryption.swift
//  AES
//
//  Created by tropsci on 16/3/2.
//  Copyright © 2016年 topsci. All rights reserved.
//

import Foundation

extension NSData {
    // MARK: - Encryption
    
    func AES256Encrypt(key: String) ->NSData? {
        let keyLength = kCCKeySizeAES256 + 1
        var keyPtr = [CChar](count: keyLength, repeatedValue: 0)
        key.getCString(&keyPtr, maxLength: keyLength, encoding: NSUTF8StringEncoding)
        var output = ""
        var dataOutMoved:Int = 0
        let status = CCCrypt(0, 0, 0x0001, keyPtr, kCCKeySizeAES256, nil, self.bytes, self.length, &output, self.length + kCCKeySizeAES256, &dataOutMoved)
        if status == 0 {
            return NSData(bytes: &output, length: dataOutMoved)
        }
        return nil
    }
    
    func AES256Decrypt(key: String) ->NSData? {
        let keyLength = kCCKeySizeAES256 + 1
        var keyPtr = [CChar](count:keyLength , repeatedValue: 0)
        key.getCString(&keyPtr, maxLength: keyLength, encoding: NSUTF8StringEncoding)
        var output = ""
        var dataOutMoved:Int = 0
        let status = CCCrypt(1, 0, 0x0001, keyPtr, kCCKeySizeAES256, nil, self.bytes, self.length, &output, self.length + kCCKeySizeAES256, &dataOutMoved)
        if status == 0 {
            return NSData(bytes: &output, length: dataOutMoved)
        }
        return nil
    }
    
}