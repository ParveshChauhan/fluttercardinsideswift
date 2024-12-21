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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let flutterViewController = FlutterViewController(engine: FlutterManager.shared.flutterEngine, nibName: nil, bundle: nil)

                // Add the Flutter view to your view hierarchy
                addChild(flutterViewController)
                flutterViewController.view.frame = CGRect(x: 0, y: 0, width: 300, height: 200)
                Card2.addSubview(flutterViewController.view)
                flutterViewController.didMove(toParent: self)
        
        
        self.navigationItem.hidesBackButton = true
        let newBackButton = UIBarButtonItem(title: "Back", style: UIBarButtonItem.Style.plain, target: self, action: #selector(back))
        self.navigationItem.leftBarButtonItem = newBackButton
        
       
    }
    
    @objc func back(sender: UIBarButtonItem) {
        self.dismiss(animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        VWO.setScreenName(name: "swiftcard")
    }
    override func viewDidAppear(_ animated: Bool) {
    }

}
