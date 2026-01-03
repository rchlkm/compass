import SwiftUI
import SwiftData

@Observable
class CalendarManager {
    var selectedDate = Date()
    var draggedTask: Task?
    var dragStartTime: Date?
    
    // Calendar time slots (30-minute intervals from 6 AM to 11 PM)
    let timeSlots: [Date] = {
        var slots: [Date] = []
        let calendar = Calendar.current
        let today = Date()
        
        for hour in 6...23 {
            for minute in [0, 30] {
                if let time = calendar.date(bySettingHour: hour, minute: minute, second: 0, of: today) {
                    slots.append(time)
                }
            }
        }
        return slots
    }()
    
    func tasksForTimeSlot(time: Date, tasks: [Task]) -> [Task] {
        tasks.filter { task in
            guard let startTime = task.startTime, let endTime = task.endTime else { return false }
            return startTime <= time && endTime > time
        }
    }
}
