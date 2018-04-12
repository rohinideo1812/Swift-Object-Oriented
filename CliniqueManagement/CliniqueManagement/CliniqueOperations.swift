/******************************************************************************
 *  Purpose: Functions for clinique Management
 *
 *  @author Rohini
 *  @version 4.0
 *  @since   30-03-2018
 *
 ******************************************************************************/


import Foundation
class CliniqueManagement{
    func acceptInpu1tInt()->Int{
        if let value = readLine(){
            if let input = Int(value){
                return input
            }
            else{
                print("Invalid Input")
            }
        }
        return 1
    }
    
    func acceptInputString()->String{
        if let input = readLine(){
            if Int(input) != nil{
                print("Entered value is not a String type")
            }else{
                return input
            }
        }
        return ""
    }
    
    let path = "/Users/bridgelabz/Documents/Swift-ObjectOriented/CliniqueManagement/CliniqueManagement/CliniqueManagement.json"
    let path1 = "/Users/bridgelabz/Documents/Swift-ObjectOriented/CliniqueManagement/CliniqueManagement/Appointement.json"
   var doctor:[Dictionary<String,Any>] = [Dictionary<String,Any>]()
    var array:[Dictionary<String,Any>] = [Dictionary<String,Any>]()
    var searchdoctorid:[Dictionary<String,Any>] = [Dictionary<String,Any>]()
    var patient:[Dictionary<String,Any>] = [Dictionary<String,Any>]()
   var finalarray:[Dictionary<String,Any>] = [Dictionary<String,Any>]()
   var appointementarray:[Dictionary<String,Any>] = [Dictionary<String,Any>]()
    func cliniqueManagement(){
        print("DOCTOR")
        print("How many number of doctors")
        let n = acceptInpu1tInt()
        var doctorid = 1
        for _ in 1...n{
            print("Enter the Name")
            let name = acceptInputString()
            print("Enter the Specialization")
            let specialization = acceptInputString()
            print("Enter the Availability")
            let availability = acceptInputString()
            let doctorDetail:Dictionary<String,Any> = [
                "name": name,
                "id" : doctorid,
                "specialization": specialization,
                "availability": availability
                
            ]
            doctor.append(doctorDetail)
            doctorid+=1
            
        }
        print(doctor)
        print("PATIENT")
        print("How many number of patients")
        let no = acceptInpu1tInt()
        var patientid = 1
        for _ in 1...no{
            print("Enter the Name")
            let name = acceptInputString()
            print("Enter the age")
            let age = acceptInpu1tInt()
            var mobile = ""
            repeat{
                    print("Mobile number should be of 10 digit")
                    print("Enter the Mobile Number")
                mobile = String(acceptInpu1tInt())
                }while mobile.count != 10
            
            guard let mobileno = Int(mobile) else {
            print("Invalid")
            return
            }
            print("Enter the Disease")
            let disease = acceptInputString()
            let patientDetail:Dictionary<String,Any> = [
                "name": name,
                "id" : patientid,
                "mobile" : mobileno,
                "disease": disease,
                "age" : age
                
            ]
            patient.append(patientDetail)
            patientid+=1
            
        }
        var patientdoctor:Dictionary<String,Any> = ["Doctor" : doctor,
                                                    "Patient" : patient
                                                    ]
        if let file:FileHandle = FileHandle(forWritingAtPath: path){
            if let jsonData = try? JSONSerialization.data(withJSONObject: patientdoctor, options: .prettyPrinted){
                file.write(jsonData)
            }
            file.closeFile()
        }
        guard let file:FileHandle = FileHandle(forReadingAtPath: path) else{
            return
        }
        guard let json = try? JSONSerialization.jsonObject(with: file.availableData, options: .mutableLeaves) as? Dictionary<String,Any> else{
                return
        }
                guard let objDoctor = json!["Doctor"] as? [Dictionary<String,Any>] else{
                   return
                }
                guard let objPatient = json!["Patient"] as? [Dictionary<String,Any>] else{
                    return
                }
        file.closeFile()
    
        print(objPatient)
        print(objDoctor)
        print("Search for Doctor")
        print("Enter your choice \n1-id\n2-Name\n3-Specialization\n4-Availability")
        var choice = acceptInpu1tInt()
        switch choice{
        case 1 :print("Enter the id of a doctor")
        let id = acceptInpu1tInt()
        let searchdoctorid = objDoctor.filter({$0["id"] as! Int == id })
        print(searchdoctorid)
        case 2 :print("Enter the name of a doctor")
        let name = acceptInputString()
        let searchdoctorname = objDoctor.filter({$0["name"] as! String == name })
        print(searchdoctorname)
        case 3 :print("Enter the specialization of a doctor")
        let specialization = acceptInputString()
        let searchdoctorspecialization = objDoctor.filter({$0["specialization"] as! String == specialization })
        print(searchdoctorspecialization)
        case 4 :print("Enter the Availability of a doctor")
        let availability = acceptInputString()
        let searchdoctoravailability = objDoctor.filter({$0["availability"] as! String == availability })
        print(searchdoctoravailability)
        default : print("Invalid input")
        }
        print("Search for patient")
        print("Enter your choice \n1-id\n2-Name")
        choice = acceptInpu1tInt()
        switch choice{
        case 1 :print("Enter the id of a patient")
        let id = acceptInpu1tInt()
        let searchpatientid = objPatient.filter({$0["id"] as! Int == id })
        print(searchpatientid)
        case 2 :print("Enter the name of a patient")
        let name = acceptInputString()
        let searchpatientname = objPatient.filter({$0["name"] as! String == name})
        print(searchpatientname)
        default : print("Invalid input")
        }
        var identity = 1
        for _ in 0..<no{
        print("Patient with id  \(identity) enter the name of doctor")
        let name = acceptInputString()
        print("Enter the availability")
        let availability = acceptInputString()
        print("Enter the date")
        let date = acceptInputString()
            for obj in objDoctor{
            let availname = objDoctor.filter({$0["name"] as? String == name })
                    print(availname)
                for obj1 in availname{
                    
                    }
                    
                }
                
            }
            
            }
           
            
            
            
            
            
            
            
            
            
            
            
            
        }
            
            
            
            
            
            
            //            if  let availname ]: [Dictionary<String, Any>] = objDoctor.filter({$0["name"] as? String == name}){
