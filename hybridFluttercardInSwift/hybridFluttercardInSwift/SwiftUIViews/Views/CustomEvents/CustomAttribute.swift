//
//  CustomAttribute.swift
//  WeatherAppSwiftUI
//
//  Created by Parvesh Chauhan on 06/01/25.
//

import Foundation

import SwiftUI
import vwo_insights_ios_flutter_sdk

struct CustomAttribute: View {
    var body: some View {
        NavigationView {
            List {
                // Button 1
                Button(action: functionOne) {
                    Text("Custom Event")
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .leading)
//                        .contentShape(Rectangle()) // Ensures entire row is tappable
                }
                
                // Button 2
                Button(action: functionTwo) {
                    Text("Custom Attribute")
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .leading)
//                        .contentShape(Rectangle())
                }
                
                // Button 3
                Button(action: functionCustomvariable) {
                    Text("Custom varibale")
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .leading)
//                        .contentShape(Rectangle())
                }
                
            }
            .vwoTagScreenName(screenName: "Custom Event list")
            .listStyle(InsetGroupedListStyle()) // Optional: Modern list style
            .navigationTitle("Custom Event List")
        }
    }
    
    // Function 1
    func functionOne() {
        print("Custom Event called")
        var dict = Dictionary<String, Any>()
        dict["name"] = "Par"
        dict["price"] = 99
        VWO.triggerCustomEvent(customEventName: "testswift", customData: dict)
    }
    
    // Function 2
    func functionTwo() {
        print("Custom Atrribute called")
        var dict = Dictionary<String, Any>()
        dict["apha"] = "ParAtt"
        dict["age"] = 25
        VWO.triggerSyncVisitorPropEvent(visitorData: dict)
        
    }
    
    // Function 3
    func functionCustomvariable() {
        print("Custom Varible set called")
        VWO.setCustomVariable(customVariable: ["iOS":"New"])
        
    }
    
}

struct ButtonListView_Previews: PreviewProvider {
    static var previews: some View {
        CustomAttribute()
    }
}
