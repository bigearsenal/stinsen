import SwiftUI

import Stinsen

struct StinsenApp: App {
    var body: some Scene {
        WindowGroup {
            MainCoordinator()
                .view()
        }
    }
}
