//
//  CrashAnrView.swift
//  WeatherAppSwiftUI
//
//  Created by Parvesh Chauhan on 06/01/25.
//

import Foundation
import SwiftUI

struct CrashAnrView: View {
    var body: some View {
        NavigationView {
            VStack {
                Button("Crash") {
                    let exception = NSException(name: NSExceptionName(rawValue: "arbitrary"), reason: "arbitrary reason", userInfo: nil)
                    exception.raise()
                }
                
                .padding()
                
                Button("ANR") {
                    while(true){
                        //just ANR
                    }
                }
            }
            }
            .vwoTagScreenName(screenName: "Custom Crash ANR")
            .navigationTitle("Popup Example")
            
                    
            }
            
        
    }

struct CrashAnrView_Previews: PreviewProvider {
    static var previews: some View {
        CrashAnrView()
    }
}
