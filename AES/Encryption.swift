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
        let status = CCCrypt(UInt32(kCCEncrypt), UInt32(kCCAlgorithmAES), UInt32(kCCOptionPKCS7Padding), keyPtr, kCCKeySizeAES256, nil, self.bytes, self.length, &output, self.length + kCCKeySizeAES256, &dataOutMoved)
        if status == Int32(kCCSuccess) {
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
        let status = CCCrypt(UInt32(kCCDecrypt), UInt32(kCCAlgorithmAES), UInt32(kCCOptionPKCS7Padding), keyPtr, kCCKeySizeAES256, nil, self.bytes, self.length, &output, self.length + kCCKeySizeAES256, &dataOutMoved)
        if status == Int32(kCCSuccess) {
            return NSData(bytes: &output, length: dataOutMoved)
        }
        return nil
    }
    
}