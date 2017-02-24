import UIKit
import Apollo

// Change localhost to your machine's local IP address when running from a device
let apollo = ApolloClient(url: URL(string: "http://localhost:8080/graphql")!)

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
  var window: UIWindow?

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
    apollo.cacheKeyForObject = { obj in
      guard let typeName = obj["__typename"], let id = obj["id"] else {
        return nil
      }
      return "\(String(describing: typeName))_\(String(describing: id))"
    }
    return true
  }
}
