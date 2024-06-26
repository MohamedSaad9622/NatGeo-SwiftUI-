//
//  PannerView.swift
//  NatGeo
//
//  Created by Mohamed Saad on 26/06/2024.
//

import SwiftUI

struct PannelView: View {
    
    @State var isPannelDisplayed  = false
    var scale: CGFloat
    var offset: CGSize
    
    var body: some View {
        HStack{
           
            Image(systemName: "circle.circle")
                .symbolRenderingMode(.hierarchical)
                .resizable()
                .frame(width: 30, height: 30, alignment: .center)
                .onLongPressGesture {
                    isPannelDisplayed.toggle()
                }
            
            Spacer()
            
            HStack {
                Image(systemName: "arrow.up.left.and.arrow.down.right")
                Text("\(scale)")
                Spacer()
                
                Image(systemName: "arrow.left.and.right")
                Text("\(offset.width)")
                Spacer()
                
                Image(systemName: "arrow.up.and.down")
                Text("\(offset.height)")
            }
            .padding(8)
            .background(.ultraThinMaterial)
            .font(.footnote)
            .frame(minWidth: 30, maxWidth: 420, alignment: .center)
            .opacity(isPannelDisplayed ? 1 : 0)
            .clipShape(RoundedRectangle(cornerRadius: 7, style: .continuous) )
        }
        
    }
}

#Preview {
    PannelView(scale: 1, offset: .zero)
        .preferredColorScheme(.dark)
}
