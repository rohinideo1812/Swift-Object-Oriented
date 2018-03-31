/******************************************************************************
 *  Purpose: Functions for AddressBook.
 *
 *  @author Rohini
 *  @version 4.0
 *  @since   30-03-2018
 *
******************************************************************************/

import Foundation
class AddressBookOperation{
    func acceptInputInt()->Int{
        if let value = readLine(){
            if let input = Int(value){
                return input
            }
            else{
                print("Invalid Input")
            }
        }
        return 1
    }
    
    func acceptInputString()->String{
        if let value = readLine(){
            if Int(value) != nil{
                print("Invalid Input")
            }
            else{
                return value
            }
        }
        return ""
    }
    func acceptChoice(choice:Int){
        switch  choice {
        case 1 :addInfo()
        case 2 : editInfo()
        case 3 : deleteInfo()
        case 4 : showInfo()
        default:print("Invalid Input")
        }
    }
    var path = "/Users/bridgelabz/Documents/Swift-ObjectOriented/AddressBookManagement/AddressBookManagement/AddressBook.json"
    var addressbook:[Dictionary<String,Any>] = [Dictionary<String,Any>]()
    var array:[Dictionary<String,Any>] = [Dictionary<String,Any>]()
    var editarray:[Dictionary<String,Any>] = [Dictionary<String,Any>]()
    var deletearray:[Dictionary<String,Any>] = [Dictionary<String,Any>]()
    func addInfo(){
        print("Enter the first name")
        let firstname = acceptInputString()
        print("Enter the last name")
        let lastname = acceptInputString()
        print("Enter the Address")
        let address = acceptInputString()
        print("Enter the City")
        let city = acceptInputString()
        print("Enter the State")
        let state = acceptInputString()
        var zip = ""
        repeat{
            print("Zip code should be of length 6")
            print("Enter the zip")
            zip = String(acceptInputInt())
        } while zip.characters.count != 6
        var telephoneno = ""
        repeat{
            print("Telephone number should be of length 10")
            print("Enter the telephone number")
            telephoneno = String(acceptInputInt())
        } while telephoneno.characters.count != 10
            let addressbookmanagement:Dictionary<String,Any> = [
                "firstname" : firstname,
                "lastname" : lastname,
                "address" : address,
                "city" : city,
                "state" : state,
                "zip" : Int(zip),
                "telephone" : Int(telephoneno)
            ]
       
        if let file:FileHandle = FileHandle(forReadingAtPath: path){
                if let json = try? JSONSerialization.jsonObject(with: file.availableData, options: .mutableLeaves) as? [Dictionary<String,Any>]{
                    for d in json!{
                        array.append(d as Dictionary<String,Any>)
                    }
                }
                file.closeFile()
            }
            array.append(addressbookmanagement)

    
       //Write
    if let file:FileHandle = FileHandle(forWritingAtPath: path){
        if let jsonData = try? JSONSerialization.data(withJSONObject: array, options: .prettyPrinted){
            file.write(jsonData)
        }
        file.closeFile()
    }
        print("Addition Successfull")
    }

    func editInfo(){
        print("Enter the Telephone number of a person who is to be deleted")
        let telephone = acceptInputInt()
        if let file:FileHandle = FileHandle(forReadingAtPath: path){
            if let json = try? JSONSerialization.jsonObject(with: file.availableData, options: .mutableLeaves) as? [Dictionary<String,Any>]{
                for d in json!{
                    editarray.append(d as Dictionary<String,Any>)
                }
            }
            file.closeFile()
        }
        print(editarray)
let obj:[Dictionary<String,Any>] = editarray.filter({ $0["telephone"] as! Int == telephone})
        print(obj)
    
        print("Enter the first name")
        let firstname = acceptInputString()
        print("Enter the last name")
        let lastname = acceptInputString()
        print("Enter the Address")
        let address = acceptInputString()
        print("Enter the City")
        let city = acceptInputString()
        print("Enter the State")
        let state = acceptInputString()
        var zip = ""
        repeat{
            print("Zip code should be of length 6")
            print("Enter the zip")
            zip = String(acceptInputInt())
        } while zip.characters.count != 6
        var telephoneno = ""
        repeat{
            print("Telephone number should be of length 10")
            print("Enter the telephone number")
            telephoneno = String(acceptInputInt())
        } while telephoneno.characters.count != 10
        
        for var value in obj{
            value.updateValue(firstname, forKey: "firstname")
            value.updateValue(lastname, forKey: "lastname")
            value.updateValue(address, forKey: "address")
            value.updateValue(city, forKey: "city")
            value.updateValue(state, forKey: "state")
            value.updateValue(zip, forKey: "zip")
            value.updateValue(telephoneno, forKey: "telephone")
            print(value)
            if let file:FileHandle = FileHandle(forWritingAtPath: path){
                if let jsonData = try? JSONSerialization.data(withJSONObject: value, options: .prettyPrinted){
                    file.write(jsonData)
                }
                file.closeFile()
            }
        }
        

//        if let value = complete["Wheat"] as? [Dictionary<String,Any>]{
//            for obj in value{
//                if let price = obj["price"] as? Int{
//                    if let weight = obj["weight"] as? Int{
//                        print(price * weight)
//                        total += price * weight
//                    }
//                }
//            }
    }
    func deleteInfo(){
        print("Enter the Telephone number of a person who is to be deleted")
        var telephone = acceptInputInt()
        if let file:FileHandle = FileHandle(forReadingAtPath: path){
            if let json = try? JSONSerialization.jsonObject(with: file.availableData, options: .mutableLeaves) as? [Dictionary<String,Any>]{
                for d in json!{
                   deletearray.append(d as Dictionary<String,Any>)
                }
            }
            file.closeFile()
        }
        print(deletearray)
        if let index = deletearray.index(where: {$0["telephone"] as! Int == telephone}){
            deletearray.remove(at: index)
        }
        print(deletearray)
        print("Deletion Successfull")
        if let file:FileHandle = FileHandle(forWritingAtPath: path){
            if let jsonData = try? JSONSerialization.data(withJSONObject: deletearray, options: .prettyPrinted){
                file.write(jsonData)
            }
            file.closeFile()
        }
}
    
    func showInfo(){
        if let file:FileHandle = FileHandle(forReadingAtPath: path){
            if let json = try? JSONSerialization.jsonObject(with: file.availableData, options: .mutableLeaves) as? [Dictionary<String,Any>]{
                for d in json!{
                    array.append(d as Dictionary<String,Any>)
                }
            }
            file.closeFile()
        }
        print(array)
    }
}
//object getting
//   let obj:[Dictionary<String,Any>] = editarray.filter({ $0["telephone"] as! Int == telephone})

