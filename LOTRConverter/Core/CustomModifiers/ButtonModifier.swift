//
//  ButtonModifier.swift
//  LOTRConverter
//
//  Created by Moataz on 03/10/2025.
//

import SwiftUI

struct LOTRButton: ViewModifier {
    func body(content: Content) -> some View {
        content
            .buttonStyle(.borderedProminent)
            .tint(.brown.mix(with: .black, by: 0.2))
            .font(.largeTitle)
            .padding()
            .foregroundStyle(.white)
    }
}

extension View {
    func lotrButton() -> some View {
        self.modifier(LOTRButton())
    }
}
