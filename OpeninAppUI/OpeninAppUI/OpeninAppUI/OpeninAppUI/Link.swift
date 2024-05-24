//
//  Link.swift
//  OpeninAppUI
//
//  Created by shalin sharma on 23/05/24.
//

import Foundation


struct Link: Codable, Identifiable {
    let id: UUID
    let title: String
    let url: String
}
