import Foundation
import Stinsen
import SwiftUI

extension TodosCoordinator {
    @ViewBuilder nonisolated func makeTodo(todoId: UUID) -> some View {
        MainActor.assumeIsolated {
            TodoScreen(todosStore: todosStore, todoId: todoId)
        }
    }

    @ViewBuilder nonisolated func makeCreateTodo() -> some View {
        MainActor.assumeIsolated {
            CreateTodoScreen(todosStore: todosStore)
        }
    }

    @ViewBuilder nonisolated func makeStart() -> some View {
        MainActor.assumeIsolated {
            TodosScreen(todosStore: todosStore)
        }
    }
}