//                print(availname)
//                if let doctoravail : [Dictionary<String, Any>] = availname.filter({$0["availability"] as? String == availability}){
//                    print(doctoravail)
//                    break
//                }

        













//            let appointement:Dictionary<String,Any> = ["Doctor" : name,
//                                                       "Patientid" : identity,
//                                                       "Date" : date
//                                                      ]
//            print(appointement)
//            identity = identity + 1
//            if let file:FileHandle = FileHandle(forReadingAtPath: path){
//                if let json = try? JSONSerialization.jsonObject(with: file.availableData, options: .mutableLeaves) as? [Dictionary<String,Any>]{
//                    if let jsonobj = json {
//                    for d in jsonobj{
//                        finalarray.append(d as Dictionary<String,Any>)
//                    }
//                            }
//                }
//                file.closeFile()
//            }
//            finalarray.append(appointement)
//
//        }
//        print(finalarray)
//       if let file:FileHandle = FileHandle(forWritingAtPath: path1){
//        if let jsonData = try? JSONSerialization.data(withJSONObject:finalarray, options: .prettyPrinted){
//                    file.write(jsonData)
//                }
//                file.closeFile()
//            }
//
//        finalarray.removeAll()
//           }
//        }
//}
//}
//
//
//

            
//            guard let index = editarray.index(where: {$0["telephone"] as! Int == telephone}) else{
//                return
//            }
//            print(index)
            
            


