import Foundation
import Stinsen
import SwiftUI

struct TestbedEnvironmentObjectScreen: View {
    @EnvironmentObject var testbed: TestbedEnvironmentObjectCoordinator.Router
    @State var text: String = ""

    var body: some View {
        ScrollView {
            VStack {
                Text("Number in coordinator stack: " + String(testbed.id))
                TextField("Textfield", text: $text)
                RoundedButton("Modal screen") {
                    testbed.route(to: \.modalScreen)
                }
                RoundedButton("Push screen") {
                    testbed.route(to: \.pushScreen)
                }
                /*
                 RoundedButton("Cover screen") {
                    testbed.route(to: .coverScreen)
                 }
                  */
                RoundedButton("Modal coordinator") {
                    testbed.route(to: \.modalCoordinator)
                }
                RoundedButton("Push coordinator") {
                    testbed.route(to: \.pushCoordinator)
                }
                /*
                 RoundedButton("Cover coordinator") {
                    testbed.route(to: .coverCoordinator)
                 }
                  */
                RoundedButton("Dismiss me!") {
                    testbed.dismissCoordinator {
                        print("bye!")
                    }
                }
            }
        }
    }
}
