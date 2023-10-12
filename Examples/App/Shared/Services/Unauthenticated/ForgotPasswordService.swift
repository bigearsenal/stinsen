import Foundation

class ForgotPasswordService {
    func forgot(username _: String, callback: (() -> Void)?) {
        DispatchQueue.main.async {
            callback?()
        }
    }
}
