/******************************************************************************
 *  Purpose: Appointemnt Class.
 *
 *  @author Rohini
 *  @version 4.0
 *  @since   12-04-2018
 *
 ******************************************************************************/
import Foundation
class Apointement{
    public var patient : Patient?
    public var doctorId : Int?
    public var date : String?
    init(patient : Patient,doctorId : Int,date : String) {
        self.date = date
        self.doctorId = doctorId
        self.patient = patient
    }
}
