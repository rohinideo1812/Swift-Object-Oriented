//: Playground - noun: a place where people can play

import UIKit

//var str = "Hello, playground"

struct Movie: Codable {
    enum MovieGenere: String, Codable {
        case horror, skifi, comedy, adventure, animation
    }
    
    var name : String
    var moviesGenere : [MovieGenere]
    var rating : Int
}


let upMovie = Movie(name: "Up", moviesGenere: [.comedy , .adventure, .animation, .comedy], rating : 4)


// Encode data
let jsonEncoder = JSONEncoder()
do {
    let jsonData = try jsonEncoder.encode(upMovie)
    let jsonString = String(data: jsonData, encoding: .utf8)
    print("JSON String : " + jsonString!)
    
    do {
        // Decode data to object
    
        let jsonDecoder = JSONDecoder()
        let upMovie = try jsonDecoder.decode(Movie.self, from: jsonData)
        print("Name : \(upMovie.name)")
        print("Rating : \(upMovie.rating)")
        print("Movie Genere : \(upMovie.moviesGenere.count)")
    }
    catch {
    }

}
catch {
}
