import Foundation
import Stinsen
import SwiftUI

extension AuthenticatedCoordinator {
    nonisolated func makeTestbed() -> NavigationViewCoordinator<TestbedEnvironmentObjectCoordinator> {
        MainActor.assumeIsolated {
            NavigationViewCoordinator(TestbedEnvironmentObjectCoordinator())
        }
    }

    @ViewBuilder nonisolated func makeTestbedTab(isActive: Bool) -> some View {
        Image(systemName: "bed.double" + (isActive ? ".fill" : ""))
        Text("Testbed")
    }

    nonisolated func onTestbedTapped(_ isRepeat: Bool,
                                     coordinator: NavigationViewCoordinator<TestbedEnvironmentObjectCoordinator>)
    {
        MainActor.assumeIsolated {
            if isRepeat {
                coordinator.child.popToRoot()
            }
        }
    }

    nonisolated func makeHome() -> HomeCoordinator {
        MainActor.assumeIsolated {
            HomeCoordinator(todosStore: todosStore)
        }
    }

    @ViewBuilder nonisolated func makeHomeTab(isActive: Bool) -> some View {
        Image(systemName: "house" + (isActive ? ".fill" : ""))
        Text("Home")
    }

    nonisolated func makeTodos() -> NavigationViewCoordinator<TodosCoordinator> {
        MainActor.assumeIsolated {
            NavigationViewCoordinator(TodosCoordinator(todosStore: todosStore))
        }
    }

    @ViewBuilder nonisolated func makeTodosTab(isActive: Bool) -> some View {
        Image(systemName: "folder" + (isActive ? ".fill" : ""))
        Text("Todos")
    }

    nonisolated func makeProfile() -> NavigationViewCoordinator<ProfileCoordinator> {
        MainActor.assumeIsolated {
            NavigationViewCoordinator(ProfileCoordinator(user: user))
        }
    }

    @ViewBuilder nonisolated func makeProfileTab(isActive: Bool) -> some View {
        Image(systemName: "person.crop.circle" + (isActive ? ".fill" : ""))
        Text("Profile")
    }
}
