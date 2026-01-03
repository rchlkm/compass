import SwiftUI

enum Quadrant: String, Codable, CaseIterable, Identifiable {
    case essentials = "E"
    case restorative = "R"
    case quickWins = "QW"
    case levelUp = "LU"
    
    var id: String { rawValue }
    
    var displayName: String {
        switch self {
        case .essentials: return "Essentials"
        case .restorative: return "Restorative"
        case .quickWins: return "Quick Wins"
        case .levelUp: return "Level Up"
        }
    }
    
    var icon: String {
        switch self {
        case .essentials: return "exclamationmark.circle.fill"
        case .restorative: return "heart.circle.fill"
        case .quickWins: return "bolt.circle.fill"
        case .levelUp: return "arrow.up.circle.fill"
        }
    }
    
    var color: Color {
        CompassColors.forQuadrant(self)
    }
    
    var mutedColor: Color {
        CompassColors.mutedForQuadrant(self)
    }
}

