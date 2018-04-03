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
    var path = "/Users/bridgelabz/Documents/Swift-ObjectOriented/AddressBookManagement/AddressBookManagement/AddressBook.json"
    var addressbook:[Dictionary<String,Any>] = [Dictionary<String,Any>]()
    var array:[Dictionary<String,Any>] = [Dictionary<String,Any>]()
    var array1:[Dictionary<String,Any>] = [Dictionary<String,Any>]()
    var deletearray:[Dictionary<String,Any>] = [Dictionary<String,Any>]()
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
        guard let zipcode = Int(zip) else{
            return
        }
        var telephoneno = ""
        repeat{
            print("Telephone number should be of length 10")
            print("Enter the telephone number")
            telephoneno = String(acceptInputInt())
        } while telephoneno.characters.count != 10
        guard let telephone = Int(telephoneno) else{
            return
        }
        
            let addressbookmanagement:Dictionary<String,Any> = [
                "firstname" : firstname,
                "lastname" : lastname,
                "address" : address,
                "city" : city,
                "state" : state,
                "zip" : zipcode,
                "telephone" : telephone
            ]
        array.append(addressbookmanagement)
        print(array)
       //Write
        if let file:FileHandle = FileHandle(forUpdatingAtPath: path){
            file.truncateFile(atOffset: 0)
            if let jsonData = try? JSONSerialization.data(withJSONObject: array, options: .prettyPrinted){
                file.write(jsonData)
                print(jsonData)
            }
            file.closeFile()
      }
        print("Addition Successfull")
    }

    func editInfo(){
   var editarray:[Dictionary<String,Any>] = [Dictionary<String,Any>]()
    editarray.removeAll()
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
        print("editarray")
        print(editarray)
        guard let index = editarray.index(where: {$0["telephone"] as! Int == telephone}) else{
            return
        }
        print(index)
 let obj:[Dictionary<String,Any>] = editarray.filter({ $0["telephone"] as! Int == telephone})
        print("object")
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
        guard let zipcode = Int(zip) else{
            return
        }
        var telephoneno = ""
        repeat{
            print("Telephone number should be of length 10")
            print("Enter the telephone number")
            telephoneno = String(acceptInputInt())
        } while telephoneno.characters.count != 10
        guard let telephonenumber = Int(telephoneno) else{
            return
        }
        for var value in obj{
            value.updateValue(firstname, forKey: "firstname")
            value.updateValue(lastname, forKey: "lastname")
            value.updateValue(address, forKey: "address")
            value.updateValue(city, forKey: "city")
            value.updateValue(state, forKey: "state")
            value.updateValue(zipcode, forKey: "zip")
            value.updateValue(telephonenumber, forKey: "telephone")
            print(value)
        print("before remove Editarray")
        print(editarray)
        editarray.remove(at: index)
        editarray.insert(value, at: index)
        print("After insert")
        print(editarray)
      }
        if let file:FileHandle = FileHandle(forUpdatingAtPath: path){
            file.truncateFile(atOffset: 0)
            if let jsonData = try? JSONSerialization.data(withJSONObject: editarray, options: .prettyPrinted){
                file.write(jsonData)
            }
            file.closeFile()
        }

}

   func deleteInfo(){
    deletearray.removeAll()
        print("Enter the Telephone number of a person who is to be deleted")
    let telephone = acceptInputInt()
        if let file:FileHandle = FileHandle(forReadingAtPath: path){
            if let json = try? JSONSerialization.jsonObject(with: file.availableData, options: .mutableLeaves) as? [Dictionary<String,Any>]{
                for d in json!{
                   deletearray.append(d as Dictionary<String,Any>)
                }
            }
            file.closeFile()
        }
        print(deletearray)
    if  let index = deletearray.index(where: {$0["telephone"] as! Int == telephone}){
            deletearray.remove(at: index)
    }
            print(deletearray)
            print("Deletion Successfull")
       
    
    if let file:FileHandle = FileHandle(forUpdatingAtPath: path){
        file.truncateFile(atOffset: 0)
        if let jsonData = try? JSONSerialization.data(withJSONObject: deletearray, options: .prettyPrinted){
            file.write(jsonData)
        }
        file.closeFile()
    }

}
    func showInfo(){
         array1.removeAll()
        if let file:FileHandle = FileHandle(forReadingAtPath: path){
            if let json = try? JSONSerialization.jsonObject(with: file.availableData, options: .mutableLeaves) as? [Dictionary<String,Any>]{
                for d in json!{
                    array1.append(d as Dictionary<String,Any>)
                }
            }
            file.closeFile()
        }
        print(array1)
    }
}
//object getting
//   let obj:[Dictionary<String,Any>] = editarray.filter({ $0["telephone"] as! Int == telephone})


