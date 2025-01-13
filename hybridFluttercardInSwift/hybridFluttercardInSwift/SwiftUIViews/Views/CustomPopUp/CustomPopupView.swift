//
//  CustomPopupView.swift
//  WeatherAppSwiftUI
//
//  Created by Parvesh Chauhan on 06/01/25.
//

import Foundation

import SwiftUI

struct CustomPopupView: View {
    @State private var showPopup: Bool = false // State to control popup visibility
    @State private var alretPopup: Bool = false
    var body: some View {
        NavigationView {
            VStack {
                // Button to Show Popup
                Button(action: {
                    showPopup = true
                }) {
                    Text("Show Popup")
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                
                Button(action: {
                    alretPopup = true
                }) {
                    Text("Show Alert Popup")
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                .alert(isPresented: $alretPopup) {
                    Alert(
                        title: Text("Alert"),
                        message: Text("This is an alert popup."),
                        dismissButton: .default(Text("OK"))
                    )
                }
            }
            .vwoTagScreenName(screenName: "Custom PopUp")
            .navigationTitle("Popup Example")
            .overlay(
                // Conditional Popup View
                Group {
                    if showPopup {
                        ZStack {
                            // Background overlay
                            Color.black.opacity(0.5)
                                .edgesIgnoringSafeArea(.all)
                                .onTapGesture {
                                    // Close popup when tapping outside
                                    showPopup = false
                                }
                            
                            // Popup content
                            VStack(spacing: 20) {
                                Text("This is a Popup")
                                    .font(.headline)
                                Text("You can add any content here.")
                                    .multilineTextAlignment(.center)
                                
                                Button(action: {
                                    showPopup = false // Dismiss the popup
                                }) {
                                    Text("Close")
                                        .padding()
                                        .foregroundColor(.white)
                                        .background(Color.red)
                                        .cornerRadius(10)
                                }
                            }
                            .padding()
                            .frame(maxWidth: 500)
                            .background(Color.white)
                            .cornerRadius(20)
                            .shadow(radius: 15)
                        }
                    }
                    
                }
            )
        }
    }
}

struct PopupView_Previews: PreviewProvider {
    static var previews: some View {
        CustomPopupView()
    }
}
