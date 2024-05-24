//
//  ListView.swift
//  OpeninAppUI
//
//  Created by shalin sharma on 23/05/24.
//

import Foundation
import SwiftUI

struct ListView: View {
    var links: [Link]

    var body: some View {
        List(links, id: \.url) { link in
            VStack(alignment: .leading) {
                Text(link.title)
                    .font(.headline)
                Text(link.url)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            .padding()
        }
    }
}
