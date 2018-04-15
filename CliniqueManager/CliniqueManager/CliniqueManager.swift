/******************************************************************************
 *  Purpose: Clinique Manager  Class.
 *
 *  @author Rohini
 *  @version 4.0
 *  @since   12-04-2018
 *
 ******************************************************************************/

import Foundation
class CliniqueManager{
    let mMsg = "Invalid Input"
    var mDoctorList = [Doctor]()
    var mPatient : Patient?
     var mPatientList = [Patient]()
   func acceptInputInt()->Int{
        if let lValue = readLine(){
            if let lInput = Int(lValue){
                return lInput
            }
            else{
                print("Invalid Input")
            }
        }
        return 1
    }
    func searchDoctor(){
        let lFlag = true
        repeat{
            print("Enter your Choice")
            print("1-Search Doctor By Id\n2-Search Doctor By Name\n3-Search Doctor by Availability\n4-Search Doctor by Specialization\n5-Back")
            let lChoice = acceptInputInt()
            switch lChoice {
            case 1:  searchDoctorById()
            case 2 : searchDoctorByName()
            case 3 : searchDoctorByAvailability()
            case 4 : searchDoctorBySpecialization()
            case 5 : lFlag == false
            default:
                print("Invalid choice")
            }
        } while lFlag
    }
    func searchPatient(){
        let lFlag = true
        repeat{
            print("Enter your Choice")
            print("1-Search Patient By Id\n2-Search Patient By Name\n3-Search Patient by Contact\n4-Back")
            let lChoice = acceptInputInt()
            switch lChoice {
            case 1:  searchPatientById()
            case 2 : searchPatientByName()
            case 3 : searchPatientByContactNumber()
            case 4 : lFlag == false
            default:
                print("Invalid choice")
            }
        } while lFlag
    }
    func addDoctor(){
        print("-------DOCTORS--------\n")

        var ldoctorId = 1
        print("Enter the number of times")
        let lNumber = acceptInputInt()
        for _ in 0..<lNumber{
            print("Doctor\(ldoctorId)")
            print("Enter the name")
            guard let lName = readLine() else{
                fatalError(mMsg)
            }
            print("Enter the Specialization")
            guard let lSpecialization = readLine() else{
                fatalError(mMsg)
            }
            print("Enter the Availability")
            print("AM \tPM\tBoth")
            guard let lAvailability = readLine() else{
                fatalError(mMsg)
            }
            let lDoctor = Doctor(id: ldoctorId, name: lName, specialization: lSpecialization, availability: lAvailability,numberOfPatient : 0)
            mDoctorList.append(lDoctor)
            ldoctorId += 1
            }
        print("Added SuccessFully")
    }
        func addPatient()->Patient{
            print("------PATIENTS--------\n")
            var lpatientId = 1
            print("Enter the number of times")
            let lNumber = acceptInputInt()
            for _ in 0..<lNumber{
                print("Patient\(lpatientId)")
                print("Enter the name")
                guard let lName = readLine() else{
                    fatalError(mMsg)
                }
                print("Enter the Mobile Number")
                guard let lMobileNumber = readLine() else{
                    fatalError(mMsg)
                }
                print("Enter the Age")
                guard let lAge = readLine() else{
                    fatalError(mMsg)
                }
    
                 mPatient = Patient(id: lpatientId, name: lName, mobileNumber: Int(lMobileNumber)!, age: Int(lAge)!)
                mPatientList.append(mPatient!)
                lpatientId += 1
                
                print("Added SuccessFully")
            }
            return mPatient!
    }

    func searchDoctorById(){
        print("Enter the id of Doctor to search")
        let lId = readLine()
        guard let lInput = Int(lId!) else{
            fatalError(mMsg)
        }
        if let lDoctorObj = mDoctorList.first(where : {$0.id == lInput}){
           print("Id\tName\tAvailability\tSpecialization")
           print(lDoctorObj.id ?? "","\t",lDoctorObj.name ?? "","\t", lDoctorObj.availability ?? "","\t",lDoctorObj.specialization ?? "" )
            }
            else{
                print("No such Doctor Found")
            }
        }
    

