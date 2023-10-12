import Combine
import Foundation
import SwiftUI

final class PresentationHelper<T: NavigationCoordinatable>: ObservableObject {
    private let id: Int
    let navigationStack: NavigationStack<T>
    private var cancellables = Set<AnyCancellable>()

    @Published var presented: Presented?

    func setupPresented(coordinator: T) {
        let value = navigationStack.value

        let nextId = id + 1

        // Only apply updates on last screen in navigation stack
        // This check is important to get the behaviour as using a bool-state in the view that you set
        if value.count - 1 == nextId, presented == nil {
            if let value = value[safe: nextId] {
                let presentable = value.presentable
                switch value.presentationType {
                case .modal, .sheet:
                    if presentable is AnyView {
                        var view = AnyView(NavigationCoordinatableView(id: nextId, coordinator: coordinator))

                        #if os(macOS)
                            presented = Presented(
                                view: AnyView(
                                    NavigationView(
                                        content: {
                                            view
                                        }
                                    )
                                ),
                                type: value.presentationType
                            )
                        #else
                            view = AnyView(
                                NavigationView(
                                    content: {
                                        view.navigationBarHidden(true)
                                    }
                                )
                                .navigationViewStyle(StackNavigationViewStyle())
                            )
                            if let detents = value.presentationType.presentationDetents {
                                view = AnyView(view.presentationDetents(detents))
                            }
                            presented = Presented(
                                view: view,
                                type: value.presentationType
                            )
                        #endif
                    } else {
                        presented = Presented(
                            view: presentable.view(),
                            type: value.presentationType
                        )
                    }
                case .push:
                    if presentable is AnyView {
                        let view = AnyView(NavigationCoordinatableView(id: nextId, coordinator: coordinator))

                        presented = Presented(
                            view: view,
                            type: .push
                        )
                    } else {
                        presented = Presented(
                            view: presentable.view(),
                            type: .push
                        )
                    }
                case .fullScreen:
                    if presentable is AnyView {
                        let view = AnyView(NavigationCoordinatableView(id: nextId, coordinator: coordinator))

                        #if os(macOS)
                            presented = Presented(
                                view: AnyView(
                                    NavigationView(
                                        content: {
                                            view
                                        }
                                    )
                                ),
                                type: .fullScreen
                            )
                        #else
                            presented = Presented(
                                view: AnyView(
                                    NavigationView(
                                        content: {
                                            #if os(macOS)
                                                view
                                            #else
                                                view.navigationBarHidden(true)
                                            #endif
                                        }
                                    )
                                    .navigationViewStyle(StackNavigationViewStyle())
                                ),
                                type: .fullScreen
                            )
                        #endif
                    } else {
                        presented = Presented(
                            view: AnyView(
                                presentable.view()
                            ),
                            type: .fullScreen
                        )
                    }
                }
            }
        }
    }

    init(id: Int, coordinator: T) {
        self.id = id
        navigationStack = coordinator.stack

        setupPresented(coordinator: coordinator)

        navigationStack.$value.dropFirst().sink { [weak self, coordinator] _ in
            DispatchQueue.main.async { [weak self] in
                guard let self = self else { return }

                self.setupPresented(coordinator: coordinator)
            }
        }
        .store(in: &cancellables)

        navigationStack.poppedTo.filter { int -> Bool in int <= id }.sink { [weak self] _ in
            // remove any and all presented views if my id is less than or equal to the view being popped to!
            DispatchQueue.main.async { [weak self] in
                self?.presented = nil
            }
        }
        .store(in: &cancellables)
    }
}
