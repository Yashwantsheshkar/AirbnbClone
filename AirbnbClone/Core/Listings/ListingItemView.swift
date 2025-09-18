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
            TabView{
                ForEach(images, id: \.self) { image in
                    Image(image)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 370, height: 320)
                        .clipped()
                }
            }
            .frame(height: 320)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .tabViewStyle(.page)
            
            //listing details
            HStack(alignment: .top) {
                //details
                VStack(alignment: .leading) {
                    Text("Miami, Florida")
                        .fontWeight(.semibold)
                    
                    Text("12 mi away")
                        .foregroundStyle(.gray)
                    
                    Text("Nov 3- 10")
                        .foregroundStyle(.gray)
                    
                    HStack(spacing: 2) {
                        Text("$569")
                            .fontWeight(.semibold)
                        Text("night")
                    }
                    
                    
                    
                }
                
                Spacer()
                
                
                
                //rating
                
                HStack(spacing: 2) {
                    Image(systemName: "star.fill")
                    
                    Text("4.87")
                    
                    
                }
                
            }
            .font(.footnote)
        }
        
    }
}

#Preview {
    ListingItemView()
}
