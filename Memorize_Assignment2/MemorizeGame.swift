//
//  MemorizeGame.swift
//  Memorize_Assignment2
//
//  Created by Dwiki Dwiki on 13/05/23.
//

import Foundation


struct MemorizeGame<ContentType> where ContentType:Equatable {
    private(set) var cards: Array<Card>
    private(set) var score = 0
    
    init(numberOfPairCards: Int, makeCardContent:(Int) -> ContentType){
        cards = Array<Card>()
        score = 0
        for index in 0..<numberOfPairCards {
            cards.append(Card(isFaceUp: false, isMatched: false, content: makeCardContent(index), isSeen: false, id: index*2))
            cards.append(Card(isFaceUp: false, isMatched: false, content: makeCardContent(index), isSeen: false, id: index*2+1))
        }
        cards.shuffle()
    }
    
    private var firstFacedUpCardIndex: Int?
    
     mutating func chooseCard(_ card: Card) {
         print(card)
         if let chosenCard = cards.firstIndex(where: {$0.id == card.id}),
            !card.isFaceUp,
            !card.isMatched
         {
             if let potentialMatchIndex = firstFacedUpCardIndex {
                 if cards[chosenCard].content == cards[potentialMatchIndex].content {
                     cards[potentialMatchIndex].isMatched = true
                     cards[chosenCard].isMatched = true
                     score += 2
                 } else {
                     if cards[chosenCard].isSeen || cards[potentialMatchIndex].isSeen {
                         score -= 1
                     }
                     cards[chosenCard].isSeen = true
                     cards[potentialMatchIndex].isSeen = true
                 }
                 firstFacedUpCardIndex = nil
             } else {
                
                 firstFacedUpCardIndex = chosenCard
                 for index in cards.indices {
                     cards[index].isFaceUp = false
                 }
             }
           
             cards[chosenCard].isFaceUp.toggle()
         }
    }
    
    struct Card: Identifiable {
        var isFaceUp:Bool
        var isMatched:Bool
        var content: ContentType
        var isSeen:Bool
        
        var id:Int
    }
}


