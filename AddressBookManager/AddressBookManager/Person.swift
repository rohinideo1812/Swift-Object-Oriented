/******************************************************************************
 *  Purpose: Person class.
 *
 *  @author Rohini
 *  @version 4.0
 *  @since   12-04-2018
 *
 ******************************************************************************/

import Foundation
class Person : Codable{
    public private(set) var  firstName:String?
    public private(set) var lastName:String?
    public var telephoneNumber : Int?
    public var address : Address?
    init(firstName : String,lastName : String,telephoneNumber : Int,address : Address){
        self.firstName = firstName
        self.lastName = lastName
        self.telephoneNumber = telephoneNumber
        self.address = address

    }
    
    



}
