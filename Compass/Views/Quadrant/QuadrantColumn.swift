import SwiftUI

struct QuadrantColumn: View {
    let quadrant: Quadrant
    let tasks: [Task]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(quadrant.displayName)
                .font(.headline)
                .foregroundColor(quadrant.color)
            
            ForEach(tasks.filter { $0.quadrant == quadrant }) { task in
                HStack(spacing: 8) {
                    if let startTime = task.startTime {
                        Text(startTime, style: .time)
                            .font(.caption)
                            .foregroundColor(CompassColors.secondaryText)
                    }
                    Text(task.title)
                        .font(.subheadline)
                        .padding(4)
                        .background(quadrant.mutedColor)
                        .cornerRadius(4)
                }
            }
            Spacer()
        }
        .padding(8)
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .stroke(quadrant.color, lineWidth: 1)
        )
    }
}

