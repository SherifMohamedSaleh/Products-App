import UIKit
 
func resignKeyboard() {
    UIApplication.shared.endEditing()
}

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}



