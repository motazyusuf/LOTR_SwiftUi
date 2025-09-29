//
//  ExtractedView.swift
//  LOTRConverter
//
//  Created by Moataz on 02/10/2025.
//

import SwiftUI

struct ExchangeRate: View {
    var body: some View {
        HStack{
            Image(.goldpiece)
                .resizable()
                .scaledToFit()
                .frame(height:33)
            Text("1 Gold Piece = 4 Gold Pennies")
            Image(.goldpenny)
                .resizable()
                .scaledToFit()
                .frame(height:33)
        }
    }
    
    
}
#Preview{
    ExchangeRate()
}
