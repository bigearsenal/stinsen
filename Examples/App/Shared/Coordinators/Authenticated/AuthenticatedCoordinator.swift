import Foundation
import Stinsen
import SwiftUI

final class AuthenticatedCoordinator: TabCoordinatable {
    var child = TabChild(
        startingItems: [
            \AuthenticatedCoordinator.home,
            \AuthenticatedCoordinator.todos,
            \AuthenticatedCoordinator.profile,
            \AuthenticatedCoordinator.testbed,
        ]
    )

    let todosStore: TodosStore
    let user: User

    @Route(tabItem: makeHomeTab) var home = makeHome
    @Route(tabItem: makeTodosTab) var todos = makeTodos
    @Route(tabItem: makeProfileTab) var profile = makeProfile
    @Route(tabItem: makeTestbedTab, onTapped: onTestbedTapped) var testbed = makeTestbed

    init(user: User) {
        todosStore = TodosStore(user: user)
        self.user = user
    }

    deinit {
        print("Deinit AuthenticatedCoordinator")
    }
}
