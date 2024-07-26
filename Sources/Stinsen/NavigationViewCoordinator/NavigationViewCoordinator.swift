import Foundation
import SwiftUI

/// The NavigationViewCoordinator is used to represent a coordinator with a NavigationView
public class NavigationViewCoordinator<T: Coordinatable>: ViewWrapperCoordinator<T, AnyView> {
    public init(_ childCoordinator: T) {
        super.init(childCoordinator) { view in
//            if Bool.navigationStackAvailable {
//                return AnyView(
//                    SwiftUI.NavigationStack {
//                        view
//                    }
//                )
//            } else {
            #if os(macOS)
                return AnyView(
                    NavigationView {
                        view
                    }
                )
            #else
                return AnyView(
                    NavigationView {
                        view
                    }
                    .navigationViewStyle(StackNavigationViewStyle())
                )
            #endif
//            }
        }
    }

    @available(*, unavailable)
    override public init(_: T, _: @escaping (AnyView) -> AnyView) {
        fatalError("view cannot be customized")
    }

    @available(*, unavailable)
    override public init(_: T, _: @escaping (any Coordinatable) -> (AnyView) -> AnyView) {
        fatalError("view cannot be customized")
    }
}
