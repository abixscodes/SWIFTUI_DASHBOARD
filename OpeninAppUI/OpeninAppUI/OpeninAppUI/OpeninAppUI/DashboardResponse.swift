import Foundation

struct DashboardResponse: Codable {
    let greeting: String
    let topLinks: [Link]
    let recentLinks: [Link]
    let chartData: [ChartData]
}
