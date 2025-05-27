//
//  ContentView.swift
//  FinnApp
//
//  Created by Phillip on 04.05.2025.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var coordinator = ContentCoordinator()
    @StateObject private var contentVM: ContentViewModel
    @StateObject var financeVM = FinanceViewModel()
    @EnvironmentObject var settingsVM: SettingsViewModel
    
    @State private var isShownAddOptions = false
    @State private var isMainSheetShown = false
    @State private var isOverlayShown = true
    
    let TEMPORARY_PERC: Double = 5
    
    init() {
            let coordinator = ContentCoordinator()
            _coordinator = StateObject(wrappedValue: coordinator)
            _contentVM = StateObject(wrappedValue: ContentViewModel(coordinator: coordinator))
        }
    
    var body: some View {
        NavigationStack {
            ZStack(alignment: .top) {
                Image("IMG_0389")
                    .resizable()
                    .scaledToFill()
                    .frame(height: 350)
                    .ignoresSafeArea()
                    .blur(radius: 2, opaque: true)
                
                VStack(spacing: 0) {
                    LinearGradient(colors: [.clear, .black], startPoint: .top, endPoint: .bottom)
                        .frame(height: 350)
                    
                    Color.black
                }
                .ignoresSafeArea()
                
                VStack {
                    VStack(spacing: 12) {
                        
                        // MARK: - Funds Label
                        HStack {
                            VStack(alignment: .trailing) {
                                Text("+\(settingsVM.selectedCurrency.symbol)\(String(format: "%.2f", financeVM.totalIncome))")
                                Text("-\(settingsVM.selectedCurrency.symbol)\(String(format: "%.2f", financeVM.totalExpenses))")
                            }
                            .mainLabelStyle(size: 10, weight: .semibold, color: .white.opacity(0.5))
                            
                            Image(systemName: TEMPORARY_PERC > 0 ? "arrow.up" : (TEMPORARY_PERC < 0 ? "arrow.down" : "minus"))
                                .foregroundColor(TEMPORARY_PERC > 0 ? .green : (TEMPORARY_PERC < 0 ? .red : .white.opacity(0.5)))
                            
                            Text("\(String(format: "%.2f", TEMPORARY_PERC))%")
                                .mainLabelStyle(size: 16, weight: .regular, color: .white.opacity(0.5))
                        }
                        
                        HStack(spacing: 16) {
                            Text("\(settingsVM.selectedCurrency.symbol) \(String(format: "%.2f", financeVM.balance))")
                                .mainLabelStyle(size: 48, weight: .bold, color: .white)
                        }
                        
                        // MARK: - Income/Expense Button
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
                                    HStack(spacing: 0) {
                                        Spacer()
                                        
                                        Button {
                                            withAnimation {
                                                isOverlayShown = true
                                                isMainSheetShown = false
                                            }
                                        } label: {
                                            Label("Income", systemImage: "plus")
                                                .font(.system(size: 16, weight: .bold, design: .rounded))
                                                .foregroundColor(.white)
                                                .frame(width: 128, height: 24)
                                        }
                                        
                                        Spacer()
                                        
                                        Rectangle()
                                            .frame(width: 1, height: 40)
                                            .foregroundColor(.white.opacity(0.1))
                                        
                                        Spacer()
                                        
                                        Button {
                                            withAnimation {
                                                isOverlayShown = true
                                                isMainSheetShown = false
                                            }
                                        } label: {
                                            Label("Expense", systemImage: "minus")
                                                .font(.system(size: 16, weight: .bold, design: .rounded))
                                                .foregroundColor(.white)
                                                .frame(width: 128, height: 24)
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
                    // MARK: - Settings & Stats
                    HStack {
                        Button {
                            withAnimation {
                                contentVM.goToSettings()
                                isMainSheetShown = false
                            }
                        } label: {
                            ZStack {
                                Circle()
                                    .frame(height: 32)
                                    .foregroundColor(.white)
                                
                                Image(systemName: "person.fill")
                                    .foregroundColor(.black)
                            }
                        }
                        
                        Spacer()
                        
                        Button {
                            withAnimation {
                                contentVM.goToStats()
                                isMainSheetShown = false
                            }
                        } label: {
                            Text("Statistics")
                                .font(.system(size: 16, weight: .bold, design: .rounded))
                                .foregroundColor(.black)
                                .padding(.horizontal)
                                .background(
                                    Capsule()
                                        .frame(height: 32)
                                        .foregroundColor(.white)
                                )
                        }
                    }
                    
                    Rectangle()
                        .frame(height: 450)
                        .foregroundColor(.clear)
                }
                .padding()
                // MARK: - Main Screen
                .sheet(isPresented: $isMainSheetShown) {
                    MainScreenView()
                        .presentationDetents([.height(450), .large])
                        .presentationCornerRadius(48)
                        .presentationBackgroundInteraction(.enabled(upThrough: .large))
                        .interactiveDismissDisabled()
                }
                
                if isOverlayShown {
                    OverlayView(isOverlayShown: $isOverlayShown, isMainScreenSheetShown: $isMainSheetShown)
                        .ignoresSafeArea()
                }
            }
            .navigationDestination(isPresented: Binding(
                get: { coordinator.route != nil },
                set: { if !$0 { coordinator.route = nil } }
            )) {
                if let route = coordinator.route {
                    coordinator.destinationView(for: route)
                }
            }
        }
    }
}

#Preview {
    ContentView()
        .environmentObject(SettingsViewModel(coordinator: ContentCoordinator()))
}

struct OverlayView: View {
    @EnvironmentObject var settingsVM: SettingsViewModel
    
    @Binding var isOverlayShown: Bool
    @Binding var isMainScreenSheetShown: Bool
    
    var body: some View {
        ZStack {
            Color.black.opacity(0.5)
            
            ZStack {
                RoundedRectangle(cornerRadius: 24)
                    .foregroundColor(.white)
                
                VStack {
                    HStack {
                        Button {
                            withAnimation {
                                isOverlayShown = false
                                isMainScreenSheetShown = true
                            }
                        } label: {
                            Image(systemName: "xmark.circle")
                                .resizable()
                                .scaledToFit()
                                .frame(height: 24)
                                .foregroundColor(.black.opacity(0.2))
                        }
                        
                        Spacer()
                    }
                    
                    Text("\(settingsVM.selectedCurrency.symbol)0.00")
                        .mainLabelStyle(size: 48, weight: .bold, color: .black)
                    
                    Spacer()
                    
                    Button {
                        withAnimation {
                            
                        }
                    } label: {
                        ZStack {
                            Capsule()
                                .frame(height: 32)
                                .foregroundColor(.black)
                            
                            Text("Add expense")
                                .mainLabelStyle(size: 16, weight: .bold, color: .white)
                        }
                    }
                }
                .padding()
            }
            .frame(width: 256, height: 320)
            .offset(y: -140)
        }
    }
}
