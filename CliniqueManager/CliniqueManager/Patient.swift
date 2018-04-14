//
//  Patient.swift
//  CliniqueManager
//
//  Created by BridgeLabz on 13/04/18.
//  Copyright © 2018 BridgeLabz. All rights reserved.
//

import Foundation
class Patient{
    public var id : Int?
    public var name : String?
    public var mobileNumber : Int?
    public var age : Int?
   
    
    init(id : Int,name : String,mobileNumber : Int,age : Int) {
        self.id = id
        self.name = name
        self.mobileNumber = mobileNumber
        self.age = age
       
    }
}
