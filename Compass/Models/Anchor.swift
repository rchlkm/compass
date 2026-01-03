import Foundation
import SwiftData

@Model
final class Anchor {
    var id: UUID
    var title: String
    var recurrence: String // Will store RecurrenceType as JSON
    var duration: Int
    var preferredStartTime: Date?
    var quadrant: Quadrant
    
    init(
        id: UUID = UUID(),
        title: String,
        recurrence: String = "daily",
        duration: Int = 30,
        preferredStartTime: Date? = nil,
        quadrant: Quadrant = .restorative
    ) {
        self.id = id
        self.title = title
        self.recurrence = recurrence
        self.duration = duration
        self.preferredStartTime = preferredStartTime
        self.quadrant = quadrant
    }
}
