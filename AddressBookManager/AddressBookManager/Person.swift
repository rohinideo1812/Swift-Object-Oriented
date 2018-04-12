//
//  Person.swift
//  AddressBookManager
//
//  Created by BridgeLabz on 09/04/18.
//  Copyright © 2018 BridgeLabz. All rights reserved.
//

import Foundation
class Person : Codable{
    public private(set) var  firstName:String?
    public private(set) var lastName:String?
    public var telephoneNumber : Int?
    public var address : Address?

    init(firstName : String,lastName : String,telephoneNumber : Int,address : Address){
        self.firstName = firstName
        self.lastName = lastName
        self.telephoneNumber = telephoneNumber
        self.address = address

    }
    
    



}
