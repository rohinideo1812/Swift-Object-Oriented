/******************************************************************************
 *  Purpose: ReadWrite Class.
 *
 *  @author  Rohini
 *  @version 1.0
 *  @since   13-04-2018
 *
 ******************************************************************************/


import Foundation
class ReadWriteFileOperations{
   func readDataFromFile <T:Decodable> (path : String,type : T.Type,callback : (_ list : [T])-> Void){
        var list = [T]()
        if let file:FileHandle = FileHandle(forReadingAtPath: path){
            if let lJson = try? JSONSerialization.jsonObject(with: file.availableData, options: .mutableLeaves) as? [Dictionary<String,Any>]{
                for obj in lJson!{
                    let lData = try? JSONSerialization.data(withJSONObject: obj, options: .prettyPrinted)
                    let jsonDecoder = JSONDecoder()
                    guard let decodedData = try? jsonDecoder.decode(
                        type, from: lData!) else{
                        return
                    }
                    list.append(decodedData)
                }
                callback(list)
            }
            file.closeFile()
        }
        
}
    func writeDataToFile <T:Encodable>(path : String,arrayToBeWritten : [T] ){
        var arrayOfDict:[Dictionary<String,Any>] = [Dictionary<String,Any>]()
        for T in arrayToBeWritten{
            
            let jsonEncoder = JSONEncoder()
            let jsonData = try! jsonEncoder.encode(T)
            guard  let jsonObj = try? JSONSerialization.jsonObject(with: jsonData, options: .allowFragments) as? Dictionary<String,Any> else{
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
}
