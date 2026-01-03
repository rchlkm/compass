import SwiftUI
import SwiftData

struct AddTaskView: View {
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss
    
    let quadrant: Quadrant
    
    @State private var title = ""
    @State private var duration = 30
    @State private var startTime = Date()
    @State private var hasStartTime = true
    
    let durationOptions = [15, 30, 45, 60, 90, 120]
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Task Details") {
                    TextField("Task title", text: $title)
                    
                    Picker("Duration", selection: $duration) {
                        ForEach(durationOptions, id: \.self) { minutes in
                            Text("\(minutes) min").tag(minutes)
                        }
                    }
                }
                
                Section("Schedule") {
                    Toggle("Set start time", isOn: $hasStartTime)
                    
                    if hasStartTime {
                        DatePicker("Start time", selection: $startTime, displayedComponents: [.hourAndMinute])
                    }
                }
                
                Section {
                    HStack {
                        Image(systemName: quadrant.icon)
                        Text(quadrant.displayName)
                    }
                    .foregroundColor(quadrant.color)
                }
            }
            .navigationTitle("New Task")
            // .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
                
                ToolbarItem(placement: .confirmationAction) {
                    Button("Add") {
                        addTask()
                    }
                    .disabled(title.isEmpty)
                }
            }
        }
    }
    
    private func addTask() {
        let task = Task(
            title: title,
            quadrant: quadrant,
            startTime: hasStartTime ? startTime : nil,
            duration: duration
        )
        modelContext.insert(task)
        dismiss()
    }
}
