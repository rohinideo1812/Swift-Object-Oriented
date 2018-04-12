//
//  Address.swift
//  AddressBookManager
//
//  Created by BridgeLabz on 09/04/18.
//  Copyright © 2018 BridgeLabz. All rights reserved.
//

import Foundation
class Address : Codable{
    public var state : String?
    public var zip : Int?
    public var address : String?
    public var city : String?

    init(state : String,zip : Int,address : String,city : String) {
        self.state = state
        self.city = city
        self.address = address
        self.zip = zip
    }
}











