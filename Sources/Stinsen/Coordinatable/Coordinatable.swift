import Foundation
import SwiftUI

/// A Coordinatable usually represents some kind of flow in the app. You do not need to implement this directly if
/// you're not toying with other types of navigation e.g. a hamburger menu, but rather you would implement
/// TabCoordinatable, NavigationCoordinatable or ViewCoordinatable.
@MainActor
public protocol Coordinatable: ObservableObject, StringIdentifiable, ViewPresentable, ChildDismissable {
    var parent: ChildDismissable? { get set }
}

public extension Coordinatable {
    var id: String {
        ObjectIdentifier(self).debugDescription
    }
}
