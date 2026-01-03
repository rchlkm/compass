import SwiftUI

struct QuadrantCard: View {
    let quadrant: Quadrant
    let tasks: [Task]
    let onAddTask: () -> Void
    
    private var sortedTasks: [Task] {
        tasks.sorted { t1, t2 in
            guard let time1 = t1.startTime, let time2 = t2.startTime else {
                return t1.startTime != nil
            }
            return time1 < time2
        }
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            // Header
            HStack {
                Image(systemName: quadrant.icon)
                    .foregroundColor(quadrant.color)
                Text(quadrant.displayName)
                    .font(.headline)
                    .foregroundColor(CompassColors.primaryText)
                
                Spacer()
                
                Button(action: onAddTask) {
                    Image(systemName: "plus.circle.fill")
                        .foregroundColor(quadrant.color)
                        .font(.title3)
                }
            }
            
            Divider()
                .background(CompassColors.divider)
            
            // Tasks
            if sortedTasks.isEmpty {
                Text("No tasks")
                    .font(.subheadline)
                    .foregroundColor(CompassColors.secondaryText)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding(.vertical, 20)
            } else {
                VStack(alignment: .leading, spacing: 8) {
                    ForEach(sortedTasks) { task in
                        TaskRowCompact(task: task)
                    }
                }
            }
            
            Spacer()
        }
        .padding()
        .frame(height: 240)
        .background(quadrant.mutedColor)
        .cornerRadius(16)
        .shadow(color: Color.black.opacity(0.05), radius: 4, x: 0, y: 2)
    }
}