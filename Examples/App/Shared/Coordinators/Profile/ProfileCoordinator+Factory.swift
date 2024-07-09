import Foundation
import Stinsen
import SwiftUI

extension ProfileCoordinator {
    @ViewBuilder func makeStart() -> some View {
        ProfileScreen(user: user)
    }
}
