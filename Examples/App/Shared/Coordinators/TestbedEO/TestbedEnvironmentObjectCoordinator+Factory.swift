import Foundation
import Stinsen
import SwiftUI

extension TestbedEnvironmentObjectCoordinator {
    @ViewBuilder func makePushScreen() -> some View {
        TestbedEnvironmentObjectScreen()
    }

    @ViewBuilder func makeModalScreen() -> some View {
//        if Bool.navigationStackAvailable {
//            SwiftUI.NavigationStack {
//                TestbedEnvironmentObjectScreen()
//            }
//        } else {
        SwiftUI.NavigationView {
            TestbedEnvironmentObjectScreen()
        }
//        }
    }

    func makePushCoordinator() -> TestbedEnvironmentObjectCoordinator {
        TestbedEnvironmentObjectCoordinator()
    }

    func makeModalCoordinator() -> NavigationViewCoordinator<TestbedEnvironmentObjectCoordinator> {
        NavigationViewCoordinator(TestbedEnvironmentObjectCoordinator())
    }

    @ViewBuilder func makeStart() -> some View {
        TestbedEnvironmentObjectScreen()
    }
}
