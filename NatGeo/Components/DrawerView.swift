//
//  DrawerView.swift
//  NatGeo
//
//  Created by Mohamed Saad on 26/06/2024.
//

import SwiftUI

struct DrawerView: View {

    @State var isDrawerOpen = false
    @Binding var coverIndex : Int
    
    var body: some View {
        HStack {
            Image(systemName: isDrawerOpen ? "chevron.compact.right" : "chevron.compact.left")
                .resizable()
                .scaledToFit()
                .frame(height: 40, alignment: .center)
                .padding(8)
                .padding(.leading, 8)
                .foregroundStyle(.secondary)
                .onTapGesture(perform: {
                    isDrawerOpen.toggle()
                })
            
            Spacer()
            ScrollView(.horizontal, showsIndicators: false){
                HStack {
                    ForEach(covers) { cover in
                        Image(cover.thumbName)
                            .resizable()
                            .scaledToFit()
                            .frame(height: 120, alignment: .center)
                            .padding(.horizontal, 2)
                            .onTapGesture {
                                coverIndex = cover.id
                            }
                    }
                }
                .padding(.vertical, 5)
//                .transition(.move(edge: .trailing))
            }
        }// HStack
        .frame(width: 260)
        .background(.thinMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
        .offset(x: isDrawerOpen ? 0 : 225)

    }
}

#Preview {
    DrawerView(coverIndex: .constant(1))
}
