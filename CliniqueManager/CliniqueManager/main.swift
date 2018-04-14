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
var cliniquemanager = CliniqueManager()
var flag = true
repeat{
    print("Enter your choice\n1-Add Doctor\n2-Add Appointement\n3-Search Doctor\n4-Search Patient\n5-Display Patient\n6-Display Doctor\n7-Display Appointement\n8-Exit")
    let choice = cliniquemanager.acceptInputInt()
    switch choice{
    case 1 : cliniquemanager.addDoctor()
    case 2 : cliniquemanager.takeAppointement()
    case 3 : cliniquemanager.searchDoctor()
    case 4 : cliniquemanager.searchPatient()
    case 5 :  cliniquemanager.displayPatientList()
    case 6 : cliniquemanager.displayDoctorList()
    case 7 : cliniquemanager.displayAppointementist()
    case 8 : flag == false
    default : print("Invalid Choice")
}
}while flag
