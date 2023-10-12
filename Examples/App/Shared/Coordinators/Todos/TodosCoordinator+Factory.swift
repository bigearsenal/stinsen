import Foundation
import Stinsen
import SwiftUI

extension TodosCoordinator {
    @ViewBuilder func makeTodo(todoId: UUID) -> some View {
        TodoScreen(todosStore: todosStore, todoId: todoId)
    }

    @ViewBuilder func makeCreateTodo() -> some View {
        CreateTodoScreen(todosStore: todosStore)
    }

    @ViewBuilder func makeStart() -> some View {
        TodosScreen(todosStore: todosStore)
    }
}
