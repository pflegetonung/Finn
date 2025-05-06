//
//  PieSegmentModel.swift
//  FinnApp
//
//  Created by Phillip on 06.05.2025.
//

import Foundation
import SwiftUI

struct PieSegment: Identifiable {
    let id = UUID()
    let value: Double
    let color: Color
    let label: String
}
