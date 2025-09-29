//
//  ExchangeInfo.swift
//  LOTRConverter
//
//  Created by Moataz on 02/10/2025.
//

import SwiftUI

struct ExchangeInfo: View {
    @Environment(\.dismiss) var dismiss

    var body: some View {
        ZStack {
            Image(.parchment)
                .resizable()
                .ignoresSafeArea()
                .background(.brown)
            
            VStack{
                Text("Exchange Rates")
                    .font(.largeTitle)
                    .tracking(3)
                
                Text("Here at the Prancing Pony, we are happy to offer you a place where you can exchange all the known currencies in the entire world except one. We used to take Brandy Bucks, but after finding out that it was a person instead of a piece of paper, we realized it had no value to us. Below is a simple guide to our currency exchange rates:")
                    .font(.title3)
                    .padding()
                
                ExchangeRate(leftImage: .goldpiece, text: "1 Gold piece = 4 Gold Pennies", rightImage: ImageResource.goldpenny)
                
                ExchangeRate(leftImage: ImageResource.goldpenny, text: "1 Gold Penny = 4 Silver Pieces", rightImage: .silverpenny)
              
                ExchangeRate(leftImage: ImageResource.silverpiece, text: "1 Silver piece = 4 Silver Pennies", rightImage: ImageResource.silverpenny)
                
                
                ExchangeRate(leftImage: .goldpenny, text: "1 Silver Penny = 100 Copper Pennies", rightImage: .copperpenny)
                
                Button("Done"){
                    dismiss()
                }
                .buttonStyle(.borderedProminent)
                .tint(.brown.mix(with: .black, by: 0.2))
                .font(.largeTitle)
                .padding()
                .foregroundStyle(.white)

            }
            .foregroundStyle(.black)
        }
    }
}

#Preview {
    ExchangeInfo()
}


