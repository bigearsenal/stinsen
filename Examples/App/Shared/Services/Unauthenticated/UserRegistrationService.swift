import Foundation

class UserRegistrationService {
    func register(username _: String, password _: String, callback: (() -> Void)?) {
        DispatchQueue.main.async {
            callback?()
        }
    }
}
