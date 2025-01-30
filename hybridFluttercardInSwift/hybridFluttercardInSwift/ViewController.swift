//
//  ViewController.swift
//  hybridFluttercardInSwift
//
//  Created by Parvesh Chauhan on 13/12/24.
//

import UIKit
import vwo_insights_ios_flutter_sdk
import Flutter

class ViewController: UIViewController {
    
    var isFlutter = false
    @IBOutlet weak var openVcButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
    }
    override func viewDidAppear(_ animated: Bool) {
        VWO.setScreenName(name:  "viewController",viewcontroller: self)
        
        if isFlutter {
            print("flutter is dismissed")
            FlutterManager.shared.flutterEngine.viewController = nil
            isFlutter = false
        }
    }
    
    @IBAction func openSwiftCard(_ sender: Any) {
       
    }
    
    @IBAction func GoTOFlutterScreen(_ sender: Any) {
        let flutterViewController = FlutterViewController(
                engine: FlutterManager.shared.flutterEngine,
                nibName: nil,
                bundle: nil
            )
        flutterViewController.modalPresentationStyle = .fullScreen

        let channel = FlutterMethodChannel(name: "com.example.flutter/arguments", binaryMessenger: flutterViewController.binaryMessenger)
            channel.invokeMethod("setScreen", arguments: "fullScreen") { result in
                if let error = result as? String {
                    print("Error setting screen: \(error)")
                }else{
                    print("Flutter screen \(String(describing: result))")

                    VWO.listenFlutterView(viewController:flutterViewController)
//                    self.present(flutterViewController, animated: true) {
//                        self.isFlutter = true
//                    }
                }
            }
        self.navigationController?.pushViewController(flutterViewController, animated: true)
        
        isFlutter = true
            // Present the Flutter screen
            
    }
}
