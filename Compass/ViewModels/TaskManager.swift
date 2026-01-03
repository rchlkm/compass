import SwiftUI
import SwiftData

@Observable
class TaskManager {
    var selectedDate = Date()
    var showingAddTask = false
    var selectedQuadrant: Quadrant?
    
    func tasksForDate(_ date: Date, from allTasks: [Task]) -> [Quadrant: [Task]] {
        let filtered = allTasks.filter { task in
            if let startTime = task.startTime {
                return startTime.isSameDay(as: date)
            }
            return false
        }
        return Dictionary(grouping: filtered) { $0.quadrant }
    }
    
    func sortedTasksForDate(_ date: Date, from allTasks: [Task]) -> [Task] {
        allTasks
            .filter { $0.isScheduled && $0.startTime?.isSameDay(as: date) ?? false }
            .sorted { ($0.startTime ?? Date.distantFuture) < ($1.startTime ?? Date.distantFuture) }
    }
    
    func backlogTasks(from allTasks: [Task]) -> [Quadrant: [Task]] {
        let backlog = allTasks.filter { !$0.isScheduled }
        return Dictionary(grouping: backlog) { $0.quadrant }
    }
    
    func weeklyDistribution(from allTasks: [Task]) -> [Quadrant: Int] {
        let thisWeek = allTasks.filter { $0.startTime?.isSameWeek(as: Date()) ?? false }
        return Dictionary(grouping: thisWeek, by: { $0.quadrant })
            .mapValues { $0.count }
    }
}
