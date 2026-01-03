import Foundation

extension Task {
    static var sampleData: [Task] {
        [
            Task(
                title: "Create job prep activites tracker",
                quadrant: .essentials,
                startTime: Calendar.current.date(bySettingHour: 9, minute: 0, second: 0, of: Date()),
                duration: 45
            ),
            Task(
                title: "Assign bank accounts purpose",
                quadrant: .essentials,
                startTime: Calendar.current.date(bySettingHour: 10, minute: 0, second: 0, of: Date()),
                duration: 90
            ),
            Task(
                title: "Art Therapy",
                quadrant: .restorative,
                startTime: Calendar.current.date(bySettingHour: 12, minute: 0, second: 0, of: Date()),
                duration: 15
            ),
            Task(
                title: "Update Naya insurance plan",
                quadrant: .quickWins,
                startTime: Calendar.current.date(bySettingHour: 14, minute: 0, second: 0, of: Date()),
                duration: 30
            ),
            Task(
                title: "Setup Compass app",
                quadrant: .levelUp,
                startTime: Calendar.current.date(bySettingHour: 16, minute: 0, second: 0, of: Date()),
                duration: 60
            )
        ]
    }
}