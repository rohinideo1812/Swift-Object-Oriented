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
    func acceptinputInt()->Int{
        if let input = readLine(){
            if let value = Int(input){
              return value
            }
            else{
                print("Entered value is not a a integer value")
            }
            }
         return 1
    }
    func acceptinputString()->String{
        if let input = readLine(){
            if Int(input) != nil{
                print("Entered value is not a String type")
            }else{
                return input
            }
        }
        return ""
    }
   
}
