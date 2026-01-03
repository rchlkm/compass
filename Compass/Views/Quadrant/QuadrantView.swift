import SwiftUI
import SwiftData

struct QuadrantView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var tasks: [Task]
    @State private var taskManager = TaskManager()
    
    private var todayTasks: [Quadrant: [Task]] {
        taskManager.tasksForDate(Date(), from: tasks)
    }
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 16) {
                    // Top Row
                    HStack(spacing: 16) {
                        QuadrantCard(
                            quadrant: .essentials,
                            tasks: todayTasks[.essentials] ?? [],
                            onAddTask: { taskManager.selectedQuadrant = .essentials }
                        )
                        
                        QuadrantCard(
                            quadrant: .quickWins,
                            tasks: todayTasks[.quickWins] ?? [],
                            onAddTask: { taskManager.selectedQuadrant = .quickWins }
                        )
                    }
                    
                    // Bottom Row
                    HStack(spacing: 16) {
                        QuadrantCard(
                            quadrant: .restorative,
                            tasks: todayTasks[.restorative] ?? [],
                            onAddTask: { taskManager.selectedQuadrant = .restorative }
                        )
                        
                        QuadrantCard(
                            quadrant: .levelUp,
                            tasks: todayTasks[.levelUp] ?? [],
                            onAddTask: { taskManager.selectedQuadrant = .levelUp }
                        )
                    }
                }
                .padding()
            }
            .background(CompassColors.background)
            .navigationTitle("Today")
            .sheet(item: $taskManager.selectedQuadrant) { quadrant in
                AddTaskView(quadrant: quadrant)
            }
        }
    }
}
