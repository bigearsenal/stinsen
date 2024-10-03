import Foundation
import Stinsen
import SwiftUI

extension TestbedEnvironmentObjectCoordinator {
    @ViewBuilder nonisolated func makePushScreen() -> some View {
        MainActor.assumeIsolated {
            TestbedEnvironmentObjectScreen()
        }
    }

    @ViewBuilder nonisolated func makeModalScreen() -> some View {
//        if Bool.navigationStackAvailable {
//            SwiftUI.NavigationStack {
//                TestbedEnvironmentObjectScreen()
//            }
//        } else {
        SwiftUI.NavigationView {
            MainActor.assumeIsolated {
                TestbedEnvironmentObjectScreen()
            }
        }
//        }
    }

    nonisolated func makePushCoordinator() -> TestbedEnvironmentObjectCoordinator {
        MainActor.assumeIsolated {
            TestbedEnvironmentObjectCoordinator()
        }
    }

    nonisolated func makeModalCoordinator() -> NavigationViewCoordinator<TestbedEnvironmentObjectCoordinator> {
        MainActor.assumeIsolated {
            NavigationViewCoordinator(TestbedEnvironmentObjectCoordinator())
        }
    }

    @ViewBuilder nonisolated func makeStart() -> some View {
        MainActor.assumeIsolated {
            TestbedEnvironmentObjectScreen()
        }
    }
}