    func searchDoctorByName(){
        print("Enter the name of a Doctor to be searched")
        guard let lName = readLine() else{
            fatalError(mMsg)
        }
        let lDoctors = mDoctorList.filter({$0.name as! String == lName})
        if lDoctors.count == 0{
            print("Doctor not Found")
        }
        else if lDoctors.count > 1{
            print("Doctor with same name exists so enter id to get details")
            print("Enter the id of a Doctor")
            let lId = readLine()
            guard let input = Int(lId!)else{
                fatalError(mMsg)
            }
            if let lDoctorObj = lDoctors.first(where : {$0.id == input}){
                print("Id\tName\tAvailability\tSpecialization")
                print(lDoctorObj.id ?? "","\t",lDoctorObj.name ?? "","\t", lDoctorObj.availability ?? "","\t",lDoctorObj.specialization ?? "" )
            }
        }
        else{
            for lDoctorObj in lDoctors{
                print("Id\tName\tAvailability\tSpecialization")
                print(lDoctorObj.id ?? "","\t",lDoctorObj.name ?? "","\t", lDoctorObj.availability ?? "","\t",lDoctorObj.specialization ?? "" )
            }
        }
        }
    func searchDoctorBySpecialization(){
        print("Enter the Specialization of a Doctor to be searched")
        guard let lSpecialization = readLine() else{
            fatalError(mMsg)
        }
        let lDoctors = mDoctorList.filter({$0.specialization as! String == lSpecialization})
        if lDoctors.count == 0{
            print("Doctor not Found")
        }
        else{
            for lDoctorObj in lDoctors{
                print("Id\tName\tAvailability\tSpecialization")
                print(lDoctorObj.id ?? "","\t",lDoctorObj.name ?? "","\t", lDoctorObj.availability ?? "","\t",         lDoctorObj.specialization ?? "" )
            }
        }
    }
    func searchDoctorByAvailability(){
        print("Enter the Availability of a Doctor to be searched")
        guard let lAvailability = readLine() else{
            fatalError(mMsg)
        }
        let lDoctors = mDoctorList.filter({$0.availability as! String == lAvailability})
        if lDoctors.count == 0{
            print("No Doctors")
        }
        else{
            for lDoctorObj in lDoctors{
                print("Id\t  Name\t\tAvailability\tSpecialization")
                print(lDoctorObj.id ?? "","\t",lDoctorObj.name ?? "","\t    ", lDoctorObj.availability ?? "","\t\t   ",lDoctorObj.specialization ?? "" )
            }
        }
        }
    
    func searchPatientById(){
        print("Enter the Id of a Patient to search")
        let lId = readLine()
        guard let lInput = Int(lId!)else{
            fatalError(mMsg)
        }
            if let lPatientObj = mPatientList.first(where : {$0.id == lInput}){
                print("Id\tName\tMobile\tAge")
                print(lPatientObj.id ?? "","\t",lPatientObj.name ?? "","\t", lPatientObj.mobileNumber ?? "","\t",lPatientObj.age ?? "" )
                }else{
                print("No Patient Found")
        }
    }
    func searchPatientByName(){
        print("Enter the name of a Patient to be searched")
        guard let lName = readLine() else{
            fatalError(mMsg)
        }
        let lPatients = mPatientList.filter({$0.name as! String == lName})
        if lPatients.count == 0{
            print("Patient not Found")
        }
        else if lPatients.count > 1{
            print("Patient with same name exists so enter id to get details")
            print("Enter the id of a Patient")
            let lId = readLine()
            guard let input = Int(lId!)else{
                fatalError(mMsg)
            }
            if let lPatientObj = lPatients.first(where : {$0.id == input}){
              print("Id\tName\t\tMobile\tAge")
                print(lPatientObj.id ?? "","\t",lPatientObj.name ?? "","\t", lPatientObj.mobileNumber ?? "","\t",lPatientObj.age ?? "" )
            }
        }
        else{
            for lPatientObj in lPatients{
                print("Id\tName\tMobile\tAge")
                print(lPatientObj.id ?? "","\t",lPatientObj.name ?? "","\t", lPatientObj.mobileNumber ?? "","\t",lPatientObj.age ?? "" )
            }
        }
        }
    
