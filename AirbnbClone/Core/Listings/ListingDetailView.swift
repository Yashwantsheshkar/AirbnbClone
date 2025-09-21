//
//  ListingDetailView.swift
//  AirbnbClone
//
//  Created by Yashwant Sheshkar on 19/09/25.
//

import SwiftUI
import MapKit

struct ListingDetailView: View {
    
    var images = [
        "listing-1",
        "listing-2",
        "listing-3",
        "listing-4",
        "listing-5"
    ]
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            ZStack(alignment: .topLeading) {
                
                ListingImageCarouselView()
                    .frame(height: 320)
                    .tabViewStyle(.page)
                
                Button  {
                    dismiss()
                } label: {
                    Image(systemName: "chevron.left")
                        .foregroundStyle(.black)
                        .background{
                            Circle()
                                .fill(.white)
                                .frame(width: 32, height: 32)
                        }
                        .padding(32)
                }
                

                
            }
            
            VStack(alignment: .leading, spacing: 8) {
                
                
                Text("Miami Villa")
                    .font(.title)
                    .fontWeight(.semibold)
                
                VStack(alignment: .leading) {
                    HStack(spacing: 2) {
                        Image(systemName: "star.fill")
                        Text("4.86")
                        Text(" - ")
                        Text("28 reviews")
                            .underline()
                            .fontWeight(.semibold)
                        
                    }
                    .foregroundStyle(Color(.black))
                    Text("Miami, FL, USA")
                }
                .font(.caption)
            }
            .padding(.leading)
            .frame(maxWidth: .infinity, alignment: Alignment.leading)
            
            Divider()
            
            //MARK: - Host info view
            
            HStack{
                VStack(alignment: .leading, spacing: 4){
                    Text("Entire villa hosted by")
                        .font(.title2)
                        .fontWeight(.semibold)
                    Text("Jane Smith")
                        .font(.title2)
                        .fontWeight(.semibold)
                    Text("4 guest - 4 bedrooms - 4 beds - 3 baths")
                        .font(.caption)
                        .fontWeight(.semibold)
                }
                .frame(maxWidth: .infinity, alignment: .init(horizontal: .leading, vertical: .top))
                
                Spacer()
                
                Image("listing-1")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 60, height: 60)
                    .clipShape(Circle())
            }
            .padding()
            
            Divider()
            
            //MARK: - Listing Features
            
            VStack(alignment: .leading, spacing: 16){
                ForEach(0..<2) { feature in
                    HStack(spacing: 12){
                        Image(systemName: "medal")
                        
                        VStack(alignment: .leading){
                            Text("Superhost")
                                .font(.footnote)
                                .fontWeight(.semibold)
                            
                            Text("Superhosts are experiecne, highly rated hosts who are commited to providing great stays for guests")
                                .font(.caption)
                                .foregroundStyle(Color(.secondaryLabel))
                            
                            
                        }
                        Spacer()
                    }
                }
            }
            .padding()
            
            Divider()
            
            //MARK: - Bedrooms view
            
            VStack(alignment: .leading) {
                Text("Where you'll sleep")
                    .font(.headline)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing:16){
                        ForEach(0..<5){ bedroom in
                            VStack(alignment: .leading, spacing: 16) {
                                Image(systemName: "bed.double")
                                
                                Text("Bedroom \(bedroom + 1)")
                                    .font(.footnote)
                                    .fontWeight(.semibold)
                            }
                            .padding()
                            .frame(width: 132, height: 100, alignment: .leading)
                            .overlay{
                                RoundedRectangle(cornerRadius: 12)
                                    .stroke(Color.gray, lineWidth: 1)
                            }
                        }
                        
                    }
                }
                .scrollTargetBehavior(.paging)
            }
            .padding()
            
            Divider()
            
            //MARK: - Offers
            
            VStack(alignment: .leading, spacing: 16) {
                Text("What this place offers")
                    .font(.headline)
                ForEach(0..<5) {feature in
                    HStack{
                        Image(systemName: "wifi")
                        Text("Wifi")
                            .font(.footnote)
                            .fontWeight(.semibold)
                        
                        Spacer()
                    }
                }
            }
            .padding()
            
            Divider()
            
            //MARK: - Map View
            VStack(alignment: .leading, spacing: 16){
                Text("Where you'll be")
                    .font(.headline)
                
                Map()
                    .frame(height: 250)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
            }
            .padding()
            
            
            
        }
        .ignoresSafeArea()
        .padding(.bottom, 100)
        .overlay(alignment: Alignment.bottom) {
            VStack {
                Divider()
                    .padding(.bottom)
                
                HStack {
                    
                    VStack(alignment:.leading){
                        Text("$500")
                            .font(.headline)
                            .fontWeight(.semibold)
                        Text("total before taxes")
                            .font(.footnote)
                            .fontWeight(.semibold)
                        Text("Oct 15 - 20")
                            .underline()
                            .font(.footnote)
                            .fontWeight(.bold)
                    }
                    
                    
                    Spacer()
                    
                    Button(action: {
                        dismiss()
                    }) {
                        Text("Reserve")
                            .foregroundColor(.white)
                    }
                    .padding()
                    .background(Color(.red))
                    .cornerRadius(8)
                }
                
            }
            .padding()
            .background(.white)
        }
    }
}

#Preview {
    ListingDetailView()
}
