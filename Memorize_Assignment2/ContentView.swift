//
//  ContentView.swift
//  Memorize_Assignment2
//
//  Created by Dwiki Dwiki on 13/05/23.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var viewModel = EmojiMemoryGame()
    var body: some View {
        VStack {
            HStack{
                Spacer()
                Spacer()
                Spacer()
                Text("Memorize!")
                    .font(.largeTitle)
                Spacer()
                Text("\(viewModel.score)")
                    .font(.title2)
                Spacer()
            }
            ScrollView{
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 95))]) {
                    ForEach(viewModel.cards) { card in
                        CardView(card: card)
                            .aspectRatio(2/3, contentMode: .fit)
                            .onTapGesture {
                                viewModel.chooseCard(card)
                            }
                    }
                }
                .padding(.horizontal)
                .foregroundColor(viewModel.theme.color)
            }
            Button {
                viewModel.newGame()
            } label: {
                Text("New Game")
                    .font(.title2)
            }

        }
        
    }
}


struct CardView: View {
    var shape = RoundedRectangle(cornerRadius: 20)
    var card: MemorizeGame<String>.Card
    
    var body: some View {
        ZStack {
            if card.isFaceUp {
                shape.stroke(lineWidth: 3)
                Text(card.content)
            } else if card.isMatched{
                shape.opacity(0)
            }else {
                shape.fill()
                shape.stroke(lineWidth: 3)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
