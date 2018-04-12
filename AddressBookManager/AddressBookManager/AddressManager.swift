//
//  AddressManager.swift
//  AddressBookManager
//
//  Created by BridgeLabz on 09/04/18.
//  Copyright © 2018 BridgeLabz. All rights reserved.
//

import Foundation
class AddressBookManager{
    var addressbook:AddressBook?
    let msg = "Invalid Input"
    var fileArray = [String]()
    var personList = [Person]()
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
    
    }
    func createAddressBook(){
        print("Enter the file name")
        guard let fileName = readLine() else{
            fatalError(msg)
            }
        let path = "/Users/bridgelabz/Documents/Swift-ObjectOriented/AddressBookManager/AddressBookManager/Files/\(fileName).json"
        if FileManager().createFile(atPath: path, contents: nil, attributes: nil){
            print("File is created")
           
        }
    }
        func openAddressBook(){
            let path = "/Users/bridgelabz/Documents/Swift-ObjectOriented/AddressBookManager/AddressBookManager/Files"
            do{
            fileArray = try FileManager().contentsOfDirectory(atPath: path)
                for i in 0..<fileArray.count{
                    print(fileArray[i])
                }

            }catch {
                print("Not Found")
            }
            print("Enter the name of a file to be opened")
            guard let fileName = readLine() else{
                fatalError(msg)
            }
            _ = "/Users/bridgelabz/Documents/Swift-ObjectOriented/AddressBookManager/AddressBookManager/Files/\(fileName).json"
        let isExists = FileManager().fileExists(atPath: path)
            if isExists == true{
                AddressBook(path: path)
            }else{
                let path = "/Users/bridgelabz/Documents/Swift-ObjectOriented/AddressBookManager/AddressBookManager/Files/\(fileName).json"
                if FileManager().createFile(atPath: path, contents: nil, attributes: nil){
                    print("File with \(fileName) does not exists so file with this name is created")
                }
            }

   
    }
        func saveAddressBook(){

//            var fetchedList = [Person]()
//            if let fetchedList =  addressbook?.returnPersonList(){
//                print(fetchedList)
//                if let file:FileHandle = FileHandle(forUpdatingAtPath: path){
//                    file.truncateFile(atOffset: 0)
//                    if let jsonData = try? JSONSerialization.data(withJSONObject: fetchedList, options: .prettyPrinted){
//                        file.write(jsonData)
//                    }
//                    file.closeFile()
//                }
//            }
//
        }
        func saveAsAddressBook(){
            print("Enter the file name")
            guard let fileName = readLine() else{
                fatalError(msg)
            }
            let path = "/Users/bridgelabz/Documents/Swift-ObjectOriented/AddressBookManager/AddressBookManager/Files/\(fileName).json"
            if FileManager().createFile(atPath: path, contents: nil, attributes: nil){
                print("File is created")

            }
            var fetchedList = [Person]()
            if let fetchedList =  addressbook?.returnPersonList(){
                print(fetchedList)
                if let file:FileHandle = FileHandle(forUpdatingAtPath: path){
                    file.truncateFile(atOffset: 0)
                    if let jsonData = try? JSONSerialization.data(withJSONObject: fetchedList, options: .prettyPrinted){
                        file.write(jsonData)
                    }
                    file.closeFile()
                }
            }
      }
}

