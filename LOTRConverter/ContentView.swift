//
//  ContentView.swift
//  LOTRConverter
//
//  Created by Moataz on 29/09/2025.
//

import SwiftUI

struct ContentView: View {
    @State var isShowingInfo: Bool = false
    @State var isShowingSelectCurrency: Bool = false
    @State var leftAmount: String = ""
    @State var rightAmount: String = ""
    @State var leftCurrency: Currency = .silverPiece
    @State var rightCurrency: Currency = .goldPiece
    
    var body: some View {
        ZStack {
            Image(.background)
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
                .frame(minWidth: 0, maxWidth: .infinity)
            
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
                    .padding(.trailing)
                    .sheet(isPresented: $isShowingInfo, content: {
                        ExchangeInfo()
                    })
                }
            }
        }.sheet(isPresented: $isShowingInfo, content: {
            ExchangeInfo()
        })
        .sheet(isPresented: $isShowingSelectCurrency, content: {
            SelectCurrency(startingCurrency: $leftCurrency, convertingToCurrency: $rightCurrency)
        })
    }
}

#Preview {
    ContentView()
}
