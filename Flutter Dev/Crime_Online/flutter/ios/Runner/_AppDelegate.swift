import UIKit
import Flutter
import flutter_downloader
import MLKit

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    
    let controller : FlutterViewController = window?.rootViewController as! FlutterViewController
    let googleMlChannel = FlutterMethodChannel(name: "th.go.police.crimes/google_ml",
                                                  binaryMessenger: controller.binaryMessenger)
    googleMlChannel.setMethodCallHandler({
        [weak self] (call: FlutterMethodCall, result: @escaping FlutterResult) -> Void in
        // Note: this method is invoked on the UI thread.
        guard call.method == "processImage" else {
            result(FlutterMethodNotImplemented)
            return
        }
        
        // TODO: Receive map parameter
        guard let args = call.arguments as? Dictionary<String, Any> else {
            result("call.arguments not Dictionary")
            return
        }
        
        guard let base64 = args["base64"] as? String else {
            result("args base64 not String")
            return
        }
        
        //TODO: Convert string base64 to UIImage
        let dataDecoded = Data(base64Encoded: base64, options: .ignoreUnknownCharacters)
        let image = UIImage(data: dataDecoded!, scale: 1.0)
        self?.detectTextOnDevice(image: image, result: result)
        
//        guard let byteData = args["bytes"] as? FlutterStandardTypedData else {
//            result("args bytes not FlutterStandardTypedData")
//            return
//        }
//
//        let imageBytes:NSData = byteData.data as NSData
//        guard imageBytes.isEmpty else {
//            result("imageBytes == null")
//            return
//        }
//
//        let image:UIImage = UIImage(data: imageBytes as Data)!
//        self?.detectTextOnDevice(image: image, result: result)
    })
    
    GeneratedPluginRegistrant.register(with: self)
    FlutterDownloaderPlugin.setPluginRegistrantCallback(registerPlugins)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
    
    
  func detectTextOnDevice(image: UIImage?, result: @escaping FlutterResult) {
      guard let image = image else {
        result("guard image == null")
        return
      }

      // [START init_text]
      let onDeviceTextRecognizer = TextRecognizer.textRecognizer()
      // [END init_text]

      // Initialize a VisionImage object with the given UIImage.
      let visionImage = VisionImage(image: image)
      visionImage.orientation = image.imageOrientation

      process(visionImage, with: onDeviceTextRecognizer, result: result)
  }

  private func process(_ visionImage: VisionImage, with textRecognizer: TextRecognizer?, result: @escaping FlutterResult) {
      weak var weakSelf = self
      textRecognizer?.process(visionImage) { text, error in
        guard weakSelf != nil else {
          result("Self is nil!")
          return
        }
        guard error == nil, let text = text else {
//          let errorString = error?.localizedDescription ?? Constants.detectionNoResultsMessage
//          strongSelf.resultsText = "Text recognizer failed with error: \(errorString)"
//          strongSelf.showResults()
          result("Detection No Result")
          return
        }
        
        result(String(text.text))
        
        // Blocks.
    //        for block in text.blocks {
    //          let transformedRect = block.frame.applying(strongSelf.transformMatrix())
    //          UIUtilities.addRectangle(
    //            transformedRect,
    //            to: strongSelf.annotationOverlayView,
    //            color: UIColor.purple
    //          )

          // Lines.
    //          for line in block.lines {
    //            let transformedRect = line.frame.applying(strongSelf.transformMatrix())
    //            UIUtilities.addRectangle(
    //              transformedRect,
    //              to: strongSelf.annotationOverlayView,
    //              color: UIColor.orange
    //            )

            // Elements.
    //            for element in line.elements {
    //              let transformedRect = element.frame.applying(strongSelf.transformMatrix())
    //              UIUtilities.addRectangle(
    //                transformedRect,
    //                to: strongSelf.annotationOverlayView,
    //                color: UIColor.green
    //              )
    //              let label = UILabel(frame: transformedRect)
    //              label.text = element.text
    //              label.adjustsFontSizeToFitWidth = true
    //              strongSelf.annotationOverlayView.addSubview(label)
    //            }
    //          }
    //        }
    //        strongSelf.resultsText += "\(text.text)\n"
    //        strongSelf.showResults()
      }
  }


}

private func registerPlugins(registry: FlutterPluginRegistry) { 
    if (!registry.hasPlugin("FlutterDownloaderPlugin")) {
       FlutterDownloaderPlugin.register(with: registry.registrar(forPlugin: "FlutterDownloaderPlugin")!)
    }
}

