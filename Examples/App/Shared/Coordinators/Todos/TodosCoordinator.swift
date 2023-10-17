import Foundation
import Stinsen
import SwiftUI

final class TodosCoordinator: NavigationCoordinatable {
    let stack = NavigationStack(initial: \TodosCoordinator.start)

    @Root var start = makeStart
    @Route(.push) var todo = makeTodo
    @Route(.fullScreen) var createTodo = makeCreateTodo

    let todosStore: TodosStore

    init(todosStore: TodosStore) {
        self.todosStore = todosStore
    }

    deinit {
        print("Deinit TodosCoordinator")
    }
}
