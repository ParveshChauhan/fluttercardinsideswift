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
        // Do any additional setup after loading the view.
        
        
    }

    override func viewDidAppear(_ animated: Bool) {
        VWO.hideView(view: openVcButton)
    }

}