    func searchPatientByContactNumber(){
        print("Enter the Telephone number of a Patient to search")
        let lTelephone = readLine()
        guard let lInput = Int(lTelephone!)else{
            fatalError(mMsg)
        }
        if let lPatientObj = mPatientList.first(where : {$0.mobileNumber == lInput}){
            print("Id\tName\tMobile\tAge")
            print(lPatientObj.id ?? "","\t",lPatientObj.name ?? "","\t", lPatientObj.mobileNumber ?? "","\t",  lPatientObj.age ?? "" )
        }
        else{
            print("No such Patient with contact number Found")
        }
 }
    func takeAppointement(){
        var lAppointementList = [Apointement]()
        let lAppointementPath = "/Users/bridgelabz/Documents/Swift-ObjectOriented/CliniqueManager/CliniqueManager/Appointement.json"
        let lReadWriteFile : ReadWriteOperation<Any>?
//        lAppointementList = lReadWriteFile?.readDataFromFile(path: lAppointementPath) as! [Appointement]
        print("Enter the Doctor Id")
        let lId = readLine()
        guard let lInput = Int(lId!)else{
            fatalError(mMsg)
        }
        let lDoctorList = [Doctor]()
        let lDoctorPath = "/Users/bridgelabz/Documents/Swift-ObjectOriented/CliniqueManager/CliniqueManager/Doctor.json"
//        lDoctorList = lReadWriteFile?.readDataFromFile(path: lAppointementPath) as! [Doctor]
//
        if let lDoctorObj = lDoctorList.first(where : {$0.id == lInput}){
            if lDoctorObj.numberOfPatient! >= 0 && lDoctorObj.numberOfPatient! < 5{
                print("Enter the Appointement Date")
                guard let lDate = readLine() else{
                    fatalError(mMsg)
                }
                let lPatientobj = addPatient()
                if let  lGetPatientCount = lDoctorObj.numberOfPatient{
                lDoctorObj.numberOfPatient = lGetPatientCount + 1
//                   lReadWriteFile?.writeDataFromFile(path: lDoctorPath, dataToBeWrite: lDoctorList)
                }
                let lAppointementDetails = Apointement(patient: lPatientobj, doctorId: lInput, date: lDate)
                lAppointementList.append(lAppointementDetails)
                //            lReadWriteFile?.writeDataFromFile(path:appointementPath , dataToBeWrite: lAppointementPath)
                
            }
            else{
                print("Your Appointement is Tommorrow")
            }
        }
        else{
            print("Doctor with this id does not exist so add doctor")
            addDoctor()
            takeAppointement()
        }
    }
    func displayPatientList(){
//        let readFile : ReadWriteOperation<Any>?
//        let patientPath = "/Users/bridgelabz/Documents/Swift-ObjectOriented/CliniqueManager/CliniqueManager/Patient.swift"
//        let lPatientList = [Patient]()
//
//    lPatientList = readFile?.readDataFromFile(path: lPatientPath) as! [Patient]
//        for i in 0..<lPatientList.count{
//            guard let lGetName = lPatientList[i].name else{
//                break
//
//            }
//            guard let lGetid = lPatientList[i].id else{
//                break
//
//            }
//            guard let lGetContactNumber = lPatientList[i].mobileNumber else{
//                break
//
//            }
//            guard let lGetAge = lPatientList[i].age else{
//                  break
//
//            }
//
//            print("----------------------------------------------\n")
        //            print("Id : \(lGetid),\nName : \(lGetName),\nAge : \(lGetAge),\nContactNumber : \(lGetContactNumber)")
//
//    }
    }
    func displayAppointementist(){
//        let readFile : ReadWriteOperation<Any>?
//        let lAppointementList = [Appointement]()
        // let lAppointementPath = "/Users/bridgelabz/Documents/Swift-ObjectOriented/CliniqueManager/CliniqueManager/Appointement.json"
//        lAppointementList = readFile?.readDataFromFile(path: lAppointementPath) as! [Appointement]
//                for i in 0..<lAppointementList.count{
//         guard let lGetPatientName = lAppointementList[i].patient?.name else{
//                        break
//
//                    }
//         guard let lGetPatientId = lAppointementList[i].patient?.id else{
//                        break
//
//                    }
//         guard let lGetContactNumber = lAppointementList[i].patient?.mobileNumber else{
//                        break
//
//                    }
//         guard let lGetPatientAge = lAppointementList[i].patient?.age else{
//                       break
//                    }
//          guard let lGetDoctorId = lAppointementList[i].id else{
//                        break
//
//                    }
//           guard let lGetDate = lAppointementList[i].date.state else{
//                        break
//
//                    }
//              print("----------------------------------------------\n")
        //        print("DoctorId : \(lGetDoctorId),\nDate : \(lGetDate),\nPatient:\nid : \(lGetPatientId),\nName : \(lGetPatientName),\nAge : \(lGetPatientAge),\nContactNumber : \(lGetContactNumber) ")
//
//            }
        
    }
    func displayDoctorList(){
//        let readFile : ReadWriteOperation<Any>?
//        let lDoctorList = [Doctor]()
        //        let lDoctorPath = "/Users/bridgelabz/Documents/Swift-ObjectOriented/CliniqueManager/CliniqueManager/Doctor.json"
//        lDoctorList = readFile?.readDataFromFile(path: lAppointementPath) as! [Doctor]
//                for i in 0..<lDoctorList.count{
//                    guard let lGetId = lDoctorList[i].id else{
//                        break
//
//                    }
//                    guard let lGetName = lDoctorList[i].name else{
//                        break
//
//                    }
//         guard let lGetSpecialization = lDoctorList[i].specialization else{
//                        break
//
//                    }
//            guard let lGetAvailability = lDoctorList[i].availability else{
//                        break
//                    }
//
//              print("----------------------------------------------\n")
        //        print("Id : \(lGetId),\nName : \(lGetName),\nSpecialization : \(lGetSpecialization),\nAvailability : \(lGetAvailability)")
//
//            }
    }
}
