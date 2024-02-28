import Foundation

@objc public class ScreenTimeActivity: NSObject {
    @objc public func echo(_ value: String) -> String {
        print(value)
        return value
    }
}
