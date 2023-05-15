//
//  EmojiMemoryGame.swift
//  Memorize_Assignment2
//
//  Created by Dwiki Dwiki on 13/05/23.
//

import Foundation
import SwiftUI


class EmojiMemoryGame: ObservableObject{
    @Published var model: MemorizeGame<String>
    
   var themeList: Array<MemorizeTheme> = [
    MemorizeTheme(emojis:  ["🚕", "🚗", "🏎️", "🚛", "🚌",
                            "🚎" , "🚁", "🚝", "🚖","🚤", "🚀"].shuffled(), color: .red, numberOfPairOfCards: 7),
    
    MemorizeTheme(emojis:  ["🐵","🐶","🐭","🐻","🐮","🐷","🐔","🐺"].shuffled(), color: .yellow, numberOfPairOfCards: 5),
    MemorizeTheme(emojis:  ["⚽️","🏀","🏈","⚾️","🥎","🎾"].shuffled(), color: .blue, numberOfPairOfCards: 7)
   ]
    
    var theme: MemorizeTheme
    
    init() {
        theme = themeList.randomElement()!
        model = EmojiMemoryGame.createMemoryGame(theme: theme)
    }
    
    var score: Int {
        return model.score
    }
    
   static private var emojis =  ["🚕", "🚗", "🏎️", "🚛", "🚌",
                           "🚎" , "🚁", "🚝", "🚖","🚤", "🚀"]
    
    static private func createMemoryGame(theme:MemorizeTheme) -> MemorizeGame<String> {
        return MemorizeGame(numberOfPairCards: theme.numberOfPairOfCards) { Index in
            return theme.emojis[Index]
        }
    }
    
    var cards: Array<MemorizeGame<String>.Card> {
        return model.cards
    }
    
    func chooseCard(_ card: MemorizeGame<String>.Card) -> Void{
        model.chooseCard(card)
    }
    
    func newGame() -> Void {
        theme = themeList.randomElement()!
        model = EmojiMemoryGame.createMemoryGame(theme: theme)
    }
}
