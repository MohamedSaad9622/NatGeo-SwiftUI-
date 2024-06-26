//
//  ControllerView.swift
//  NatGeo
//
//  Created by Mohamed Saad on 26/06/2024.
//

import SwiftUI

struct ControllerView: View {
    
    @Binding var scale: CGFloat
    @Binding var offset: CGSize
    
    var body: some View {
        HStack{
            Button(action: {
                if scale > 1 {
                    scale -= 1
                }
            }, label: {
                Image(systemName: "minus.magnifyingglass")
            })
            
            Button(action: {
                scale = 1
                offset = .zero
            }, label: {
                Image(systemName: "arrow.up.left.and.down.right.magnifyingglass")
            })
            
            Button(action: {
                if scale < 5 {
                   scale += 1
                }
            }, label: {
                Image(systemName: "plus.magnifyingglass")
            })
        }
        .padding(.vertical, 5)
        .padding(.horizontal, 15)
        .foregroundStyle(.white)
        .background(.ultraThinMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
        .font(.largeTitle)
        
    }
}

#Preview {
    ControllerView(scale: .constant(1), offset: .constant(.zero))
}
