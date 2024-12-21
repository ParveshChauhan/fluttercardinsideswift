//
//  FlutterManager.swift
//  hybridFluttercardInSwift
//
//  Created by Parvesh Chauhan on 13/12/24.
//

import Flutter
import FlutterPluginRegistrant

class FlutterManager {
    static let shared = FlutterManager()
    let flutterEngine = FlutterEngine(name: "my flutter engine")

    private init() {
        flutterEngine.run()
         GeneratedPluginRegistrant.register(with: flutterEngine)
    }
}
