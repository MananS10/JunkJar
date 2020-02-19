import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
    [GMSServices provideAPIKey: @"AIzaSyAFAYNGs9G2Egh9gkmlzQTNBxbv7HoseFA"];
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
