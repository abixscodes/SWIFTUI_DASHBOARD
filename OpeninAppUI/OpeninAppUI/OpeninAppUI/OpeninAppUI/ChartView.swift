import SwiftUI
import SwiftUICharts

struct ChartView: View {
    let data: [ChartData]

    var body: some View {
        LineChartView(data: data.map { $0.value }, title: "Chart Data")
            .padding()
    }
