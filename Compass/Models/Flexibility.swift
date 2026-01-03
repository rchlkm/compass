import Foundation

enum Flexibility: String, Codable {
    case rigid      // Must be done specific day
    case flexible   // Can move within week
    case any        // Can defer to next week
}
