//
//  MainLabelStyle.swift
//  FinnApp
//
//  Created by Phillip on 06.05.2025.
//

import SwiftUI

struct MainLabelStyle: ViewModifier {
    let size: CGFloat
    let weight: Font.Weight
    let color: Color

    func body(content: Content) -> some View {
        content
            .font(.system(size: size, weight: weight, design: .rounded))
            .foregroundColor(color)
    }
}

extension View {
    func mainLabelStyle(size: CGFloat, weight: Font.Weight, color: Color) -> some View {
        self.modifier(MainLabelStyle(size: size, weight: weight, color: color))
    }
}
