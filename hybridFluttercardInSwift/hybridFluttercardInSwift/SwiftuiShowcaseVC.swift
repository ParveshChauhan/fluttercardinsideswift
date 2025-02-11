//
//  SwiftuiShowcaseVC.swift
//  hybridFluttercardInSwift
//
//  Created by Parvesh Chauhan on 10/01/25.
//

import UIKit
import SwiftUI
import vwo_insights_ios_flutter_sdk

class SwiftuiShowcaseVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

//        self.navigationItem.hidesBackButton = true
//        let newBackButton = UIBarButtonItem(title: "Back", style: UIBarButtonItem.Style.plain, target: self, action: #selector(back))
//        self.navigationItem.leftBarButtonItem = newBackButton
            // Do any additional setup after loading the view.
        }
    
//    @objc func back(sender: UIBarButtonItem) {
//        self.dismiss(animated: true)
//    }
    
        override func viewDidAppear(_ animated: Bool) {
//            VWO.setScreenName(name: "firstViewcontoller",viewcontroller: self)
        }
        
        @IBAction func openSwiftUI(_ sender: Any) {
            
            let swiftUIView = MainView() // swiftUIView is View
            let hostingController = UIHostingController(rootView: swiftUIView)
            navigationController?.pushViewController(hostingController, animated: true)
    //        present(hostingController, animated: true, completion: nil)
        }
        
        @IBAction func openList(_ sender: Any) {
            let swiftUIView = GroceryListView() // swiftUIView is View
            let hostingController = UIHostingController(rootView: swiftUIView)
            navigationController?.pushViewController(hostingController, animated: true)
        }
        
        @IBAction func openComponent(_ sender: Any) {
            let swiftUIView = CustomComponentView() // swiftUIView is View
            let hostingController = UIHostingController(rootView: swiftUIView)
            navigationController?.pushViewController(hostingController, animated: true)
        }
        
        @IBAction func openCustomGesture(_ sender: Any) {
            let swiftUIView = CustomGestureView() // swiftUIView is View
            let hostingController = UIHostingController(rootView: swiftUIView)
            navigationController?.pushViewController(hostingController, animated: true)
        }
        
        @IBAction func openCustomEvent(_ sender: Any) {
            let swiftUIView = CustomAttribute() // swiftUIView is View
            let hostingController = UIHostingController(rootView: swiftUIView)
            navigationController?.pushViewController(hostingController, animated: true)
        }
        
        @IBAction func openCustomPopUp(_ sender: Any) {
            let swiftUIView = CustomPopupView() // swiftUIView is View
            let hostingController = UIHostingController(rootView: swiftUIView)
            navigationController?.pushViewController(hostingController, animated: true)
        }
        
        @IBAction func openCrashAnr(_ sender: Any) {
            let swiftUIView = CrashAnrView() // swiftUIView is View
            let hostingController = UIHostingController(rootView: swiftUIView)
            navigationController?.pushViewController(hostingController, animated: true)
        }
    }
