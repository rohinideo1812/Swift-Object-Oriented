//
//  AddressBook.swift
//  AddressBookManager
//  Created by BridgeLabz on 09/04/18.
//  Copyright © 2018 BridgeLabz. All rights reserved.
//

import Foundation
class AddressBook{
    let path : String?
    var personList = [Person]()
     var sortList = [Person]()
    var streamArray: Array<Data> = Array()

    let msg = "Invalid Input"
    init(path : String){
    self.path = path
    readDataFromFile(path1: path)


    }
    func readDataFromFile(path1 : String){
        if let file:FileHandle = FileHandle(forReadingAtPath: path1){
            if let json = try? JSONSerialization.jsonObject(with: file.availableData, options: .mutableLeaves) as? [Dictionary<String,Any>]{
                for obj in json!{
                    let data = try? JSONSerialization.data(withJSONObject: obj, options: .prettyPrinted)
                    let jsonDecoder = JSONDecoder()
                    guard let personData = try? jsonDecoder.decode(Person.self, from: data!) else{
                        return
                    }
                    personList.append(personData)
                }
            }
            file.closeFile()
        }
        operations()
    }
    func writeDataToFile(path : String){
       
        var arrayOfDict:[Dictionary<String,Any>] = [Dictionary<String,Any>]()

        for i in personList{

            let jsonEncoder = JSONEncoder()
            let jsonData = try! jsonEncoder.encode(i)
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
    func operations(){
        print("Choose Operations You want to perform")
        print("1:Add Details Of Person\n2:Edit Details Of Person\n3:Delete Details Of Person\n4:sort Details Of Person By Name\n5:Sort Details Of Person By Zip\n6:Print the AddressBook")
        let choice = acceptInputInt()
        switch choice{
        case 1 : add()
        case 2 : edit()
        case 3 : delete()
        case 4 : sortByName()
        case 5 : sortByZip()
        case 6 : show()
        default : print("Invalid Input")
        }
    }
    func add(){
        
        print("Enter the number of times")
        let number = acceptInputInt()
        for _ in 0..<number{
        print("Enter the First name")
        guard let firstName = readLine() else{
        fatalError(msg)
        }
        print("Enter the Lastname")
        guard let lastName = readLine() else{
            fatalError(msg)
        }
        print("Enter the Address")
        guard let address1 = readLine() else{
            fatalError(msg)
        }
        print("Enter the State")
        guard let state = readLine() else{
            fatalError(msg)
        }
        print("Enter the City")
        guard let city = readLine() else{
            fatalError(msg)
        }
        
        print("Enter the Zip code")
        guard let zip = readLine() else{
            fatalError(msg)
        }
        print("Enter the Telephone Number")
        guard let telephone = readLine() else{
            fatalError(msg)
        }
        let address = Address(state: state, zip: Int(zip)!, address: address1, city: city)
            let person = Person(firstName: firstName, lastName: lastName, telephoneNumber: Int(telephone)!, address: address)
            
        personList.append(person)
            print(personList.count)

            
    }
    }
    func edit(){
        print("Enter the first name of a person whose info is to be edited")
        guard let name = readLine() else{
            fatalError(msg)
        }
        if let obj = personList.first(where : {$0.firstName == name}){
            print("Enter the Address")
            guard let address1 = readLine() else{
                fatalError(msg)
            }
            print("Enter the State")
            guard let state = readLine() else{
                fatalError(msg)
            }
            print("Enter the City")
            guard let city = readLine() else{
                fatalError(msg)
            }

            print("Enter the Zip code")
            guard let zip = readLine() else{
                fatalError(msg)
            }
            print("Enter the Telephone Number")
            guard let telephone = readLine() else{
                fatalError(msg)
            }
            obj.address?.city = city
            obj.address?.state = state
            obj.address?.zip = Int(zip)!
            obj.address?.address = address1
            obj.telephoneNumber = Int(telephone)!
            print(personList.count)

        }
        else{
            print("Not Found")
        }
 
    }
    func delete(){
        print("Enter the first name of a person whose info is to be deleted")
        guard let name = readLine() else{
            fatalError(msg)
        }
        if personList.first(where : {$0.firstName == name}) != nil{
            if let index = personList.index(where : {$0.firstName == name}){
            personList.remove(at: index)
                
            }
        }else{
            print("Not Found")
        }
        
       
}
    func sortByZip(){

  let sortList =   personList.sorted(by: {String(describing: $0.address?.zip!).compare(String(describing: $1.address?.zip!)) == .orderedAscending})
        
        personList = sortList
        
    }
    func sortByName(){
        print("Sorted by name")
        let sortList = personList.sorted(by: {$0.firstName!.compare($1.firstName!) == .orderedAscending})
        personList = sortList
        
       
    }
    func returnPersonList()->[Person]{
        return personList
    }
    func show(){
        for i in 0..<personList.count{
            guard let getFirstName = personList[i].firstName else{
                break
                
            }
            guard let getLastName = personList[i].lastName else{
                break
                
            }
            guard let getTelephone = personList[i].telephoneNumber else{
                break
                
            }
            guard let getAddress = personList[i].address?.address else{                    break
                
            }
            guard let getzip = personList[i].address?.zip else{
                break
                
            }
            guard let getstate = personList[i].address?.state else{
                break
                
            }
            guard let getcity = personList[i].address?.city else{
                break
            }
            print("Name : \(getFirstName) \(getLastName)\nMob:\(getTelephone) \nAddress:\(getAddress)\nCity:\(getcity) - \(getzip)\nState:\(getstate)")

                                    }

}
}
