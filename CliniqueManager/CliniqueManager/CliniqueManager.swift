//
//  CliniqueManager.swift
//  CliniqueManager
//
//  Created by BridgeLabz on 13/04/18.
//  Copyright © 2018 BridgeLabz. All rights reserved.
//

import Foundation
class CliniqueManager{
    let mMsg = "Invalid Input"
    var doctorList = [Doctor]()
    var patient : Patient?
     var patientList = [Patient]()
   func acceptInputInt()->Int{
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
    func searchDoctor(){
        let flag = true
        repeat{
            print("Enter your Choice")
            print("1-Search Doctor By Id\n2-Search Doctor By Name\n3-Search Doctor by Availability\n4-Search Doctor by Specialization\n5-Back")
            var choice = acceptInputInt()
            switch choice {
            case 1:  searchDoctorById()
            case 2 : searchDoctorByName()
            case 3 : searchDoctorByAvailability()
            case 4 : searchDoctorBySpecialization()
            case 5 : flag == false
            default:
                print("Invalid choice")
            }
        } while flag
    }
    func searchPatient(){
        let flag = true
        repeat{
            print("Enter your Choice")
            print("1-Search Patient By Id\n2-Search Patient By Name\n3-Search Patient by Contact\n4-Back")
            var choice = acceptInputInt()
            switch choice {
            case 1:  searchPatientById()
            case 2 : searchPatientByName()
            case 3 : searchPatientByContactNumber()
            case 4 : flag == false
            default:
                print("Invalid choice")
            }
        } while flag
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
            let doctor = Doctor(id: ldoctorId, name: lName, specialization: lSpecialization, availability: lAvailability,numberOfPatient : 0)
            doctorList.append(doctor)
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
    
                 patient = Patient(id: lpatientId, name: lName, mobileNumber: Int(lMobileNumber)!, age: Int(lAge)!)
                patientList.append(patient!)
                lpatientId += 1
                
                print("Added SuccessFully")
            }
            return patient!
    }

    func searchDoctorById(){
        print("Enter the id of Doctor to search")
        let lId = readLine()
        guard let input = Int(lId!) else{
            fatalError(mMsg)
        }
        if let doctorObj = doctorList.first(where : {$0.id == input}){
           print("Id\tName\tAvailability\tSpecialization")
           print(doctorObj.id ?? "","\t",doctorObj.name ?? "","\t", doctorObj.availability ?? "","\t",doctorObj.specialization ?? "" )
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
        let Doctors = doctorList.filter({$0.name as! String == lName})
        if Doctors.count == 0{
            print("Doctor not Found")
        }
        else if Doctors.count > 1{
            print("Doctor with same name exists so enter id to get details")
            print("Enter the id of a Doctor")
            let lId = readLine()
            guard let input = Int(lId!)else{
                fatalError(mMsg)
            }
            if let doctorObj = Doctors.first(where : {$0.id == input}){
                print("Id\tName\tAvailability\tSpecialization")
                print(doctorObj.id ?? "","\t",doctorObj.name ?? "","\t", doctorObj.availability ?? "","\t",doctorObj.specialization ?? "" )
            }
        }
        else{
            for doctorObj in Doctors{
                print("Id\tName\tAvailability\tSpecialization")
                print(doctorObj.id ?? "","\t",doctorObj.name ?? "","\t", doctorObj.availability ?? "","\t",doctorObj.specialization ?? "" )
            }
        }
        }
    func searchDoctorBySpecialization(){
        print("Enter the Specialization of a Doctor to be searched")
        guard let lSpecialization = readLine() else{
            fatalError(mMsg)
        }
        let lDoctors = doctorList.filter({$0.specialization as! String == lSpecialization})
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
        let Doctors = doctorList.filter({$0.availability as! String == lAvailability})
        if Doctors.count == 0{
            print("No Doctors")
        }
        else{
            for lDoctorObj in Doctors{
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
            if let lPatientObj = patientList.first(where : {$0.id == lInput}){
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
        let lPatients = patientList.filter({$0.name as! String == lName})
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
        guard let input = Int(lTelephone!)else{
            fatalError(mMsg)
        }
        if let lPatientObj = patientList.first(where : {$0.mobileNumber == input}){
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
        let takeappointement : ReadWriteOperation<Any>?
//        lAppointementList = takeappointement?.readDataFromFile(path: lAppointementPath) as! [Appointement]
        print("Enter the Doctor Id")
        let lId = readLine()
        guard let lInput = Int(lId!)else{
            fatalError(mMsg)
        }
        let lDoctorList = [Doctor]()
        let lDoctorPath = "/Users/bridgelabz/Documents/Swift-ObjectOriented/CliniqueManager/CliniqueManager/Doctor.json"
//        lDoctorList = takeappointement?.readDataFromFile(path: lAppointementPath) as! [Doctor]
//
        if let doctorObj = lDoctorList.first(where : {$0.id == lInput}){
            if doctorObj.numberOfPatient! >= 0 && doctorObj.numberOfPatient! < 5{
                print("Enter the Appointement Date")
                guard let lDate = readLine() else{
                    fatalError(mMsg)
                }
                let patient = addPatient()
                if let  getPatientCount = doctorObj.numberOfPatient{
                doctorObj.numberOfPatient = getPatientCount + 1
                //   takeappointement?.writeDataFromFile(path: lDoctorPath, dataToBeWrite: lDoctorList)
                }
                let appointementDetails = Apointement(patient: patient, doctorId: lInput, date: lDate)
                lAppointementList.append(appointementDetails)
                let appointementPath = "/Users/bridgelabz/Documents/Swift-ObjectOriented/CliniqueManager/CliniqueManager/Appointement.json"
                //            takeappointement?.writeDataFromFile(path:appointementPath , dataToBeWrite: lAppointementList)
                
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
        
    }
    func displayAppointementist(){
        
    }
    func displayDoctorList(){
        
    }
}
