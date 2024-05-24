import SwiftUI

struct TabViewExample: View {
    @ObservedObject var networkManager: NetworkManager

    var body: some View {
        TabView {
            if let topLinks = networkManager.dashboardData?.topLinks {
                LinksListView(links: topLinks)
                    .tabItem {
                        Text("Top Links")
                    }
            }

            if let recentLinks = networkManager.dashboardData?.recentLinks {
                LinksListView(links: recentLinks)
                    .tabItem {
                        Text("Recent Links")
                    }
            }
        }
        .onAppear {
            networkManager.fetchDashboardData()
        }
    }
}
