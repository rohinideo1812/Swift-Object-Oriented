/******************************************************************************
 *  Purpose: Proogram that Manages the Clinique.
 *
 *  @author Rohini
 *  @version 4.0
 *  @since   30-03-2018
 *
 ******************************************************************************/


import Foundation
var cliniquemanagement = CliniqueManagement()
let path = "/Users/bridgelabz/Documents/Swift-ObjectOriented/CliniqueManagement/CliniqueManagement/CliniqueManagement.json"
var doctor:[Dictionary<String,Any>] = [Dictionary<String,Any>]()
    print("DOCTOR")
    print("How many number of doctors")
    var n = cliniquemanagement.acceptinputInt()
    var doctorid = 1
    for _ in 1...n{
        print("Enter the Name")
        let name = cliniquemanagement.acceptinputString()
        print("Enter the Specialization")
        let specialization = cliniquemanagement.acceptinputString()
        print("Enter the Availability")
        let availability = cliniquemanagement.acceptinputString()
        let doctorDetail:Dictionary<String,Any> = [
            "id" : doctorid,
            "name": name,
            "specialization": specialization,
            "availability": availability
        ]
        doctor.append(doctorDetail)
        doctorid+=1
        
    }
    print(doctor)
var patient:[Dictionary<String,Any>] = [Dictionary<String,Any>]()
    print("PATIENT")
    print("How many number of patients")
    var no = cliniquemanagement.acceptinputInt()
    var patientid = 1
    for _ in 1...no{
        print("Enter the Name")
        let name = cliniquemanagement.acceptinputString()
        print("Enter the Mobile")
        let mobile = cliniquemanagement.acceptinputInt()
        print("Enter the Disease")
        let disease = cliniquemanagement.acceptinputString()
        let patientDetail:Dictionary<String,Any> = [
            "id" : patientid,
            "name": name,
            "mobile": mobile,
            "Disease": disease
            
        ]
        patient.append(patientDetail)
        patientid+=1
        
    }
    print(patient)
var completeDetail:Dictionary<String,Any> = [ "Doctor" : doctor,
                                              "Patient": patient
]

print("Enter your choice \n Search by-\n1- id\n2- Name \n3- Specialization ")
var choice = cliniquemanagement.acceptinputInt()
switch choice{
case 1: if let value = completeDetail["Doctor"] as? [Dictionary<String,Any>]{
    print(value)
    for obj in value{
        let object:[Dictionary<String,Any>] = completeDetail.filter({$0["id"] as ! })
    }
    }

case 2 : if let value = completeDetail["Doctor"] as? [Dictionary<String,Any>]{
//    let obj:[Dictionary<String,Any>] = editarray.filter({ $0["telephone"] as! Int == telephone})

    }
case 3 :if let value = completeDetail["Doctor"] as? [Dictionary<String,Any>]{
    }
default:
    print("Invalid input")
}


//if let file:FileHandle = FileHandle(forWritingAtPath: path){
//    if let jsonData = try? JSONSerialization.data(withJSONObject: completeDetail, options: .prettyPrinted){
//        file.write(jsonData)
//    }
//    file.closeFile()
//}

