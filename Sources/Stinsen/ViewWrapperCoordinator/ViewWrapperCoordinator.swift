import Foundation
import SwiftUI

/// The NavigationViewCoordinator is used to represent a coordinator with a NavigationView
open class ViewWrapperCoordinator<T: Coordinatable, V: View>: Coordinatable, RootPoppable {
    public func dismissChild<CC: Coordinatable>(coordinator _: CC, action: (() -> Void)?) {
        guard let parent = parent else {
            return
        }

        parent.dismissChild(coordinator: self, action: action)
    }

    @discardableResult
    public func popToRoot(_ action: (() -> Void)?) -> Self {
        if let coordinator = child as? RootPoppable {
            coordinator.popToRoot(action)
        }
        return self
    }

    public weak var parent: ChildDismissable?
    public let child: T
    private let viewFactory: (any Coordinatable) -> (AnyView) -> V

    public func view() -> AnyView {
        AnyView(
            ViewWrapperCoordinatorView(coordinator: self, viewFactory(self))
        )
    }

    public init(_ childCoordinator: T, _ view: @escaping (AnyView) -> V) {
        child = childCoordinator
        viewFactory = { _ in { view($0) } }
        child.parent = self
    }

    public init(_ childCoordinator: T, _ view: @escaping (any Coordinatable) -> (AnyView) -> V) {
        child = childCoordinator
        viewFactory = view
        child.parent = self
    }
}
