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
//        let pubKey = "MFkwEwYHKoZIzj0CAQYIKoZIzj0DAQcDQgAEuy7mpu9PSCKGgHtXH/QDyqYAYHBu/19p9pD3BlxYWeLfLT/IKJZ0YKHZ4cH3kYBkOUW7J0R1zjoRZrg+lGvFsg==";
//        let signa = "MEUCIHnTcyPCXJMNClH5Ri2BhL+X386OQhFwI8+pwpC+dHcXAiEA8hh0unw61wuyM7QuQFouKpKSgMUnXsQpQdzz2pEW6ME=";
//        let msg = "d8af87b4d9a287eac30c480950c21f8d69f7b8e890b5ac5e259819a3a4bdd6f46f15fbf18ad43166d2448a7f298705a4e3c2f73b97c319eb9ac50df5ba668490"
        let pubKey = "BN5EPBA2516a5BbgfEiOmD5tjNUQhP/4SXnqhBwFl0or/OC50Qd5WKoCZvI9Rxx0xgUILnCFgom4+GTN/lGlVbM=";
        let signa = "MEUCIHNL7c4YzwI06ij5oUilTg+r/UxYfr6bfZuBFuRiyMW0AiEAid8nItrJTrjQ94yZ+ojquA/a0me04J5To9B/+crNmFU=";
        let msg = "d8af87b4d9a287eac30c480950c21f8d69f7b8e890b5ac5e259819a3a4bdd6f46f15fbf18ad43166d2448a7f298705a4e3c2f73b97c319eb9ac50df5ba668490"
        
        let isValid1 = GHCryptoKitManager.instance.verifyP256_ECDSA(pubKeyBase64: pubKey, signatureBase64: signa, msg: msg)
        let isValid2 = GHCryptoKitManager.instance.verifyP384_ECDSA(pubKeyBase64: pubKey, signatureBase64: signa, msg: msg)
        let isValid3 = GHCryptoKitManager.instance.verifyP521_ECDSA(pubKeyBase64: pubKey, signatureBase64: signa, msg: msg)
        print("finish")
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

