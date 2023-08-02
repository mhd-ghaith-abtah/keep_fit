import UIKit
import Flutter
import flutter_uploader
import flutter_local_notifications

func registerBackgroundUploaderPlugin(registry: FlutterPluginRegistry) {
    GeneratedPluginRegistrant.register(with: registry)
}

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
    SwiftFlutterUploaderPlugin.registerPlugins = registerBackgroundUploaderPlugin
        FlutterLocalNotificationsPlugin.setPluginRegistrantCallback { (registry) in
                GeneratedPluginRegistrant.register(with: registry)
              }
            if #available(iOS 10.0, *) {
                      UNUserNotificationCenter.current().delegate = self as UNUserNotificationCenterDelegate
                    }
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
