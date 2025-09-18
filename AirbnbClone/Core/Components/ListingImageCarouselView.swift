//
//  ListingImageCarouselView.swift
//  AirbnbClone
//
//  Created by Yashwant Sheshkar on 19/09/25.
//

import SwiftUI

struct ListingImageCarouselView: View {
    
    var images = [
        "listing-1",
        "listing-2",
        "listing-3",
        "listing-4",
        "listing-5"
    ]
    
    var body: some View {
        GeometryReader { geo in
            TabView {
                ForEach(images, id: \.self) { image in
                    Image(image)
                        .resizable()
                        .scaledToFill()
                        .frame(width: geo.size.width)
                        .clipped()
                }
            }
            .tabViewStyle(.page)
            .frame(width: geo.size.width)
        }

    }
}

#Preview {
    ListingImageCarouselView()
}
