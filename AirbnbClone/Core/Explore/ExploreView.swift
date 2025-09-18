//
//  ExploreView.swift
//  AirbnbClone
//
//  Created by Yashwant Sheshkar on 17/09/25.
//

import SwiftUI

struct ExploreView: View {
    var body: some View {
        NavigationStack {
            SearchAndFilterBar()
            ScrollView {
               
                LazyVStack {
                    ForEach(0...30, id:\.self) { listing in
                        ListingItemView()
                            .frame(height: 400)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                    }
                    .padding()
                }
            }
        }
    }
}

#Preview {
    ExploreView()
}
