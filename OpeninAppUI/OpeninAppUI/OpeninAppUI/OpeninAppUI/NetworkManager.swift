//
//  NetworkManager.swift
//  OpeninAppUI
//
//  Created by shalin sharma on 23/05/24.
//

import Foundation
import Combine

struct DashboardResponse: Codable {
    let greeting: String
    let topLinks: [Link]
    let recentLinks: [Link]
    let chartData: [ChartData]
}

struct Link: Codable, Identifiable {
    let id: UUID
    let title: String
    let url: String
}

struct ChartData: Codable, Identifiable {
    let id: UUID
    let value: Double
    let date: String
}

class NetworkManager: ObservableObject {
    @Published var dashboardData: DashboardResponse?
    
    private var cancellable: AnyCancellable?
    private let url = URL(string: "https://api.inopenapp.com/api/v1/dashboardNew")!
    private let accessToken = "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjU5MjcsImlhdCI6MTY3NDU1MDQ1MH0.dCkW0ox8t bjJA2GgUx2UEwNlbTZ7Rr38PVFJevYcXFI"

    func fetchDashboardData() {
        var request = URLRequest(url: url)
        request.setValue(accessToken, forHTTPHeaderField: "Authorization")
        
        cancellable = URLSession.shared.dataTaskPublisher(for: request)
            .map { $0.data }
            .decode(type: DashboardResponse.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print("Error fetching data: \(error)")
                }
            }, receiveValue: { [weak self] response in
                self?.dashboardData = response
            })
    }
}
