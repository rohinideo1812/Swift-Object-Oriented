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
    var mPersonList = [Person]()
     var mSortList = [Person]()
    var mStreamArray: Array<Data> = Array()

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
            if let lJson = try? JSONSerialization.jsonObject(with: file.availableData, options: .mutableLeaves) as? [Dictionary<String,Any>]{
                for obj in lJson!{
                    let lData = try? JSONSerialization.data(withJSONObject: obj, options: .prettyPrinted)
                    let jsonDecoder = JSONDecoder()
                    guard let personData = try? jsonDecoder.decode(Person.self, from: lData!) else{
                        return
                    }
                    mPersonList.append(personData)
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

        for i in mPersonList{

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
        if let lValue = readLine(){
            if let lInput = Int(lValue){
                return lInput
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
        let lAddress = Address(state: lState, zip: Int(lZip)!, address: lAddress1, city: lCity)
            let lPerson = Person(firstName: lFirstName, lastName: lLastName, telephoneNumber: Int(lTelephone)!, address: lAddress)
            
        mPersonList.append(lPerson)
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
        if let lPersonObj = mPersonList.first(where : {$0.firstName == lName}){
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
            lPersonObj.address?.city = lCity
            lPersonObj.address?.state = lState
            lPersonObj.address?.zip = Int(lZip)!
            lPersonObj.address?.address = lAddress1
            lPersonObj.telephoneNumber = Int(lTelephone)!
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
        if mPersonList.first(where : {$0.firstName == lName}) != nil{
            if let index = mPersonList.index(where : {$0.firstName == lName}){
            mPersonList.remove(at: index)
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

  let lSortList =   mPersonList.sorted(by: {String(describing: $0.address?.zip!).compare(String(describing: $1.address?.zip!)) == .orderedAscending})
        
        mPersonList = lSortList
        print("Sort SuccessFull")
        show()
    }
    /**
     * Function for Sorting Data Of Address Book By Name
     *
     */
    func sortByName(){
        print("Sorted by name")
        let lSortList = mPersonList.sorted(by: {$0.firstName!.compare($1.firstName!) == .orderedAscending})
        mPersonList = lSortList
        
        print("Sort SuccessFull")
        show()

    }
    /**
     * Function for Printing Data Of Address Book 
     *
     */
    func show(){
        for i in 0..<mPersonList.count{
            guard let lGetFirstName = mPersonList[i].firstName else{
                break
                
            }
            guard let lGetLastName = mPersonList[i].lastName else{
                break
                
            }
            guard let lGetTelephone = mPersonList[i].telephoneNumber else{
                break
                
            }
            guard let lGetAddress = mPersonList[i].address?.address else{                    break
                
            }
            guard let lGetzip = mPersonList[i].address?.zip else{
                break
                
            }
            guard let lGetstate = mPersonList[i].address?.state else{
                break
                
            }
            guard let lGetcity = mPersonList[i].address?.city else{
                break
            }
            print("----------------------------------------------\n")
            print("Name : \(lGetFirstName) \(lGetLastName)\nMob:\(lGetTelephone) \nAddress:\(lGetAddress)\nCity:\(lGetcity) - \(lGetzip)\nState:\(lGetstate)\n")

                                    }
     
}
}
