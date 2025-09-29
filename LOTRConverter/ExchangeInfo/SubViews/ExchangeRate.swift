//
//  ExtractedView.swift
//  LOTRConverter
//
//  Created by Moataz on 02/10/2025.
//

import SwiftUI

struct ExchangeRate: View {
    let leftImage: ImageResource
    let text: String
    let rightImage: ImageResource
    
    var body: some View {
        HStack{
            Image(leftImage)
                .resizable()
                .scaledToFit()
                .frame(height:33)
            Text(text)
            Image(rightImage)
                .resizable()
                .scaledToFit()
                .frame(height:33)
        }
    }
    
    
}
#Preview{
    ExchangeRate(leftImage: .goldpiece, text: "String", rightImage: ImageResource.goldpenny)
}
