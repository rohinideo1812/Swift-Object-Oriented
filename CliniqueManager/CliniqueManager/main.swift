/******************************************************************************
 *  Purpose: Program that stimulates Clinique Management.
 *
 *  @author  Rohini
 *  @version 1.0
 *  @since   13-04-2018
 *
 ******************************************************************************/

import Foundation
print("-------------CLINIQUE MANAGEMENT----------------\n")
var lCliniquemanager = CliniqueManager()
var lFlag = true
repeat{
    print("Enter your choice\n1-Add Doctor\n2-Add Appointement\n3-Search Doctor\n4-Search Patient\n5-Display Patient\n6-Display Doctor\n7-Display Appointement\n8-Exit")
    let lChoice = lCliniquemanager.acceptInputInt()
    switch lChoice{
    case 1 : lCliniquemanager.addDoctor()
    case 2 : lCliniquemanager.takeAppointement()
    case 3 : lCliniquemanager.searchDoctor()
    case 4 : lCliniquemanager.searchPatient()
    case 5 :  lCliniquemanager.displayPatientList()
    case 6 : lCliniquemanager.displayDoctorList()
    case 7 : lCliniquemanager.displayAppointementist()
    case 8 : lFlag = false
    default : print("Invalid Choice")
}
}while lFlag
