//
//  ContentView.swift
//  Memorize_Assignment2
//
//  Created by Dwiki Dwiki on 13/05/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Memorize!")
                .font(.largeTitle)
            ScrollView{
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 95))]) {
                    CardView().aspectRatio(2/3, contentMode: .fit)
                    CardView(isFaceUp: false)
                }
                .padding(.horizontal)
                .foregroundColor(.red)
            }
        }
        
    }
}


struct CardView: View {
    var shape = RoundedRectangle(cornerRadius: 20)
    var isFaceUp = true
    
    var body: some View {
        ZStack {
            if isFaceUp {
                shape.stroke(lineWidth: 3)
                Text("Content")
            } else {
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
