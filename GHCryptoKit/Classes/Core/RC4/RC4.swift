//
//  RC4.swift
//  GHCryptoKit
//
//  Created by sy on 2024/7/23.
//
//  RC4 流密码一种 对称的 RC4可以使用40位到256位的可变长度密钥

public struct RC4 {

    static func encryptData(_ data: Data, withKey key: Data) -> Data {
        return processData(data: data, key: key)
    }

    static func decryptData(_ data: Data, withKey key: Data) -> Data {
        return processData(data: data, key: key)
    }

    static func processData(data: Data, key: Data) -> Data {
        let keyLength = key.count
        let textLength = data.count
        var S = [UInt8](repeating: 0, count: 256)
        for i in 0..<256 {
            S[i] = UInt8(i)
        }
        var temp: UInt8
        // 根据密钥初始化S-box
        var i = 0
        var j = 0
        for _ in 0..<256 {
            j = (j + Int(S[i]) + Int(key[key.startIndex.advanced(by: i % keyLength)])) % 256
            temp = S[i]
            S[i] = S[j]
            S[j] = temp
            i += 1
        }
        // Encryption/Decryption
        var outBytes = [UInt8](repeating: 0, count: textLength)

        // Initialize k and l
        var k = 0
        var l = 0
        for t in 0..<textLength {
            k = (k + 1) % 256
            l = (l + Int(S[k])) % 256
            // Swap S[k] with S[l]
            let temp = S[k]
            S[k] = S[l]
            S[l] = temp
            let idx: Int = (Int(S[k]) + Int(S[l])) % 256
            let K = S[idx]
            outBytes[t] = data[t] ^ K
        }
        return Data(outBytes)
    }
}
