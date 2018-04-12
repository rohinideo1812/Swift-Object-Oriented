//
//  main.swift
//  AddressBookManager
//
//  Created by BridgeLabz on 09/04/18.
//  Copyright © 2018 BridgeLabz. All rights reserved.
//

import Foundation
let addressBookManager = AddressBookManager()
var choice = 0
repeat{
print("Enter your choice")
print("1:Create a File\n2:Open a File\n3: Save Address Book\n4:SaveAs Address Book")
    choice = addressBookManager.acceptInputInt()
switch choice {
case 1 : addressBookManager.createAddressBook()
case 2 : addressBookManager.openAddressBook()
case 3 : addressBookManager.saveAddressBook()
case 4 : addressBookManager.saveAsAddressBook()
default : print("Invalid")
}
} while choice > 0
