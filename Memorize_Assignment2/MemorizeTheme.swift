//
//  MemorizeTheme.swift
//  Memorize_Assignment2
//
//  Created by Dwiki Dwiki on 13/05/23.
//

import Foundation
import SwiftUI

struct MemorizeTheme {
    var emojis: Array<String>
    var color: Color
    var numberOfPairOfCards: Int
    
    init(emojis: Array<String>, color: Color, numberOfPairOfCards: Int) {
        self.emojis = emojis
        self.color = color
        self.numberOfPairOfCards = numberOfPairOfCards > emojis.count ? emojis.count : numberOfPairOfCards
    }
}
