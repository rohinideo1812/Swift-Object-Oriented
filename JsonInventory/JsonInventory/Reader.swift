//
//  Reader.swift
//  JsonInventory
//
//  Created by BridgeLabz on 27/03/18.
//  Copyright © 2018 BridgeLabz. All rights reserved.
//

import Foundation
class Reader{
func acceptInputString()->String{
    if let input = readLine(){
        if let value = Int(input){
            print("Entered value is not of string type")
        }
        else{
            return input
        }
    }
    return ""
}


func acceptInputInt()->Int{
    if let input = readLine(){
        if let value = Int(input){
            return value
        }
        else{
            print("Entered value is not a integer type")
        }
    }
    return 1
}
}
