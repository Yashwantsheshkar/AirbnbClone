//
//  ExploreView.swift
//  AirbnbClone
//
//  Created by Yashwant Sheshkar on 17/09/25.
//

import SwiftUI

struct ExploreView: View {
    @State var destinationView: Bool = false
    
    var body: some View {
        NavigationStack {
            
            if destinationView {
                DestinationSearchView(show: $destinationView)
            } else {
                ScrollView {
                    SearchAndFilterBar()
                        .onTapGesture {
                            withAnimation(.snappy) {
                                destinationView.toggle()
                            }
                        }
                        
                    
                        LazyVStack {
                            ForEach(0...30, id:\.self) { listing in
                                NavigationLink(value: listing) {
                                    ListingItemView()
                                        .frame(height: 400)
                                        .clipShape(RoundedRectangle(cornerRadius: 10))
                                }
                            }
                            
                        }
                        .padding()
                    
                }
                .navigationDestination(for: Int.self) { listing in
                    ListingDetailView()
                        .navigationBarBackButtonHidden(true)
                        .toolbar(.hidden, for: .navigationBar)

            }
            
                    
            }
        }
    }
}

#Preview {
    ExploreView()
}
