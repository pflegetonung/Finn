//
//  MainScreenView.swift
//  FinnApp
//
//  Created by Phillip on 06.05.2025.
//

import SwiftUI

struct MainScreenView: View {
    let segments: [PieSegment]

    var total: Double {
        segments.reduce(0) { $0 + $1.value }
    }

    var angles: [Angle] {
        var currentAngle = Angle(degrees: 0)
        var angles: [Angle] = []

        for segment in segments {
            let angle = Angle(degrees: 360 * (segment.value / total))
            angles.append(currentAngle)
            currentAngle += angle
        }
        return angles
    }
    
    var body: some View {
        ScrollView {
            VStack {
                ZStack {
                    ForEach(Array(segments.enumerated()), id: \.element.id) { index, segment in
                        let startAngle = angles[index]
                        let endAngle = index == segments.count - 1 ? Angle(degrees: 360) : angles[index + 1]
                        
                        PieSlice(startAngle: startAngle, endAngle: endAngle)
                            .fill(segment.color)
                        
                        Circle()
                            .frame(height: 150)
                            .foregroundColor(.white)
                    }
                    
                }
                .frame(width: 200, height: 200)
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}

struct PieSlice: Shape {
    let startAngle: Angle
    let endAngle: Angle

    func path(in rect: CGRect) -> Path {
        var path = Path()
        let center = CGPoint(x: rect.midX, y: rect.midY)
        path.move(to: center)

        path.addArc(
            center: center,
            radius: min(rect.width, rect.height) / 2,
            startAngle: startAngle - Angle(degrees: 90),
            endAngle: endAngle - Angle(degrees: 90),
            clockwise: false
        )
        path.closeSubpath()
        return path
    }
}
