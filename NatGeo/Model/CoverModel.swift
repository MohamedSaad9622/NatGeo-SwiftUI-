//
//  CoverModel.swift
//  NatGeo
//
//  Created by Mohamed Saad on 26/06/2024.
//

import Foundation

struct CoverModel: Identifiable {
    var id: Int
    var name: String
    var thumbName: String {
        return "thumb-\(name)"
    }
}
