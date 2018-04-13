/******************************************************************************
 *  Purpose: Address Book Manager Operations.
 *
 *  @author Rohini
 *  @version 4.0
 *  @since   12-04-2018
 *
 ******************************************************************************/
import Foundation
class AddressBookManager{
    var mOperationPath = ""
    var addressbook:AddressBook?
    let mMsg = "Invalid Input"
    var fileArray = [String]()
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
     * Function for Creating Address Book
     *
     */
    func createAddressBook(){
        print("Enter the file name")
        guard let lFileName = readLine() else{
            fatalError(mMsg)
            }
        let lPath = "/Users/bridgelabz/Documents/Swift-ObjectOriented/AddressBookManager/AddressBookManager/Files/\(lFileName).json"
        if FileManager().createFile(atPath: lPath, contents: nil, attributes: nil){
            print("File is created")
           
        }
    }
    /**
     * Function for Opening Address Book
     *
     */
        func openAddressBook(){
            let lPath = "/Users/bridgelabz/Documents/Swift-ObjectOriented/AddressBookManager/AddressBookManager/Files"
            do{
            fileArray = try FileManager().contentsOfDirectory(atPath: lPath)
                for i in 0..<fileArray.count{
                    print(fileArray[i])
                }

            }catch {
                print("Not Found")
            }
            print("Enter the name of a file to be opened")
            guard let lFileName = readLine() else{
                fatalError(mMsg)
            }
            mOperationPath = "/Users/bridgelabz/Documents/Swift-ObjectOriented/AddressBookManager/AddressBookManager/Files/\(lFileName).json"
        let isExists = FileManager().fileExists(atPath: mOperationPath)
            if isExists == true{
                AddressBook(path: mOperationPath)
            }else{
                 mOperationPath = "/Users/bridgelabz/Documents/Swift-ObjectOriented/AddressBookManager/AddressBookManager/Files/\(lFileName).json"
                if FileManager().createFile(atPath: mOperationPath, contents: nil, attributes: nil){
                    print("File with \(lFileName) does not exists so file with this name is created")
                }
            }
    }
    /**
     * Function for Saving Data Of Address Book To File
     *
     */
    func saveAddressBook(){
            addressbook?.writeDataToFile(path: mOperationPath)
        }
    /**
     * Function for Saving Data Of Address Book To New File
     *
     */
        func saveAsAddressBook(){
            print("Enter the file name")
            guard let lFileName = readLine() else{
                fatalError(mMsg)
            }
            let lPath = "/Users/bridgelabz/Documents/Swift-ObjectOriented/AddressBookManager/AddressBookManager/Files/\(lFileName).json"
            if FileManager().createFile(atPath: lPath, contents: nil, attributes: nil){
                print("File is created")
            }
            addressbook?.writeDataToFile(path: lPath)
    }
}
