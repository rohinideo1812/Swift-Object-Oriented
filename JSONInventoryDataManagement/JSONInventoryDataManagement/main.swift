/******************************************************************************
 *  Purpose: JSON Inventory Data Management of Rice, Pulses and Wheats.
 *
 *  @author Rohini
 *  @version 4.0
 *  @since   30-03-2018
 *
 ******************************************************************************/
import Foundation
var array:[Dictionary<String,Any>] = [Dictionary<String,Any>]()
var array1:[Dictionary<String,Any>] = [Dictionary<String,Any>]()
var rice:[Dictionary<String,Any>] = [Dictionary<String,Any>]()
var wheat:[Dictionary<String,Any>] = [Dictionary<String,Any>]()
var pulse:[Dictionary<String,Any>] = [Dictionary<String,Any>]()
var inventory = Inventory()
var path = "/Users/bridgelabz/Documents/Swift-ObjectOriented/JSONInventoryDataManagement/JSONInventoryDataManagement/File.json"
print("Rice")
print("How many number of times you want to enter")
var n = inventory.acceptInputInt()
for _ in 1...n{
print("Enter the name")
    let name = inventory.acceptInputString()
print("Enter the weight")
    let weight = inventory.acceptInputInt()
print("Enter the price")
    let price = inventory.acceptInputInt()
let riceDetail:Dictionary<String,Any> = [
                                        "name": name,
                                        "price": price,
                                        "weight": weight
                                        ]
    rice.append(riceDetail)
    
}
print("Wheat")
print("How many number of times you want to enter")
n = inventory.acceptInputInt()
for _ in 1...n{

print("Enter the name")
    let name = inventory.acceptInputString()
print("Enter the weight")
    let weight = inventory.acceptInputInt()
print("Enter the price")
    let price = inventory.acceptInputInt()

    let wheatDetail:Dictionary<String,Any> = [ "name": name,
                                               "price":price,
                                               "weight":weight
    ]

    wheat.append(wheatDetail)
    
}


print("Pulse")
print("How many number of times you want to enter")
n = inventory.acceptInputInt()
for _ in 1...n{
print("Enter the name")
    let name = inventory.acceptInputString()
print("Enter the weight")
    let weight = inventory.acceptInputInt()
print("Enter the price")
    let price = inventory.acceptInputInt()

    let pulseDetail:Dictionary<String,Any> = [ "name": name,
                                               "price":price,
                                               "weight":weight]

    pulse.append(pulseDetail)
    
}
var complete:Dictionary<String,Any> = [ "Rice" : rice,
                                        "Wheat": wheat,
                                        "Pulse" : pulse,
                                    ]

      //Write
        if let file:FileHandle = FileHandle(forWritingAtPath: path){
            if let jsonData = try? JSONSerialization.data(withJSONObject: complete, options: .prettyPrinted){
                file.write(jsonData)
            }
            file.closeFile()
        }
var total = 0
print("Total price of Rice")
if let value = complete["Rice"] as? [Dictionary<String,Any>]{
    for obj in value {
        if let price = obj["price"] as? Int{
            if let weight = obj["weight"] as? Int{
                print(price * weight)
                total += price * weight
            }
        }

}
}

print("Total price of Wheat")
if let value = complete["Wheat"] as? [Dictionary<String,Any>]{
    for obj in value{
        if let price = obj["price"] as? Int{
        if let weight = obj["weight"] as? Int{
            print(price * weight)
            total += price * weight
        }
     }
}
}
print("Total price of Pulse")
    if let value = complete["Pulse"] as? [Dictionary<String,Any>]{
        for obj in value{
            if let price = obj["price"] as? Int{
                if let weight = obj["weight"] as? Int{
                    print(price * weight)
                    total += price * weight
                }
            }

}
}
print("Total Price of Inventory-  \(total)")






