//
//  LinksListView.swift
//  OpeninAppUI
//
//  Created by shalin sharma on 23/05/24.
//

import Foundation
import SwiftUI

struct LinksListView: View {
    let links: [Link]

    var body: some View {
        List(links) { link in
            VStack(alignment: .leading) {
                Text(link.title)
                    .font(.headline)
                Text(link.url)
                    .font(.subheadline)
                    .foregroundColor(.blue)
            }
        }
    }
}
