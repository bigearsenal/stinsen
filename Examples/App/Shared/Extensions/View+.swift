import SwiftUI

extension View {
    @ViewBuilder
    func navigationTitle(with title: String) -> some View {
        #if os(macOS)
            navigationTitle(title)
        #else
            navigationBarTitle(title)
        #endif
    }
}
