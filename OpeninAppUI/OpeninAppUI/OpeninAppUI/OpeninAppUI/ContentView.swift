import SwiftUI

struct ContentView: View {
    @StateObject private var networkManager = NetworkManager()
    
    var body: some View {
        VStack {
            if let dashboardData = networkManager.dashboardData {
                GreetingView(greeting: dashboardData.greeting)
                ChartView(data: dashboardData.chartData)
                TabViewExample(networkManager: networkManager)
            } else {
                Text("Loading...")
                    .onAppear {
                        networkManager.fetchDashboardData()
                    }
            }
        }
    }
}
