import Foundation

class UnauthenticatedServices: ObservableObject {
    var userRegistration: UserRegistrationService = .init()
    var forgotPassword: ForgotPasswordService = .init()
    var login: LoginService = .init()

    init() {}
}
