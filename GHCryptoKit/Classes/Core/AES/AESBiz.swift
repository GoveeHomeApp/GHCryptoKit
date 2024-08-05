//
//  AES128ECBBiz.swift
//  GHCryptoKit
//
//  Created by sy on 2024/7/24.
//

import Foundation
import CommonCrypto

public struct AESBiz {
    static func aes128ECBEncrypt(data: Data, key: Data) -> Data? {
        var cryptData = Data(count: data.count + kCCBlockSizeAES128)
        var cryptBytes: Int = 0
        
        let status = CCCrypt(CCOperation(kCCEncrypt),
                             CCAlgorithm(kCCAlgorithmAES128),
                             CCOptions(kCCOptionECBMode),
                             key.withUnsafeBytes { $0.baseAddress! },
                             key.count,
                             nil,
                             data.withUnsafeBytes { $0.baseAddress! },
                             data.count,
                             cryptData.withUnsafeMutableBytes { $0.baseAddress! },
                             cryptData.count,
                             &cryptBytes)
        
        if status == kCCSuccess {
            cryptData.removeSubrange(cryptBytes..<cryptData.count)
            return cryptData
        } else {
            return nil
        }
    }

    static func aes128ECBDecrypt(data: Data, key: Data) -> Data? {
        var cryptData = Data(count: data.count)
        var cryptBytes: Int = 0
        
        let status = CCCrypt(CCOperation(kCCDecrypt),
                             CCAlgorithm(kCCAlgorithmAES128),
                             CCOptions(kCCOptionECBMode),
                             key.withUnsafeBytes { $0.baseAddress! },
                             key.count,
                             nil,
                             data.withUnsafeBytes { $0.baseAddress! },
                             data.count,
                             cryptData.withUnsafeMutableBytes { $0.baseAddress! },
                             cryptData.count,
                             &cryptBytes)
        
        if status == kCCSuccess {
            cryptData.removeSubrange(cryptBytes..<cryptData.count)
            return cryptData
        } else {
            return nil
        }
    }
}
