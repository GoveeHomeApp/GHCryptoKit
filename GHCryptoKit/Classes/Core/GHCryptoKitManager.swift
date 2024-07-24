//
//  GHFireBaseManager.swift
//  GHFirebase
//
//  Created by yang song on 2024/1/4.
//

import Foundation

@objc open class GHCryptoKitManager: NSObject {
    /// 单例
    @objc public private(set) static var instance = GHCryptoKitManager()
    
}

extension GHCryptoKitManager: EncryptProtocol {
    
    @objc public func verifyP256_ECDSA(pubKeyBase64: String, signatureBase64: String, msg: String) -> Bool {
        return verify256(pubKeyBase64: pubKeyBase64, signatureBase64: signatureBase64, msg: msg)
    }
    
    @objc public func verifyP384_ECDSA(pubKeyBase64: String, signatureBase64: String, msg: String) -> Bool {
        return verify384(pubKeyBase64: pubKeyBase64, signatureBase64: signatureBase64, msg: msg)
    }
    
    @objc public func verifyP521_ECDSA(pubKeyBase64: String, signatureBase64: String, msg: String) -> Bool {
        return verify521(pubKeyBase64: pubKeyBase64, signatureBase64: signatureBase64, msg: msg)
    }
    
    ///  AES + RC4 single pack encrypt; params: data -> origin key -> secertKey position: sub position default is 16 default length is 20
    @objc public func encryptBLEData(data: Data, key: Data? = nil) -> Data {
        return gh_encryptData(data: data, key)
    }
    @objc public func encryptBLEData(data: Data) -> Data {
        return gh_encryptData(data: data, nil)
    }
    ///  AES + RC4 single pack decrypt; params: data -> origin key -> secertKey position: sub position default is 16 default length is 20
    @objc public func decryptBLEData(data: Data, key: Data? = nil) -> Data {
        return gh_decryptData(data: data, key)
    }
    @objc public func decryptBLEData(data: Data) -> Data {
        return gh_decryptData(data: data, nil)
    }
    ///  AES + RC4 multi pack encrypt; params: data -> origin key -> secertKey position: sub position default is 16 default length is 20
    @objc public func encryptBLEDataArray(dataArray: [Data], key: Data? = nil) -> [Data] {
        return gh_encryptDataArray(dataArray: dataArray, key)
    }
    @objc public func encryptBLEDataArray(dataArray: [Data]) -> [Data] {
        return gh_encryptDataArray(dataArray: dataArray, nil)
    }
    ///  AES + RC4 multi pack decrypt; params: data -> origin key -> secertKey position: sub position default is 16 default length is 20
    @objc public func decryptBLEDataArray(dataArray: [Data], key: Data? = nil) -> [Data] {
        return gh_decryptDataArray(dataArray: dataArray, key)
    }
    @objc public func decryptBLEDataArray(dataArray: [Data]) -> [Data] {
        return gh_decryptDataArray(dataArray: dataArray, nil)
    }
    
}
