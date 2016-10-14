import UIKit
import Apollo

// Change localhost to your machine's local IP address when running from a device
let apollo = ApolloClient(url: URL(string: "http://192.168.2.22:8080/graphql")!)

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
  var window: UIWindow?

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
    return true
  }
}
