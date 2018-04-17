/******************************************************************************
 *  Purpose: Patient Class.
 *
 *  @author Rohini
 *  @version 4.0
 *  @since   12-04-2018
 *
 ******************************************************************************/
import Foundation
class Patient : Codable{
    public var id : Int?
    public var name : String?
    public var mobileNumber : Int?
    public var age : Int?
   
    
    init(id : Int,name : String,mobileNumber : Int,age : Int) {
        self.id = id
        self.name = name
        self.mobileNumber = mobileNumber
        self.age = age
       
    }
}
