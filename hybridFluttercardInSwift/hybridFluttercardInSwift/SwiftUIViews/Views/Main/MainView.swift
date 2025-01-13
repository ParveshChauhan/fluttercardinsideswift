//
//  MainView.swift
//  WeatherAppSwiftUI
//
//  Created by Evren Yaşar on 3.01.2020.
//  Copyright © 2020 Evren Yaşar. All rights reserved.
//

import SwiftUI
import vwo_insights_ios_flutter_sdk

struct MainView: View {
    
    private var viewModel = MainViewVM()
    @State var inputText: String = ""
    @State var showingDayList = false
    
    
    var body: some View {
//        NavigationView {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [.topColor,.centerColor,.bottomColor]),
                               startPoint: .topLeading,
                               endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
                VStack(alignment: .center, spacing: 140){
                    Text("Weather App")
                        .foregroundColor(Color.white)
                        .font(Font.system(size: 50))
//                        .VWOhideView()
                    
                    HStack {
                        TextField("What is weather in Istanbul?", text: $inputText)
                            .frame(width: 360, height: 40, alignment:.center)
                            .fixedSize()
                            .background(Color.white)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                        
                        NavigationLink(destination: DayList()) {
                                                   Image(systemName: "magnifyingglass")
                                                       .font(.largeTitle)
                                                       .foregroundColor(.white)
                                               }
//                        Button(action: {
//                            self.showingDayList.toggle()
//                        }) {
//                            Image(systemName: "magnifyingglass")
//                                .font(.largeTitle)
//                                .foregroundColor(.white)
//                        }
                    }
                    
                    
                    Spacer()
                }
                
                .padding(.top, 150.0)
                .vwoTagScreenName(screenName : "main View")
                
            } 
            .navigationBarHidden(false)
//                .fullScreenCover(isPresented: $showingDayList, content: {
//                    DayList()
//                })
//            .sheet(isPresented: $showingDayList) {
//                DayList()
//            }
//        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

extension Color {
    static let topColor = Color(red: 146/255, green: 78/255, blue: 163/255)
    static let centerColor = Color(red: 64/255, green: 49/255, blue: 140/255)
    static let bottomColor = Color(red: 40/255, green: 30/255, blue: 90/255)
}

extension Date {
    func formatter(_ format:String) -> String {
        let dateFormat = DateFormatter()
        dateFormat.dateFormat = format
        return dateFormat.string(from: self)
    }
}
