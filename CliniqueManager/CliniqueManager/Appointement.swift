//
//  Appointement.swift
//  CliniqueManager
//
//  Created by BridgeLabz on 13/04/18.
//  Copyright © 2018 BridgeLabz. All rights reserved.
//

import Foundation
class Apointement{
    public var patient : Patient?
    public var doctorId : Int?
    public var date : String?
    init(patient : Patient,doctorId : Int,date : String) {
        self.date = date
        self.doctorId = doctorId
        self.patient = patient
    }
}
