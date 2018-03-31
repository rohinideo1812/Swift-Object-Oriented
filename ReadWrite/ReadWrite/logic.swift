/******************************************************************************
 *  Purpose: Reading Writing functions
 *
 *  @author Rohini
 *  @version 4.0
 *  @since   28-03-2018
 *
 ******************************************************************************/


import Foundation
class Reader{
    func acceptInputString()->String{
        if let input = readLine(){
            if Int(input) != nil{
                print("Entered value is not of string type")
            }
            else{
                return input
            }
        }
        return ""
    }
    
    
    func acceptInputInt()->Int{
        if let input = readLine(){
            if let value = Int(input){
                return value
            }
            else{
                print("Entered value is not a integer type")
            }
        }
        return 1
    }
}
