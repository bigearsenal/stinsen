import Foundation

public protocol RootPoppable {
    @discardableResult func popToRoot(_ action: (() -> Void)?) -> Self
}
