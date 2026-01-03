import SwiftUI

struct CompassColors {
    // Essentials - Burnt Umber
    static let essentialsPrimary = Color(hex: "8A5A3C")
    static let essentialsDark = Color(hex: "1F2A44")
    
    // Restorative - Lavender
    static let restorativePrimary = Color(hex: "B8A7D9")
    static let restorativeMuted = Color(hex: "CFC6E8")
    
    // Quick Wins - Muted Orange
    static let quickWinsPrimary = Color(hex: "E39A4C")
    static let quickWinsMuted = Color(hex: "F0C38E")
    
    // Level Up - Sage Green
    static let levelUpPrimary = Color(hex: "8FAF9A")
    static let levelUpMuted = Color(hex: "B8D1C2")
    
    // Base UI
    static let background = Color(hex: "F6F5F2")
    static let primaryText = Color(hex: "2E2E2E")
    static let secondaryText = Color(hex: "6B6B6B")
    static let divider = Color(hex: "E2E1DD")
    
    static func forQuadrant(_ quadrant: Quadrant) -> Color {
        switch quadrant {
        case .essentials: return essentialsPrimary
        case .restorative: return restorativePrimary
        case .quickWins: return quickWinsPrimary
        case .levelUp: return levelUpPrimary
        }
    }
    
    static func mutedForQuadrant(_ quadrant: Quadrant) -> Color {
        switch quadrant {
        case .essentials: return essentialsPrimary.opacity(0.2)
        case .restorative: return restorativeMuted
        case .quickWins: return quickWinsMuted
        case .levelUp: return levelUpMuted
        }
    }
}

