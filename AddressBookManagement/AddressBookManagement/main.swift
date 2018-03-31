/******************************************************************************
 *  Purpose: Program that Maintains the Addrerss Book.
 *
 *  @author Rohini
 *  @version 4.0
 *  @since   30-03-2018
 *
******************************************************************************/


import Foundation
var object = AddressBookOperation()
print("Enter your choice\n1-Add\n2-Edit\n3-Delete\n4-ShowList")
var choice = object.acceptInputInt()
object.acceptChoice(choice: choice)

