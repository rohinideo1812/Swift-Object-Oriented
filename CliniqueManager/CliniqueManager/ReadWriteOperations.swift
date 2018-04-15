//
//  ReadWriteOperations.swift
//  CliniqueManager
//
//  Created by BridgeLabz on 13/04/18.
//  Copyright © 2018 BridgeLabz. All rights reserved.
//

import Foundation
class ReadWriteOperation<T>{
    public var arrayToBeWrite : [T]?
    var readedData = [Any]()
    var readedArray = [T]()

    public let path : String?
    init(path : String) {
    self.path = path
        writeDataFromFile(path: path, dataToBeWrite: [arrayToBeWrite])
//        let readedArray = readDataFromFile(path: path)
    }
    
    func writeDataFromFile <T:Codable> (path : String,dataToBeWrite : [T]){
        var arrayOfDict:[Dictionary<String,Any>] = [Dictionary<String,Any>]()
        for T in dataToBeWrite  {
            let jsonEncoder = JSONEncoder()
            let jsonData = try! jsonEncoder.encode(T)
            guard   let jsonObj = try? JSONSerialization.jsonObject(with: jsonData, options: .allowFragments) as? Dictionary<String,Any> else{
                print("Fail to cast")
                return
            }
            arrayOfDict.append(jsonObj!)
        }
        guard let jsonData = try? JSONSerialization.data(withJSONObject: arrayOfDict, options: .prettyPrinted) else{
            print("Fail to cast")
            return
        }

        if let file:FileHandle = FileHandle(forUpdatingAtPath: path){
            file.truncateFile(atOffset: 0)
            file.write(jsonData)
            file.closeFile()
        }
    }
    func readDataFromFile<T:Codable>(path : String)->[T]{
        
        if let file:FileHandle = FileHandle(forReadingAtPath: path){
            
            if let json = try? JSONSerialization.jsonObject(with: file.availableData, options: .mutableLeaves) as? [Dictionary<String,Any>]{
                
                for obj in json!{
                    
                    let data = try? JSONSerialization.data(withJSONObject: obj, options: .prettyPrinted)
                    
                    let jsonDecoder = JSONDecoder()
                    
                    guard let decodedData = try? jsonDecoder.decode(T.self, from: data!) else{
                        
                        break
                        
                    }
                    
                    readedData.append(decodedData)
                    }
            }
            file.closeFile()
        }
        return readedData as! [T]
    }
    
}
