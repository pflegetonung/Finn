//
//  ContentView.swift
//  FinnApp
//
//  Created by Phillip on 04.05.2025.
//

import SwiftUI

struct ContentView: View {
    @State private var isShownAddOptions = false
    @State private var isMainSheetShown = true
    
    let TEMPORARY_FUNDS = 534.39
    let currentCurrency: Currency = .jpy
    let segmentsData = [
        PieSegment(value: 40, color: .blue, label: "A"),
        PieSegment(value: 30, color: .green, label: "B"),
        PieSegment(value: 20, color: .orange, label: "C"),
        PieSegment(value: 10, color: .red, label: "D")
    ]
    
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            
            VStack {
                VStack(spacing: 12) {
                    HStack {
                        Text("+\(currentCurrency.symbol)632 in may")
                        
                        Image(systemName: "triangleshape.fill")
                            .foregroundColor(.green)
                        
                        Text("3.16%")
                    }
                    .font(.system(size: 16, weight: .regular, design: .rounded))
                    .foregroundColor(.white.opacity(0.5))
                    
                    // MARK: - Funds label
                    HStack(spacing: 16) {
                        Text("\(currentCurrency.symbol) \(String(format: "%.2f", TEMPORARY_FUNDS))")
                            .font(.system(size: 48, weight: .bold, design: .rounded))
                            .foregroundColor(.white)
                    }
                    
                    // MARK: - Income/Expense button
                    Button {
                        withAnimation {
                            if !isShownAddOptions {
                                isShownAddOptions.toggle()
                                
                                DispatchQueue.main.asyncAfter(deadline: .now() + 10) {
                                    withAnimation {
                                        isShownAddOptions.toggle()
                                    }
                                }
                            }
                        }
                    } label: {
                        ZStack {
                            Capsule()
                                .foregroundColor(.white.opacity(0.1))
                                .frame(width: isShownAddOptions ? 256 : 64, height: isShownAddOptions ? 48 : 32)
                                .animation(.spring(), value: isShownAddOptions)
                            
                            if isShownAddOptions {
                                HStack {
                                    Spacer()
                                    
                                    Button {
                                        withAnimation {
                                            
                                        }
                                    } label: {
                                        Label("Income", systemImage: "plus")
                                            .font(.system(size: 16, weight: .bold, design: .rounded))
                                            .foregroundColor(.white)
                                    }
                                    
                                    Spacer()
                                    
                                    Rectangle()
                                        .frame(width: 1, height: 64)
                                        .foregroundColor(.white.opacity(0.1))
                                    
                                    Spacer()
                                    
                                    Button {
                                        withAnimation {
                                        }
                                    } label: {
                                        Label("Expense", systemImage: "minus")
                                            .font(.system(size: 16, weight: .bold, design: .rounded))
                                            .foregroundColor(.white)
                                    }
                                    
                                    Spacer()
                                }
                                .frame(width: 256)
                                .transition(.opacity)
                            } else {
                                Image(systemName: "pencil")
                                    .font(.system(size: 16, weight: .bold, design: .rounded))
                                    .foregroundColor(.white)
                            }
                        }
                    }
                }
                .padding(.top, 64)
                
                Spacer()
                
                HStack {
                    Spacer()
                    
                    Button {
                        withAnimation {
                            
                        }
                    } label: {
                        Circle()
                            .frame(height: 32)
                            .foregroundColor(.white)
                    }
                }
                
                Rectangle()
                    .frame(height: 450)
                    .foregroundColor(.clear)
            }
            .padding()
            .sheet(isPresented: $isMainSheetShown) {
                MainScreenView(segments: segmentsData)
                    .presentationDetents([.height(450), .large])
                    .presentationCornerRadius(48)
                    .presentationBackgroundInteraction(.enabled(upThrough: .large))
                    .interactiveDismissDisabled()
            }
        }
    }
}

#Preview {
    ContentView()
}
