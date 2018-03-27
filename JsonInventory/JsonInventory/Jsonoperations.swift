//
//  Jsonoperations.swift
//  JsonInventory
//
//  Created by BridgeLabz on 27/03/18.
//  Copyright © 2018 BridgeLabz. All rights reserved.
//

import Foundation
class JSONOperation{
    var array:[Dictionary<String,Any>] = [Dictionary<String,Any>]()
    let filePath = "/Users/bridgelabz/Documents/Swift-ObjectOriented/JsonInventory/JsonInventory/File.json"
    let json2:Dictionary<String,Any> = [ "name":"Rohini",
                                         "age":22,
                                         "city":"mumbai",
                                         "education":"BE Computer"]

    func readFromJSONFile(path:String){
        //Read JSON File
        if let file:FileHandle = FileHandle(forReadingAtPath: path){
            if let json = try? JSONSerialization.jsonObject(with: file.availableData, options: .mutableLeaves) as? [Dictionary<String,Any>]{
                for d in json!{
                    array.append(d as Dictionary<String,Any>)
                }
            }
            file.closeFile()
        }
        array.append(json2)
    }
    func writeToJSONFile(path:String){
        //Write to JSON File
        if let file:FileHandle = FileHandle(forWritingAtPath: path){
            if let jsonData = try? JSONSerialization.data(withJSONObject: array, options: .prettyPrinted){
                file.write(jsonData)
            }
            file.closeFile()
        }
    }
   
}

