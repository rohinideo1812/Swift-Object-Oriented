/******************************************************************************
 *  Purpose: Address Book Operations.
 *
 *  @author Rohini
 *  @version 4.0
 *  @since   12-04-2018
 *
 ******************************************************************************/
import Foundation
class AddressBook{
    let mPath : String?
    var personList = [Person]()
     var sortList = [Person]()
    var streamArray: Array<Data> = Array()

    let mMsg = "Invalid Input"
    init(path : String){
    self.mPath = path
    readDataFromFile(path1: path)
    writeDataToFile(path: path)

    }
    /**
     * Function for Reading Data From File
     *
     */
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
    /**
     * Function for Writing Data To File
     *
     */
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
    /**
     * Function for Accepting Input From User
     *
     */
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
    /**
     * Function for Performing Operations on AddressBook
     *
     */
    func operations(){
        var lFlag = true
        repeat{
        print("Choose Operations You want to perform")
        print("1:Add Details Of Person\n2:Edit Details Of Person\n3:Delete Details Of Person\n4:sort Details Of Person By Name\n5:Sort Details Of Person By Zip\n6:Print the AddressBook\n7-Exit")
     
        let lChoice = acceptInputInt()
        switch lChoice{
        case 1 : add()
        case 2 : edit()
        case 3 : delete()
        case 4 : sortByName()
        case 5 : sortByZip()
        case 6 : show()
        case 7 : lFlag = false
        default : print("Invalid Input")
        }
    } while lFlag
    }
    /**
     * Function for Adding Data To Address Book
     *
     */
    func add(){
        print("Enter the number of times")
        let lNumber = acceptInputInt()
        for _ in 0..<lNumber{
        print("Enter the First name")
        guard let lFirstName = readLine() else{
        fatalError(mMsg)
        }
        print("Enter the Lastname")
        guard let lLastName = readLine() else{
            fatalError(mMsg)
        }
        print("Enter the Address")
        guard let lAddress1 = readLine() else{
            fatalError(mMsg)
        }
        print("Enter the State")
        guard let lState = readLine() else{
            fatalError(mMsg)
        }
        print("Enter the City")
        guard let lCity = readLine() else{
            fatalError(mMsg)
        }
        
        print("Enter the Zip code")
        guard let lZip = readLine() else{
            fatalError(mMsg)
        }
        print("Enter the Telephone Number")
        guard let lTelephone = readLine() else{
            fatalError(mMsg)
        }
        let address = Address(state: lState, zip: Int(lZip)!, address: lAddress1, city: lCity)
            let person = Person(firstName: lFirstName, lastName: lLastName, telephoneNumber: Int(lTelephone)!, address: address)
            
        personList.append(person)
        print("Addition SuccessFull")

    }
    }
    /**
     * Function for Editing Data Of Address Book
     *
     */
    func edit(){
        print("Enter the first name of a person whose info is to be edited")
        guard let lName = readLine() else{
            fatalError(mMsg)
        }
        if let obj = personList.first(where : {$0.firstName == lName}){
            print("Enter the Address")
            guard let lAddress1 = readLine() else{
                fatalError(mMsg)
            }
            print("Enter the State")
            guard let lState = readLine() else{
                fatalError(mMsg)
            }
            print("Enter the City")
            guard let lCity = readLine() else{
                fatalError(mMsg)
            }

            print("Enter the Zip code")
            guard let lZip = readLine() else{
                fatalError(mMsg)
            }
            print("Enter the Telephone Number")
            guard let lTelephone = readLine() else{
                fatalError(mMsg)
            }
            obj.address?.city = lCity
            obj.address?.state = lState
            obj.address?.zip = Int(lZip)!
            obj.address?.address = lAddress1
            obj.telephoneNumber = Int(lTelephone)!
            print("Edition SuccessFull")

        }
        else{
            print("Not Found")
        }

    
    }
    /**
     * Function for Deleting Data From Address Book
     *
     */
    func delete(){
        print("Enter the first name of a person whose info is to be deleted")
        guard let lName = readLine() else{
            fatalError(mMsg)
        }
        if personList.first(where : {$0.firstName == lName}) != nil{
            if let index = personList.index(where : {$0.firstName == lName}){
            personList.remove(at: index)
            print("Deletion SuccessFull")

            }
        }else{
            print("Not Found")
        }
}
    /**
     * Function for Sorting Data Of Address Book By Zip
     *
     */
    func sortByZip(){

  let sortList =   personList.sorted(by: {String(describing: $0.address?.zip!).compare(String(describing: $1.address?.zip!)) == .orderedAscending})
        
        personList = sortList
        print("Sort SuccessFull")
        show()
    }
    /**
     * Function for Sorting Data Of Address Book By Name
     *
     */
    func sortByName(){
        print("Sorted by name")
        let sortList = personList.sorted(by: {$0.firstName!.compare($1.firstName!) == .orderedAscending})
        personList = sortList
        
        print("Sort SuccessFull")
        show()

    }
    /**
     * Function for Printing Data Of Address Book 
     *
     */
    func show(){
        for i in 0..<personList.count{
            guard let lGetFirstName = personList[i].firstName else{
                break
                
            }
            guard let lGetLastName = personList[i].lastName else{
                break
                
            }
            guard let lGetTelephone = personList[i].telephoneNumber else{
                break
                
            }
            guard let lGetAddress = personList[i].address?.address else{                    break
                
            }
            guard let lGetzip = personList[i].address?.zip else{
                break
                
            }
            guard let lGetstate = personList[i].address?.state else{
                break
                
            }
            guard let lGetcity = personList[i].address?.city else{
                break
            }
            print("----------------------------------------------\n")
            print("Name : \(lGetFirstName) \(lGetLastName)\nMob:\(lGetTelephone) \nAddress:\(lGetAddress)\nCity:\(lGetcity) - \(lGetzip)\nState:\(lGetstate)\n")

                                    }
     
}
}
