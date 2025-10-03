//
//  CurrencyGrid.swift
//  LOTRConverter
//
//  Created by Moataz on 03/10/2025.
//

import SwiftUI

struct CurrencyGrid: View {
    @Binding var currency: Currency
    
    func isSelected(_ currency: Currency) -> Bool {
        self.currency == currency
    }
    
    var body: some View {
        
        LazyVGrid(columns: [GridItem(), GridItem(), GridItem()]) {
            
            ForEach(Currency.allCases) { currency in
                
                CurrencyIcon(currencyImage: currency.image, currencyName: currency.name)
                    .shadow(color: isSelected(currency) ? .black : .clear, radius: 10)
                    .overlay {
                        isSelected(currency) ?
                        RoundedRectangle(cornerRadius: 26)
                            .stroke(lineWidth: 3)
                            .opacity(0.5)
                        : nil
                    }
                    .onTapGesture{
                        if self.currency != currency {
                            self.currency = currency
                        }
                    }
            }
        }
    }
}

#Preview {
    CurrencyGrid(currency: .constant(.goldPenny))
}
