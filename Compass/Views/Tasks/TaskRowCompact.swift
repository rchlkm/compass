import SwiftUI

struct TaskRowCompact: View {
    let task: Task
    
    var body: some View {
        HStack(spacing: 8) {
            if let startTime = task.startTime {
                Text(startTime, style: .time)
                    .font(.caption)
                    .foregroundColor(CompassColors.secondaryText)
                    .frame(width: 50, alignment: .leading)
            }
            
            VStack(alignment: .leading, spacing: 2) {
                Text(task.title)
                    .font(.subheadline)
                    .foregroundColor(CompassColors.primaryText)
                    .lineLimit(1)
                
                Text("\(task.duration) min")
                    .font(.caption2)
                    .foregroundColor(CompassColors.secondaryText)
            }
            
            Spacer()
            
            Image(systemName: task.isCompleted ? "checkmark.circle.fill" : "circle")
                .foregroundColor(task.isCompleted ? task.quadrant.color : CompassColors.secondaryText)
        }
        .padding(.vertical, 4)
    }
}

