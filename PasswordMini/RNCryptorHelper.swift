//
//  RNCryptorHelper.swift
//  PasswordMini
//
//  Created by zll on 2016/12/24.
//  Copyright © 2016年 Godlike Studio. All rights reserved.
//

import UIKit
import RNCryptor

class RNCryptorHelper: NSObject {
    
    class func encrypt(data: Data, withPassword password: String) -> Data {
       return RNCryptor.encrypt(data: data, withPassword: password);
    }
    
    class func decrypt(data: Data, withPassword password: String) throws -> Data {
        return try RNCryptor.decrypt(data: data, withPassword: password);
    }
    
}
