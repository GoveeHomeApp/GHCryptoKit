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
        
        let pubKey = "";
        let signa = "";
        let msg = ""
        
        let isValid1 = GHCryptoKitManager.instance.verifyP256_ECDSA(pubKeyBase64: pubKey, signatureBase64: signa, msg: msg)
        let isValid2 = GHCryptoKitManager.instance.verifyP384_ECDSA(pubKeyBase64: pubKey, signatureBase64: signa, msg: msg)
        let isValid3 = GHCryptoKitManager.instance.verifyP521_ECDSA(pubKeyBase64: pubKey, signatureBase64: signa, msg: msg)
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

