//
//  GHFireBaseManager.swift
//  GHFirebase
//
//  Created by yang song on 2024/1/4.
//

import Foundation
import CryptoKit

public protocol EncryptProtocol {
    func encode256(pubKeyBase64: String, signatureBase64: String, msg: String)
}

public extension EncryptProtocol {
    
    func encode256(pubKeyBase64: String, signatureBase64: String, msg: String) {
        
        guard let pubData = Data(base64Encoded: pubKeyBase64), let signatureData = Data(base64Encoded: signatureBase64) else { return }
        
        let publicKey: P256.Signing.PublicKey
        do {
            publicKey = try P256.Signing.PublicKey(rawRepresentation: pubData)
        } catch {
            fatalError("Failed to create public key: \(error)")
        }

        // Convert the signature data to CryptoKit signature
        let signature: P256.Signing.ECDSASignature
        do {
            signature = try P256.Signing.ECDSASignature(derRepresentation: signatureData)
        } catch {
            fatalError("Failed to create signature: \(error)")
        }
        
        let isValid = publicKey.isValidSignature(signature, for: msg.data(using: .utf8)!)
        print("Signature is valid: \(isValid)")
        
    }
}

@objc open class GHCryptoKitManager: NSObject {
    
    /// 单例
    @objc public private(set) static var instance = GHCryptoKitManager()
    
}

extension GHCryptoKitManager: EncryptProtocol {
    
    @objc public func encode256(pubKeyBase64: String, signatureBase64: String, msg: String) {
        encode256(pubKeyBase64: pubKeyBase64, signatureBase64: signatureBase64, msg: msg)
    }
    
}
