/******************************************************************************
 *  Purpose:  Address Class.
 *
 *  @author Rohini
 *  @version 4.0
 *  @since   12-04-2018
 *
 ******************************************************************************/
import Foundation
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











