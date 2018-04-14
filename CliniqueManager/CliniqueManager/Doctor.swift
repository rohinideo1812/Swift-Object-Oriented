//
//  Doctor.swift
//  CliniqueManager
//
//  Created by BridgeLabz on 13/04/18.
//  Copyright © 2018 BridgeLabz. All rights reserved.
//

import Foundation
class Doctor{
    public var id : Int?
    public var numberOfPatient : Int?
    public var name : String?
    public var specialization : String?
    public var availability : String?
    
    init(id : Int,name : String,specialization : String,availability : String,numberOfPatient : Int) {
        self.id = id
        self.name = name
        self.specialization = specialization
        self.availability = availability
        self.numberOfPatient = numberOfPatient
    }
}
