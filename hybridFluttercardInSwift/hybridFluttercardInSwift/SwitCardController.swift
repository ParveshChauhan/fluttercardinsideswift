//
//  SwitCardController.swift
//  hybridFluttercardInSwift
//
//  Created by Parvesh Chauhan on 13/12/24.
//

import UIKit
import Flutter
import vwo_insights_ios_flutter_sdk

class SwiftCardController: UIViewController {
    @IBOutlet weak var Card1: UIView!
    @IBOutlet weak var Card2: UIView!
    @IBOutlet weak var Card3: UIView!
    @IBOutlet weak var Card4: UIView!
    var flutterViewController : FlutterViewController?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
         flutterViewController = FlutterViewController(engine: FlutterManager.shared.flutterEngine, nibName: nil, bundle: nil)
//
//        if let flutterViewController = flutterViewController{
//            // Add the Flutter view to your view hierarchy
//            addChild(flutterViewController)
//            flutterViewController.view.frame = CGRect(x: 0, y: 0, width: 300, height: 200)
//            Card2.addSubview(flutterViewController.view)
//            flutterViewController.didMove(toParent: self)
//        }
        
        if let flutterViewController = flutterViewController {
            // Use a MethodChannel to specify "card" as the screen type
            let channel = FlutterMethodChannel(name: "com.example.flutter/arguments", binaryMessenger: flutterViewController.binaryMessenger)
            channel.invokeMethod("setScreen", arguments: "card") { result in
                if let error = result as? String {
                    print("Error setting screen: \(error)")
                }
            }

            // Add the Flutter view to your view hierarchy
            addChild(flutterViewController)
            flutterViewController.view.frame = CGRect(x: 0, y: 0, width: 350, height: 200)
            Card2.addSubview(flutterViewController.view)
            flutterViewController.didMove(toParent: self)
        }
        
        
        self.navigationItem.hidesBackButton = true
        let newBackButton = UIBarButtonItem(title: "Back", style: UIBarButtonItem.Style.plain, target: self, action: #selector(back))
        self.navigationItem.leftBarButtonItem = newBackButton
        
       
    }
    
    @objc func back(sender: UIBarButtonItem) {
        self.dismiss(animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    override func viewDidAppear(_ animated: Bool) {
    }
    override func viewWillDisappear(_ animated: Bool) {
//        flutterViewController = nil
        FlutterManager.shared.flutterEngine.viewController = nil
    }

}
