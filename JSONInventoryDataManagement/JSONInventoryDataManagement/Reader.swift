/******************************************************************************
 *  Purpose: JSON operation.
 *
 *  @author Rohini
 *  @version 4.0
 *  @since   30-03-2018
 *
 ******************************************************************************/

import Foundation
class Inventory{
    func acceptInputString()->String{
        if let input = readLine(){
            if Int(input) != nil{
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
//if let value = complete["Rice"] as? [Dictionary<String,Any>]{
//
//    for obj in value{
//        if let price = obj["price"] as? Int{
//            print(price)
//        }
//    }
//}
////Reading
//    if let theJSONData = try?  JSONSerialization.data(
//        withJSONObject: riceDetail,
//        options: .prettyPrinted
//        ),
//        let theJSONText = String(data: theJSONData,
//                                 encoding: String.Encoding.ascii) {
////        print("JSON string = \n\(theJSONText)")
//    }
