import Foundation

class LoginService {
    func login(username: String, password _: String, callback: (() -> Void)?) {
        DispatchQueue.main.async {
            AuthenticationService.shared.status = .authenticated(
                User(
                    username: username,
                    accessToken: UUID().uuidString
                )
            )
            callback?()
        }
    }
}
