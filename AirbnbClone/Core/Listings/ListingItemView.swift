//
//  ListinView.swift
//  AirbnbClone
//
//  Created by Yashwant Sheshkar on 17/09/25.
//

import SwiftUI

struct ListingItemView: View {
    
    var images = [
        "listing-1",
        "listing-2",
        "listing-3",
        "listing-4",
        "listing-5"
    ]
    
    var body: some View {
        VStack(spacing: 8.0) {
            // images
            
            ListingImageCarouselView()
                .clipShape(RoundedRectangle(cornerRadius: 5))
                .tabViewStyle(.page)
                .frame(height: 320)
                .tabViewStyle(.page)
            
            //listing details
            HStack(alignment: .top) {
                //details
                VStack(alignment: .leading) {
                    Text("Miami, Florida")
                        .fontWeight(.semibold)
                        .foregroundStyle(Color(.black))
                    
                    Text("12 mi away")
                        .foregroundStyle(.gray)
                    
                    Text("Nov 3- 10")
                        .foregroundStyle(.gray)
                    
                    HStack(spacing: 2) {
                        Text("$569")
                            .fontWeight(.semibold)
                        Text("night")
                    }
                    .foregroundStyle(Color(.black))
                    
                    
                    
                }
                
                Spacer()
                
                
                
                //rating
                
                HStack(spacing: 2) {
                    Image(systemName: "star.fill")
                    
                    Text("4.87")
                }
                .foregroundStyle(Color(.black))
            }
            .font(.footnote)
        }
        
    }
}

#Preview {
    ListingItemView()
}
