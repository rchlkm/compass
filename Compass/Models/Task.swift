import SwiftUI
import SwiftData

@Model
final class Task {
    var id: UUID
    var title: String
    var quadrant: Quadrant
    var startTime: Date?
    var duration: Int // minutes
    var isCompleted: Bool
    var isSkipped: Bool
    var isScheduled: Bool // For backlog vs scheduled
    var createdDate: Date
    var weekAssigned: Date
    var flexibility: Flexibility
    var actualDuration: Int? // Minutes actually spent
    var timerStartedAt: Date?
    var timerPausedAt: Date?
    var backlogAddedDate: Date?
    
    init(
        id: UUID = UUID(),
        title: String,
        quadrant: Quadrant,
        startTime: Date? = nil,
        duration: Int = 30,
        isCompleted: Bool = false,
        isSkipped: Bool = false,
        isScheduled: Bool = true,
        createdDate: Date = Date(),
        weekAssigned: Date = Date(),
        flexibility: Flexibility = .flexible,
        actualDuration: Int? = nil,
        timerStartedAt: Date? = nil,
        timerPausedAt: Date? = nil,
        backlogAddedDate: Date? = nil
    ) {
        self.id = id
        self.title = title
        self.quadrant = quadrant
        self.startTime = startTime
        self.duration = duration
        self.isCompleted = isCompleted
        self.isSkipped = isSkipped
        self.isScheduled = isScheduled
        self.createdDate = createdDate
        self.weekAssigned = weekAssigned
        self.flexibility = flexibility
        self.actualDuration = actualDuration
        self.timerStartedAt = timerStartedAt
        self.timerPausedAt = timerPausedAt
        self.backlogAddedDate = backlogAddedDate
    }
    
    var startDate: Date {
        startTime ?? createdDate
    }
    
    var endTime: Date? {
        guard let start = startTime else { return nil }
        return Calendar.current.date(byAdding: .minute, value: duration, to: start)
    }
}
