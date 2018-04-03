/******************************************************************************
 *  Purpose: Determines the Deck Of Cards Game.
 *
 *  @author Rohini
 *  @version 4.0
 *  @since   2-04-2018
 *
 ******************************************************************************/
import Foundation
var  ranks = ["2", "3", "4", "5", "6", "7", "8", "9", "10", "Jack", "Queen", "King", "Ace"]
var suits = ["Clubs", "Diamonds", "Hearts", "Spades"]
var array = [[String]](repeating: [String](repeating: "", count: 9), count: 4)
var n = suits.count * ranks.count
var deck=(Array(repeatElement("", count: 55)))
//Array of cards
for i in 0..<ranks.count{
    for j in 0..<suits.count{
        deck[suits.count * i + j] = ranks[i] + "->" + suits[j]
    }
}
//Shuffled Array
for i in 0..<52{
   let random = Int(arc4random_uniform(52))
    let temp = deck[random]
    deck[random] = deck[i]
    deck[i] = temp
}
//Conversion to 2D
for i in 0..<4{
    for j in 0..<9{
    array[i][j]=(deck[i + j * 4])
    }
}
//Printing
for i in 0..<4{
    print("player\(i + 1)")
    for j in 0..<9{
        print("\(array[i][j]) \t")
    }
    print("\n")
}


