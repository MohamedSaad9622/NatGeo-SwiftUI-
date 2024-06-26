//
//  ContentView.swift
//  NatGeo
//
//  Created by Mohamed Saad on 25/06/2024.
//

import SwiftUI

struct ContentView: View {
    
    @State var imageScale: CGFloat = 1
    @State var imageOffset: CGSize = .zero
    @State var coverIndex: Int = 0
    
    var body: some View {
        
        Image(covers[coverIndex].name)
            .resizable()
            .scaledToFit()
            .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
            .scaleEffect(imageScale)
            .offset(x: imageOffset.width, y: imageOffset.height)
            .shadow(color: .black, radius: 8, x: 3, y: 3)
            .padding()
        
        // MARK: - Tap Gesture
            .onTapGesture(count: 2, perform: {
                withAnimation(.spring) {
                    if imageScale == 1 {
                        imageScale  =  5
                    }else{
                        imageScale  =  1
                        imageOffset = .zero
                    }
                }
            })
        
        // MARK: - Drag Gesture
            .gesture(DragGesture()
                .onChanged({ gesture in
                    imageOffset = gesture.translation
                })
                    .onEnded({ _ in
                        withAnimation(.easeInOut) {
                            if imageScale <= 1 {
                                imageOffset = .zero
                            }
                        }
                    })
            )
        
        // MARK: -  Magnification Gesture
        
            .gesture(MagnifyGesture()
                .onChanged({ value in
                    withAnimation(.spring) {
                        if value.velocity >= 1 && value.velocity <= 5 {
                            imageScale = value.velocity
                        }else if value.velocity > 5 {
                            imageScale = 5
                        }else if value.velocity < 1 {
                            imageScale = 1
                        }
                    }
                })
                     
                    .onEnded({ value in
                        withAnimation(.spring) {
                            if imageScale > 5 {
                                imageScale = 5
                            }else if imageScale < 1 {
                                imageScale = 1
                            }
                        }
                    })
            )
        
            //  Drawer
            .overlay(alignment: .topTrailing) {
                DrawerView(coverIndex: $coverIndex)
                    .padding(.top)
            }
        
            // Controller View
            .overlay(alignment: .bottom) {
                ControllerView(scale: $imageScale, offset: $imageOffset)
            }
        
        // Pannel View
            .overlay(alignment: .top) {
                PannelView(scale: imageScale, offset: imageOffset)
                    .padding()
                    .offset(y: -50)
            }
    }
}

#Preview {
    ContentView()
}
