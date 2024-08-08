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
        
        let encryption = Data([0xfe,0x96, 0xdf, 0xc0, 0xd9, 0x35, 0x42, 0x50, 0xaa ,0x13, 0x5d, 0x5c, 0x83, 0x8d, 0xc0, 0x2b, 0x2e, 0x31, 0x40, 0x51])
        let deResult = GHCryptoKitManager.instance.decryptBLEData(data: encryption)
        print(self.dataToHex(deResult))
        
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

