//
//  DestinationSearchView.swift
//  AirbnbClone
//
//  Created by Yashwant Sheshkar on 21/09/25.
//

import SwiftUI

struct DestinationSearchView: View {
    @Binding var show: Bool
    @State var searchText: String = ""
    
    var body: some View { 
        VStack {
            Button {
                withAnimation(.snappy) {
                    show.toggle()
                }
            } label: {
                Image(systemName: "xmark.circle")
                    .imageScale(.large)
                    .foregroundStyle(.black)
            }
            
            
            VStack(alignment: .leading) {
                Text("Where to ?")
                    .font(.title2)
                    .fontWeight(.bold)
                HStack{
                    Image(systemName: "magnifyingglass")
                    
                    TextField("Search destination", text: $searchText)
                    
                }
                .frame(height: 44)
                .padding(.horizontal)
                .overlay{
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(lineWidth: 1)
                        .foregroundStyle(Color(.systemGray2))
                }
            }
            .padding()
            .background(Color(.white))
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .padding()
            .shadow(radius: 20)
            

            
        }

    }
}

#Preview {
    DestinationSearchView(show: .constant(true))
}
