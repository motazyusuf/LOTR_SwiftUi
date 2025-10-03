//
//  SelectCurrency.swift
//  LOTRConverter
//
//  Created by Moataz on 03/10/2025.
//

import SwiftUI

struct SelectCurrency: View {
    
    @Environment(\.dismiss) var dismiss
    @Binding var startingCurrency: Currency
    @Binding var convertingToCurrency: Currency

    var body: some View {
        ZStack {
            Image(.parchment)
                .resizable()
                .ignoresSafeArea()
                .background(.brown)

            VStack {
                Text("Select the currency you are starting with:")
                    .fontWeight(.bold)
                    .padding()

                CurrencyGrid(currency: $startingCurrency)

                Text("Select the currency you would like to convert to:")
                    .fontWeight(.bold)
                    .padding()

                CurrencyGrid(currency: $convertingToCurrency)

                Button("Done") {
                    dismiss()
                }
                .lotrButton()
            }
            .foregroundStyle(.black)
            .padding()
            .multilineTextAlignment(.center)
        }
    }
}

#Preview {
    SelectCurrency(startingCurrency: .constant(.copperPenny), convertingToCurrency: .constant(.silverPenny))
}
