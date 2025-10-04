//
//  currency_types.swift
//  LOTRConverter
//
//  Created by Moataz on 03/10/2025.
//
import SwiftUI

enum Currency: Double, CaseIterable, Identifiable {
    case copperPenny = 6400
    case silverPenny = 64
    case silverPiece = 16
    case goldPenny = 4
    case goldPiece = 1
    
    var id: Currency { self }
    
    var image: ImageResource{
        switch self {
        case .copperPenny:
                .copperpenny
        case .silverPenny:
                .silverpenny
        case .silverPiece:
                .silverpiece
        case .goldPenny:
                .goldpenny
        case .goldPiece:
                .goldpiece
        }
    }
    
    var name: String{
        switch self {
        case .copperPenny:
                "Copper Penny"
        case .silverPenny:
                "Silver Penny"
        case .silverPiece:
                "Silver Piece"
        case .goldPenny:
                "Gold Penny"
        case .goldPiece:
                "Gold Piece"
        }
    }
    
    func calculateConversion(amountString: String, currency: Currency) -> String {
        guard let amountDouble = Double(amountString) else {
            return ""
        }
        
        let result = (amountDouble / self.rawValue) * currency.rawValue
        
        // If it's whole, show as Int; otherwise show as Double
        if result.truncatingRemainder(dividingBy: 1) == 0 {
            return String(Int(result))
        } else {
            return String(result)
        }
    }

    
}
