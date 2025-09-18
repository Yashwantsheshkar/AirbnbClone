//
//  MaterialDeliveryModel.swift
//  AirbnbClone
//
//  Created by Yashwant Sheshkar on 18/09/25.
//

import Foundation

struct MaterialItem: Identifiable {
    let id = UUID()
    let mediaurls: [String]
    let materialType: String
    let quantity: String
    let brandAndGrade: String
}

struct MaterialDeliveryDay: Identifiable {
    let id = UUID()
    let date: String
    let itemCount: String
    var material: [MaterialItem]
}
