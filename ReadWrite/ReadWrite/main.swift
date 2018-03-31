/******************************************************************************
 *  Purpose: JSONFile Reading and Writing
 *
 *  @author Rohini
 *  @version 4.0
 *  @since   29-03-2018
 *
 ******************************************************************************/


import Foundation
var reader = Reader()
var array:[Dictionary<String,Any>] = [Dictionary<String,Any>]()
print("Enter the name")
var name = reader.acceptInputString()
print("Enter the last name")
var lastname = reader.acceptInputString()
let path = "/Users/bridgelabz/Documents/Swift-ObjectOriented/ReadWrite/ReadWrite/File.json"
let Details:Dictionary<String,Any> = [ "name": name,
                                    "lastname":lastname
                                        ]
                                        

array.append(Details)

