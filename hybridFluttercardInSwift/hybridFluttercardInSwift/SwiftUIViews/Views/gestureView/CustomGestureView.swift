//
//  CustomGestureView.swift
//  WeatherAppSwiftUI
//
//  Created by Parvesh Chauhan on 06/01/25.
//

import SwiftUI

struct CustomGestureView: View {
    @State private var scale: CGFloat = 1.0
    @State private var offset: CGSize = .zero
    @State private var isDoubleTapped = false
    
    var body: some View {
        NavigationView {
            VStack {
                // Background Color
//                Color.gray.opacity(0.2)
//                  .edgesIgnoringSafeArea(.all)
                
//                Circle()
//                    .fill(Color.red)
//                    .frame(width: 100, height: 100)
//                    .gesture(
//                        LongPressGesture(minimumDuration: 0.5)
//                            .onEnded { _ in
//                                print("Long press detected")
//                            }
//                    )
//                    
//                
//                Rectangle()
//                    .fill(Color.green)
//                    .contentShape(Rectangle())
//                    .frame(width: 200, height: 200)
//                    .highPriorityGesture(
//                        DragGesture()
//                            .onChanged { value in
//                                print("Dragging at: \(value.translation)")
//                            }
//                            .onEnded { value in
//                                print("Drag ended")
//                            }
//                    )
                
                // Interactive Content
                Image(systemName: "leaf.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
                    .foregroundColor(isDoubleTapped ? .green : .blue)
                    .scaleEffect(scale) // Pinch to Zoom
                    .offset(offset) // Drag Gesture
                    .gesture(
                        simultaneousGestures()
                    )
            }
            .vwoTagScreenName(screenName: "Gesture list")
            .navigationTitle("Gesture View")
        }
    }
    
    /// Combines multiple gestures
    private func simultaneousGestures() -> some Gesture {
        // Double Tap Gesture
        let doubleTapGesture = TapGesture(count: 2).onEnded {
            isDoubleTapped.toggle()
        }
        
        // Drag Gesture
        let dragGesture = DragGesture()
            .onChanged { value in
                offset = value.translation
            }
            .onEnded { _ in
                // Optional: Add behavior when drag ends
            }
        
        // Magnification (Zoom) Gesture
        let magnificationGesture = MagnificationGesture()
            .onChanged { value in
                scale = value
            }
            .onEnded { _ in
                // Optional: Reset scale or set limits
                scale = max(1.0, scale) // Prevent zoom-out beyond original size
            }
        
        // Combine gestures
        return SimultaneousGesture(
            doubleTapGesture,
            SimultaneousGesture(dragGesture, magnificationGesture)
        )
    }
}

struct GestureView_Previews: PreviewProvider {
    static var previews: some View {
        CustomGestureView()
    }
}

