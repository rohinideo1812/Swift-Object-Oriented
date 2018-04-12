//: Playground - noun: a place where people can play

import UIKit

//var str = "Hello, playground"

//class Person: Codable {
//    let firstName: String?
//    let lastName: String?
//
//    init(firstName: String, lastName: String) {
//        self.firstName = firstName
//        self.lastName = lastName
//    }
//}
//let person = Person(firstName: "John", lastName: "Doe")
//let encoder = JSONEncoder()
//encoder.outputFormatting = .prettyPrinted // if necessary
//let data = try! encoder.encode(person)
//let jsonString = String(data: data, encoding: .utf8)!
//print(jsonString)

class Person : Codable{
    public private(set) var  firstName:String?
    public private(set) var lastName:String?
    public var telephoneNumber : Int?
    public var address = [Address?]()
    
    init(firstName : String,lastName : String,telephoneNumber : Int,address : [Address]){
        self.firstName = firstName
        self.lastName = lastName
        self.telephoneNumber = telephoneNumber
        self.address = address
        
}
    
}
class Address : Codable{
    public var state : String?
    public var zip : Int?
    public var address : String?
    public var city : String?
    
    init(state : String,zip : Int,address : String,city : String) {
        self.state = state
        self.city = city
        self.address = address
        self.zip = zip
    }
}

