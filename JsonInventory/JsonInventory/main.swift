/******************************************************************************
 *  Purpose: Determines the JSON Reading and Writing
 *
 *  @author Rohini
 *  @version 4.0
 *  @since   28-03-2018
 *
 ******************************************************************************/

import Foundation
let reader = Reader()
let jsonOperation = JSONOperation()
jsonOperation.readFromJSONFile(path: jsonOperation.filePath)
jsonOperation.writeToJSONFile(path: jsonOperation.filePath)
jsonOperation.writeToJSONFile1(path: jsonOperation.filePath)
//jsonOperation.writeToJSONFile1(path: jsonOperation.filePath)
//jsonOperation.readFromJSONFile(path: jsonOperation.filePath)
//jsonOperation.writeToJSONFile(path: jsonOperation.filePath)
//jsonOperation.readFromJSONFile(path: jsonOperation.filePath)
//jsonOperation.writeToJSONFile(path: jsonOperation.filePath)
//jsonOperation.readFromJSONFile(path: jsonOperation.filePath)
//jsonOperation.writeToJSONFile(path: jsonOperation.filePath)
//

