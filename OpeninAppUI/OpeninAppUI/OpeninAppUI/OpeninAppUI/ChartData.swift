//
//  CharrData.swift
//  OpeninAppUI
//
//  Created by shalin sharma on 23/05/24.
//

import Foundation

struct ChartData: Codable, Identifiable {
    let id: UUID
    let value: Double
    let date: String
}
