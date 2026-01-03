// (TabView root)

import SwiftUI

struct ContentView: View {
    @State private var selectedTab = 0

    var body: some View {
        // VStack {
        //     Image(systemName: "globe")
        //         .imageScale(.large)
        //         .foregroundStyle(.tint)
        //     Text("Hello, world!")
        // }
        // .padding()

        TabView(selection: $selectedTab) {
            QuadrantView()
                .tabItem {
                    Label("Today", systemImage: "square.grid.2x2")
                }
                .tag(0)
            
            // TimelineView()
            //     .tabItem {
            //         Label("Timeline", systemImage: "clock")
            //     }
            //     .tag(1)
            
            // WeeklyView()
            //     .tabItem {
            //         Label("Week", systemImage: "calendar")
            //     }
            //     .tag(2)
            
            // AnalyticsView()
            //     .tabItem {
            //         Label("Insights", systemImage: "chart.bar")
            //     }
            //     .tag(3)
        }
        .accentColor(CompassColors.essentialsPrimary)

    }
}

#Preview {
    ContentView()
}
