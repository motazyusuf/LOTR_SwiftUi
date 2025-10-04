//
//  ContentView.swift
//  LOTRConverter
//
//  Created by Moataz on 29/09/2025.
//

import SwiftUI

struct ContentView: View {
    @FocusState private var leftField: Bool
    @FocusState private var rightField: Bool
    
    @State private var isShowingInfo: Bool = false
    @State private var isShowingSelectCurrency: Bool = false
    @State private var leftAmount: String = ""
    @State private var rightAmount: String = ""
    @State private var leftCurrency = Currency.silverPiece
    @State private var rightCurrency = Currency.goldPiece

    var body: some View {
        ZStack {
            Image(.background)
                .resizable()
                .ignoresSafeArea()

            VStack {
                Image(.prancingpony)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 250)
                
                Text("Currency Exchange")
                    .font(.largeTitle)
                
                HStack {
                    VStack {
                        Spacer()
                            .frame(height: 15)
                        
                        HStack {
                            Image(leftCurrency.image)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 40)
                            Text(leftCurrency.name)
                                .font(.headline)
                        }
                        .padding(-4)
                        .onTapGesture {
                            isShowingSelectCurrency.toggle()
                        }
                        
                        TextField("Amount", text: $leftAmount)
                            .keyboardType(.numberPad)
                            .focused($leftField)
                            .textFieldStyle(.roundedBorder)
                         
                        Spacer()
                            .frame(height: 10)
                    }
                    
                    Image(systemName: "equal")
                        .font(.largeTitle)
                        .symbolEffect(.bounce)
                    
                    VStack {
                        Spacer()
                            .frame(height: 15)
                        
                        HStack {
                            Text(rightCurrency.name)
                                .font(.headline)
                            Image(rightCurrency.image)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 40)
                        }
                        .padding(-4)
                        .onTapGesture {
                            isShowingSelectCurrency.toggle()
                        }
                        
                        TextField("Amount", text: $rightAmount)
                            .keyboardType(.numberPad)
                            .focused($rightField)
                            .textFieldStyle(.roundedBorder)
                            .multilineTextAlignment(.trailing)
                        
                        Spacer()
                            .frame(height: 10)
                    }
                }
                .padding(.horizontal)
                .background(.black.opacity(0.5))
                .clipShape(.capsule)
                
                Spacer()
                
                HStack {
                    Spacer()
                    Button {
                        isShowingInfo.toggle()
                    } label: {
                        Image(systemName: "info.circle.fill")
                            .font(.largeTitle)
                            .foregroundStyle(isShowingInfo ? .white : .yellow)
                    }
                    .padding()
                    .ignoresSafeArea(.keyboard)
                }
            }
        }
        .onChange(of: leftAmount) {
            rightAmount = leftCurrency.calculateConversion(
                amountString: leftAmount,
                currency: rightCurrency
            )
        }
        .onChange(of: leftCurrency) {
            rightAmount = leftCurrency.calculateConversion(
                amountString: leftAmount,
                currency: rightCurrency
            )
        }
        .onChange(of: rightAmount) {
            leftAmount = rightCurrency.calculateConversion(
                amountString: rightAmount,
                currency: leftCurrency
            )
        }
        .onChange(of: rightCurrency) {
            leftAmount = rightCurrency.calculateConversion(
                amountString: rightAmount,
                currency: leftCurrency
            )
        }
        .frame(maxWidth: .infinity)
        .ignoresSafeArea(.keyboard)
        .sheet(isPresented: $isShowingSelectCurrency, content: {
            SelectCurrency(startingCurrency: $leftCurrency, convertingToCurrency: $rightCurrency)
        })
        .sheet(isPresented: $isShowingInfo, content: {
            ExchangeInfo()
        })
        .toolbar {
            ToolbarItemGroup(placement: .keyboard) {
                Spacer()
                Button("Done") {
                    leftField = false // Dismisses the keyboard
                    rightField = false // Dismisses the keyboard
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
