/******************************************************************************
 *  Purpose: Program that stimulates AddrerssBook Management.
 *
 *  @author Rohini
 *  @version 4.0
 *  @since   12-04-2018
 *
 ******************************************************************************/

import Foundation
print("------------ADDRESS BOOK MANAGER--------------")
let addressBookManager = AddressBookManager()
var lChoice = 0
var lFlag = true
repeat{
print("Enter your choice")
    print("1:Create a File\n2:Open a File\n3:Save Address Book\n4:SaveAs Address Book\n5:Exit")
    lChoice = addressBookManager.acceptInputInt()
switch lChoice {
case 1 : addressBookManager.createAddressBook()
case 2 : addressBookManager.openAddressBook()
case 3 : addressBookManager.saveAddressBook()
case 4 : addressBookManager.saveAsAddressBook()
case 5 : lFlag = false
default : print("Invalid Choice")
    }
} while lFlag


