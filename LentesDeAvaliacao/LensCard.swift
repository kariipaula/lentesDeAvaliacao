

import SwiftUI

// MARK: - LensCard

struct LensCard: Codable {
    let category: LensCategory
    let code: String
    let name: String
    let description: String
    let questions: String
    let relatedCards: String?
}

// MARK: - LensCategory

enum LensCategory: String, Codable, CaseIterable {
    case none
    case ux = "UX"
    case usability = "Usability"
    case aesthetic = "Aesthetics"
    case accessibility = "Accessibility"
}

extension LensCategory {
    var name: String {
        switch self {
        case .ux: return NSLocalizedString("lens.category.ux.name", comment: "")
        case .usability: return NSLocalizedString("lens.category.usability.name", comment: "")
        case .aesthetic: return NSLocalizedString("lens.category.aesthetics.name", comment: "")
        case .accessibility: return NSLocalizedString("lens.category.accessibility.name", comment: "")
        case .none: return NSLocalizedString("lens.category.none.name", comment: "")
        }
    }
    
    var height: CGFloat {
        switch self {
        case .ux: return 24
        case .usability: return 90
        case .aesthetic: return 56
        case .accessibility: return 106
        case .none: return .zero
        }
    }
    
    var color: Color {
        switch self {
        case .ux: return .ux
        case .usability: return .usability
        case .aesthetic: return .aesthetic
        case .accessibility: return .accessibility
        case .none: return .black
        }
    }
    
    var icon: Image {
        switch self {
        case .ux: return .uxIcon
        case .usability: return .usabilityIcon
        case .aesthetic: return .aestheticsIcon
        case .accessibility: return .accessibilityIcon
        case .none: return .uxIcon
        }
    }
}
