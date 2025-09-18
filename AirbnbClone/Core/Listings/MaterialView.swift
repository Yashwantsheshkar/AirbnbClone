//
//  MaterialView.swift
//  AirbnbClone
//
//  Created by Yashwant Sheshkar on 18/09/25.
//

import SwiftUI

struct MaterialView: View {
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationStack { MaterialListingView() }
    }
}

#Preview {
    MaterialView()
}
