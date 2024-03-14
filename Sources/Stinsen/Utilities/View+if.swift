import Foundation
import SwiftUI

extension View {
    /// Applies the given transform if the given condition evaluates to `true`.
    /// - Parameters:
    ///   - condition: The condition to evaluate.
    ///   - transform: The transform to apply to the source `View`.
    /// - Returns: Either the original `View` or the modified `View` if the condition is `true`.
    @ViewBuilder func `if`<Content: View, ElseContent: View>(
        _ condition: @autoclosure () -> Bool,
        transform: (Self) -> Content,
        elseTransform: (Self) -> ElseContent
    ) -> some View {
        if condition() {
            transform(self)
        } else {
            elseTransform(self)
        }
    }

    /// Applies the given transform if the given condition evaluates to `true`.
    /// - Parameters:
    ///   - condition: The condition to evaluate.
    ///   - transform: The transform to apply to the source `View`.
    /// - Returns: Either the original `View` or the modified `View` if the condition is `true`.
    @ViewBuilder func `if`<Content: View>(
        _ condition: @autoclosure () -> Bool,
        transform: (Self) -> Content
    ) -> some View {
        if condition() {
            transform(self)
        } else {
            self
        }
    }
}

public extension Bool {
    static var navigationStackAvailable: Bool {
        if #available(iOS 17.0, watchOS 10.0, tvOS 17.0, macOS 14, *) {
            // It's iOS 13 so return true.
            return true
        }
        // It's iOS 14 so return false.
        return false
    }
}
