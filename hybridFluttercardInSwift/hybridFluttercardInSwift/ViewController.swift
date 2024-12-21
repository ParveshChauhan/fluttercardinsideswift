//
//  ViewController.swift
//  hybridFluttercardInSwift
//
//  Created by Parvesh Chauhan on 13/12/24.
//

import UIKit
import vwo_insights_ios_flutter_sdk

class ViewController: UIViewController {
    
    @IBOutlet weak var openVcButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        VWO.setScreenName(name: "viewController")
    }
    override func viewDidAppear(_ animated: Bool) {
    }
    
    @IBAction func openSwiftCard(_ sender: Any) {
       
    }
    
}
