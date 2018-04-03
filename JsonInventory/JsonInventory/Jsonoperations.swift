/******************************************************************************
 *  Purpose: Functions of JSONoperations
 *
 *  @author Rohini
 *  @version 4.0
 *  @since   28-03-2018
 *
 ******************************************************************************/

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
        var array1:[Dictionary<String,Any>] = [Dictionary<String,Any>]()
        array1.append(json2)
        if let file:FileHandle = FileHandle(forUpdatingAtPath: path){
            file.truncateFile(atOffset: 0)
            if let jsonData = try? JSONSerialization.data(withJSONObject: array1, options: .prettyPrinted){
                file.write(jsonData)
            }
            file.closeFile()
        }
    
    }
    
    func writeToJSONFile1(path:String){
        //Write to JSON File
        let json1:Dictionary<String,Any> = [ "name":"Rahul",
                                             "age":24,
                                             "city":"nasik",
                                             "education":"BE Computer"]
        var array1:[Dictionary<String,Any>] = [Dictionary<String,Any>]()
        array1.append(json1)
        if let file:FileHandle = FileHandle(forUpdatingAtPath: path){
            file.truncateFile(atOffset: 0)
            if let jsonData = try? JSONSerialization.data(withJSONObject: array1, options: .prettyPrinted){
                file.write(jsonData)
            }
            file.closeFile()
        }
    }
    

}
