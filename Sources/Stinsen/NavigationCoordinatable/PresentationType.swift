import Foundation
import SwiftUI

public enum PresentationType {
    case modal
    case push
    case fullScreen
    case sheet(presentationDetents: Set<PresentationDetent>)

    var isSheet: Bool {
        switch self {
        case .modal, .sheet:
            return true
        default:
            return false
        }
    }

    var isPush: Bool {
        switch self {
        case .push:
            return true
        default:
            return false
        }
    }

    var isFullScreen: Bool {
        switch self {
        case .fullScreen:
            return true
        default:
            return false
        }
    }

    var presentationDetents: Set<PresentationDetent>? {
        switch self {
        case let .sheet(presentationDetents):
            return presentationDetents
        default:
            return nil
        }
    }
}
