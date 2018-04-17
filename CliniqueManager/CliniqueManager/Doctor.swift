/******************************************************************************
 *  Purpose: Doctor Class.
 *
 *  @author Rohini
 *  @version 4.0
 *  @since   12-04-2018
 *
 ******************************************************************************/
import Foundation
class Doctor : Codable{
    public var id : Int?
    public var numberOfPatient : Int?
    public var name : String?
    public var specialization : String?
    public var availability : String?
    
    init(id : Int,name : String,specialization : String,availability : String,numberOfPatient : Int) {
        self.id = id
        self.name = name
        self.specialization = specialization
        self.availability = availability
        self.numberOfPatient = numberOfPatient
    }
}
