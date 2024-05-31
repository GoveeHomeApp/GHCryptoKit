//
//  GHFireBaseManager.swift
//  GHFirebase
//
//  Created by yang song on 2024/1/4.
//

import Foundation
import CryptoKit

public protocol EncryptProtocol {
    func verify256(pubKeyBase64: String, signatureBase64: String, msg: String) -> Bool
    func verify384(pubKeyBase64: String, signatureBase64: String, msg: String) -> Bool
    func verify521(pubKeyBase64: String, signatureBase64: String, msg: String) -> Bool
}

public extension EncryptProtocol {
    
    func verify256(pubKeyBase64: String, signatureBase64: String, msg: String) -> Bool {
        var isValid = false
        guard let pubData = Data(base64Encoded: pubKeyBase64, options: .ignoreUnknownCharacters), 
                let signatureData = Data(base64Encoded: signatureBase64, options: .ignoreUnknownCharacters) else { return false }
//        pubData.map { print($0) }
        let publicKey: P256.Signing.PublicKey
        do {
//            if #available(iOS 14.0, *) {
//                publicKey = try P256.Signing.PublicKey(derRepresentation: pubData)
//            } else {
//                // Fallback on earlier versions
//                publicKey = try P256.Signing.PublicKey(rawRepresentation: pubData)
//            }
//            publicKey = try P256.Signing.PublicKey(rawRepresentation: pubData)
//            publicKey = try P256.Signing.PublicKey(compactRepresentation: pubData)
            publicKey = try P256.Signing.PublicKey(x963Representation: pubData)
//            publicKey = try P256.Signing.PublicKey(derRepresentation: pubData)
        } catch {
            print("P256 ECDSA Failed to create public key: \(error)")
            return false
        }

        // Convert the signature data to CryptoKit signature
        let signature: P256.Signing.ECDSASignature
        do {
            signature = try P256.Signing.ECDSASignature(derRepresentation: signatureData)
        } catch {
            print("P256 ECDSA Failed to create signature: \(error)")
            return false
        }
        let msgData = msg.data(using: .utf8)
        isValid = publicKey.isValidSignature(signature, for: msgData!)
        print("P256 ECDSA Signature is valid: \(isValid)")
        return isValid
    }
    
    func verify384(pubKeyBase64: String, signatureBase64: String, msg: String) -> Bool {
        var isValid = false
        guard let pubData = Data(base64Encoded: pubKeyBase64, options: .ignoreUnknownCharacters), let signatureData = Data(base64Encoded: signatureBase64, options: .ignoreUnknownCharacters) else { return false }
        
        let publicKey: P384.Signing.PublicKey
        do {
            if #available(iOS 14.0, *) {
                publicKey = try P384.Signing.PublicKey(derRepresentation: pubData)
            } else {
                // Fallback on earlier versions
                publicKey = try P384.Signing.PublicKey(rawRepresentation: pubData)
            }
        } catch {
            print("P384 ECDSA Failed to create public key: \(error)")
            return false
        }

        // Convert the signature data to CryptoKit signature
        let signature: P384.Signing.ECDSASignature
        do {
            signature = try P384.Signing.ECDSASignature(derRepresentation: signatureData)
        } catch {
            print("P384 ECDSA Failed to create signature: \(error)")
            return false
        }
        
        isValid = publicKey.isValidSignature(signature, for: msg.data(using: .utf8)!)
        print("P384 ECDSA Signature is valid: \(isValid)")
        return isValid
    }
    
    func verify521(pubKeyBase64: String, signatureBase64: String, msg: String) -> Bool {
        var isValid = false
        guard let pubData = Data(base64Encoded: pubKeyBase64, options: .ignoreUnknownCharacters), let signatureData = Data(base64Encoded: signatureBase64, options: .ignoreUnknownCharacters) else { return false }
        
        let publicKey: P521.Signing.PublicKey
        do {
            if #available(iOS 14.0, *) {
                publicKey = try P521.Signing.PublicKey(derRepresentation: pubData)
            } else {
                // Fallback on earlier versions
                publicKey = try P521.Signing.PublicKey(rawRepresentation: pubData)
            }        } catch {
            print("P521 ECDSA Failed to create public key: \(error)")
            return false
        }

        // Convert the signature data to CryptoKit signature
        let signature: P521.Signing.ECDSASignature
        do {
            signature = try P521.Signing.ECDSASignature(derRepresentation: signatureData)
        } catch {
            print("P521 ECDSA Failed to create signature: \(error)")
            return false
        }
        
        isValid = publicKey.isValidSignature(signature, for: msg.data(using: .utf8)!)
        print("P521 ECDSA Signature is valid: \(isValid)")
        return isValid
    }
    
}

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
    
}
