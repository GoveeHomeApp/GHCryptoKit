//
//  ViewController.swift
//  GHCryptoKit
//
//  Created by GoveeHomeApp on 05/23/2024.
//  Copyright (c) 2024 GoveeHomeApp. All rights reserved.
//

import UIKit
import GHCryptoKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // 加载本地加密数据
        if let filePath = Bundle.main.path(forResource: "test-enc.gif", ofType: "enc") {
            if let fileData = try? Data(contentsOf: URL(fileURLWithPath: filePath)) {
                if let res = GHCryptoKitManager.instance.decryptResource(encryptData: fileData) {
                    
                }
            }
        }
        
        let pubKey = "BGM2hJ7CFNmq6hQgkAKEvzPg6kNCMYZuc7zuChi6Fst9g4FgeIUUra/NTUfr2z7Qdy86lYDBO9lmAjEXzvWw+bE=";
        let signa = "MEYCIQCnNVrCmDm2v3vBuxUJTJU2Rrb7j0aLv8jbjo8U3cOkJgIhAKB8JmpRD+/rbN7Dj90ckzfz5B/PiSnwHBJk1TQ2et1h";
        let msg = "ec6a5afeb18e802826c0d57c0fcfcc1596077d48237f9f78c85591893637694f852c12aafc0435cad08faada643a7673640fa3db9dc591634e2bb5f8ea808b98"
        
        _ = GHCryptoKitManager.instance.verifyP256_ECDSA(pubKeyBase64: pubKey, signatureBase64: signa, msg: msg)
        _ = GHCryptoKitManager.instance.verifyP384_ECDSA(pubKeyBase64: pubKey, signatureBase64: signa, msg: msg)
        _ = GHCryptoKitManager.instance.verifyP521_ECDSA(pubKeyBase64: pubKey, signatureBase64: signa, msg: msg)
        
        /**
         Printing description of data:
         <e7010000 00000000 00000000 00000000 000000e6>
         Printing description of key:
         <4d616b69 6e674c69 6665536d 61727465>
         Printing description of resultData:
         <a070ef26 9debe4df eb8af6f7 e67e83a6 68ee40b9>
         */
        
        let realData = Data([0xe7, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xe6])
        let result = GHCryptoKitManager.instance.encryptBLEData(data: realData)
        print(self.dataToHex(result))
        
        let encryption = Data([0xa0, 0x70, 0xef, 0x26, 0x9d, 0xeb, 0xe4, 0xdf, 0xeb ,0x8a, 0xf6, 0xf7, 0xe6, 0x7e, 0x83, 0xa6, 0x68, 0xee, 0x40, 0xb9])
        let deResult = GHCryptoKitManager.instance.decryptBLEData(data: encryption)
        print(self.dataToHex(deResult))
        
        
        var key: [UInt8] = [0x25, 0xdd, 0x6c, 0x18, 0x8b, 0x4b, 0x42, 0x36, 0x51, 0x99, 0x78, 0x34, 0x77, 0xc7, 0x0e, 0x12]
        var data: [UInt8] = [0x0d, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00]
        var slicing: [UInt8] = [00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00]
        let decp = GHCryptoKitManager.instance.encryptBLEData(data: Data(slicing), key: Data(key))
        print(self.dataToHex(decp))
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func dataToHex(_ data: Data) -> String {
        return data.map { String(format: "%02hhx ", $0) }.joined()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

