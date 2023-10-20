import Foundation
import SwiftUI

public struct TabChildItem {
    public let presentable: ViewPresentable
    let keyPathIsEqual: (Any) -> Bool
    public let tabItem: (Bool) -> AnyView
    let onTapped: (Bool) -> Void
    let coordinator: () -> (any Coordinatable)?
}

/// Wrapper around childCoordinators
/// Used so that you don't need to write @Published
public class TabChild: ObservableObject {
    weak var parent: ChildDismissable?
    public let startingItems: [AnyKeyPath]

    @Published var activeItem: TabChildItem!

    public var allItems: [TabChildItem]! {
        didSet {
            let newItem = allItems?[safe: activeTab]
            activeItem = newItem
        }
    }

    public var activeTab: Int {
        didSet {
            allItems[activeTab].onTapped(oldValue == activeTab)
            guard oldValue != activeTab else { return }
            let newItem = allItems[activeTab]
            activeItem = newItem
        }
    }

    public init(startingItems: [AnyKeyPath], activeTab: Int = 0) {
        self.startingItems = startingItems
        self.activeTab = activeTab
    }
}
