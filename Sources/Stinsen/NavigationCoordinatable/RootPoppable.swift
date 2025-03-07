import Foundation

@MainActor
public protocol RootPoppable {
    @discardableResult func popToRoot(_ action: (() -> Void)?) -> Self
}
