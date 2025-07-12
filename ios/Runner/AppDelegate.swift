import Flutter
import UIKit
import Foundation

@main
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}

// A helper function or class to get the key
struct Secrets {
    static var googleApiKey: String {
        guard let key = Bundle.main.object(forInfoDictionaryKey: "GoogleApiKey") as? String else {
            fatalError("Could not find GoogleApiKey in Info.plist")
        }
        return key
    }
}

// How to use it in your app
let apiKey = Secrets.googleApiKey
// Now you can use the apiKey variable wherever you need it