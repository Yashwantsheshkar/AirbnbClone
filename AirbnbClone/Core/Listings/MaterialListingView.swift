//
//  MaterialListingView.swift
//  AirbnbClone
//
//  Created by Yashwant Sheshkar on 18/09/25.
//

import SwiftUI


// MARK: - Section (Date) View
struct MaterialSectionView: View {
    let day: MaterialDeliveryDay

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            
            VStack(alignment: .leading, spacing: 6) {
                Text(day.date)
                    .font(.system(size: 16, weight: .medium))
                    .lineSpacing(8)
                Text("\(day.itemCount) items received at site")
                    .font(.system(size: 14, weight: .regular))
                    .lineSpacing(4)
                    .foregroundStyle(.secondary)
            }
            .padding(.horizontal, 16)
            .padding(.vertical)

            // Material cards
            VStack(spacing: 24) {
                ForEach(day.material) { item in
                    MaterialCardView(item: item)
                }
            }
            .padding(.horizontal, 16)
        }
        .padding(.vertical, 16)
    }
}

// MARK: - Material Card View
struct MaterialCardView: View {
    let item: MaterialItem
    @State private var page = 0
    struct PresentedImage: Identifiable { let id = UUID(); let name: String }
    @State private var presentedImage: PresentedImage?

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            // Image carousel or single image
            if item.mediaurls.isEmpty {
                RoundedRectangle(cornerRadius: 2)
                    .fill(Color(.systemGray6))
                    .frame(maxWidth: .infinity, minHeight: 248.5, maxHeight: 248.5)
                    .overlay(
                        VStack(spacing: 6) {
                            Text("No photo available.")
                            Text("Entry made off-site")
                        }
                        .multilineTextAlignment(.center)
                        .foregroundStyle(.secondary)
                    )
            } else if let first = item.mediaurls.first, item.mediaurls.count == 1 {
                Image(first)
                    .resizable()
                    .scaledToFill()
                    .frame(maxWidth: .infinity, minHeight: 248.5, maxHeight: 248.5)
                    .clipped()
                    .clipShape(RoundedRectangle(cornerRadius: 2))
                    .onTapGesture {
                        presentedImage = PresentedImage(name: first)
                    }
            } else {
                TabView(selection: $page) {
                    ForEach(Array(item.mediaurls.enumerated()), id: \.offset) { idx, image in
                        Image(image)
                            .resizable()
                            .scaledToFill()
                            .frame(maxWidth: .infinity, minHeight: 248.5, maxHeight: 248.5)
                            .clipped()
                            .tag(idx)
                            .onTapGesture {
                                presentedImage = PresentedImage(name: image)
                            }
                    }
                }
                .frame(height: 248.5)
                .clipShape(RoundedRectangle(cornerRadius: 2))
                .tabViewStyle(.page)
            }

            // Details row
            HStack() {
                HStack(alignment: .top, spacing: 6) {
                    Text(item.materialType)
                        .font(.system(size: 16, weight: .medium))
                        .lineSpacing(4)
                    Image(systemName: "circle.fill")
                        .resizable()
                        .frame(width: 4, height: 4)
                        .foregroundStyle(.primary)
                        .padding(.top, 6)
                    Text(item.brandAndGrade)
                        .font(.system(size: 14, weight: .regular))
                        .lineSpacing(4)
                        .foregroundStyle(.secondary)
                }
                Spacer()
                Text(item.quantity)
                    .font(.system(size: 14, weight: .regular))
                    .lineSpacing(4)
                    .foregroundStyle(.secondary)
            }
            .font(.footnote)
            .padding(.top, 8)
            .padding(.bottom, 16)
        }
        .fullScreenCover(item: $presentedImage) { presented in
            ImageViewerView(imageName: presented.name)
        }
    }
}

// MARK: - Screen
struct MaterialListingView: View {
    @Environment(\.dismiss) private var dismiss
    // This would be bound to your decoded API responseData
    let days: [MaterialDeliveryDay]

    init(days: [MaterialDeliveryDay] = MaterialListingView.dummyData) {
        self.days = days
    }

    var body: some View {
        VStack(spacing: 0) {
            // Header
            HStack {
                Button(action: { dismiss() }) {
                    Image(systemName: "chevron.left")
                        .foregroundColor(.black)
                }
                Spacer()
                Text("Material Delivery")
                    .font(.system(size: 16, weight: .medium))
                    .lineSpacing(8)
                    .foregroundColor(.black)
                Spacer()
                Button(action: {}) {
                    Image(systemName: "info.circle")
                        .resizable()
                        .frame(width: 24, height: 24)
                        .foregroundColor(.black)
                }
            }
            .padding()
            .background(Color.white)
            .overlay(Divider(), alignment: .bottom)
            .zIndex(1)

            // Content
            ScrollView {
                LazyVStack(spacing: 24) {
                    ForEach(days) { day in
                        MaterialSectionView(day: day)
                        Divider()
                    }
                }
            }
            .background(Color.white)
        }
    }
}

// MARK: - Dummy Data
extension MaterialListingView {
    static let dummyData: [MaterialDeliveryDay] = [
        MaterialDeliveryDay(
            date: "Today, 13 Jul",
            itemCount: "3",
            material: [
                // 4 images
                MaterialItem(
                    mediaurls: ["listing-1", "listing-2", "listing-3", "listing-4"],
                    materialType: "Sand",
                    quantity: "13 tonne",
                    brandAndGrade: "River Sand"
                ),
                // 3 images
                MaterialItem(
                    mediaurls: ["listing-5", "listing-2", "listing-3"],
                    materialType: "Cement",
                    quantity: "34 bags",
                    brandAndGrade: "ACC Grade-53"
                ),
                // 1 image
                MaterialItem(
                    mediaurls: ["listing-1"],
                    materialType: "Bricks",
                    quantity: "500 pcs",
                    brandAndGrade: "M10 Solid"
                )
            ]
        ),
        MaterialDeliveryDay(
            date: "12 Jul",
            itemCount: "1",
            material: [
                MaterialItem(
                    mediaurls: ["listing-2", "listing-3"],
                    materialType: "Rebar",
                    quantity: "2.5 tonne",
                    brandAndGrade: "TMT 550D"
                )
            ]
        ),
        MaterialDeliveryDay(
            date: "10 Jul",
            itemCount: "1",
            material: [
                MaterialItem(
                    mediaurls: [],
                    materialType: "Steel",
                    quantity: "13 tonne",
                    brandAndGrade: "Jindal Steel"
                )
            ]
        )
    ]
}

struct ImageViewerView: View {
    @Environment(\.dismiss) private var dismiss
    let imageName: String
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            Image(imageName)
                .resizable()
                .scaledToFit()
                .ignoresSafeArea(edges: .bottom)
            VStack {
                HStack {
                    Spacer()
                    Button(action: { dismiss() }) {
                        Image(systemName: "xmark")
                            .font(.system(size: 18, weight: .bold))
                            .foregroundColor(.white)
                            .padding(12)
                            .background(Color.black.opacity(0.5))
                            .clipShape(Circle())
                    }
                }
                .padding()
                Spacer()
            }
        }
    }
}

#Preview {
    MaterialListingView()
}
