import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?
  ) -> Bool {
//    #if DEBUG
      var newArguments = ProcessInfo.processInfo.arguments
      newArguments.append("-FIRDebugEnabled")
      ProcessInfo.processInfo.setValue(newArguments, forKey: "arguments")
      CommandLine.arguments = newArguments
//    #endif
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
