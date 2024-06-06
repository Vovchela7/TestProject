//
//  PremiumView.swift
//  DikidiNour
//
//  Created by Vovchela10 on 05.06.2024.
//

import SwiftUI

struct VipSection: View {
    @EnvironmentObject private var viewModel: DikidiViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("Премиум")
                    .bold()
                Text("\(viewModel.vip.count)")
                    .foregroundColor(.secondary)
            }
            .font(.title2)
            ZStack {
                RoundedRectangle(cornerRadius: 15)
                    .fill(.white)
                VStack {
                    ForEach(viewModel.vip, id: \.id) { card in
                        VipSectionCell(card: card)
                    }
                }
            }
        }
        .padding(.horizontal)
        .padding(.bottom)
    }
}

struct VipSection_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            VipSection()
        }
        .environmentObject(DikidiViewModel(dikidiService: MockDikidiService()))
    }
}

import SwiftUI

struct VipSectionCell: View {
    let card: Catalog
    
    var body: some View {
        HStack(spacing: 15) {
            AsyncImage(url: URL(string: card.image.thumb)) { returnedImage in
                returnedImage
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50, height: 50)
            } placeholder: {
                ProgressView()
                    .frame(width: 50, height: 50)
            }
            .cornerRadius(10)
            VStack(alignment: .leading, spacing: 5) {
                Text(card.name)
                    .font(.system(size: 14))
                    .lineLimit(1)
                Text(card.categories.first ?? "")
                    .font(.caption)
                    .foregroundColor(.secondary)
                    .lineLimit(1)
            }
            Spacer()
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.accentColor)
                    .frame(width: 100, height: 30)
                RoundedRectangle(cornerRadius: 10)
                    .fill(.white)
                    .frame(width: 98, height: 28)
                Text("Записаться")
                    .foregroundColor(.accentColor)
                    .font(.caption)
            }
        }
        .padding()
    }
}

struct VipSectionCell_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            VipSectionCell(card: Catalog(
                id: "1",
                name: "Sample",
                image: ImageStruct(thumb: "https://via.placeholder.com/50", origin: ""),
                street: "Sample Street",
                house: "123",
                schedule: .bool(false),
                lat: "0.0",
                lng: "0.0",
                categories: ["Category1"],
                categoriesCatalog: [],
                rating: 5.0,
                isMaster: false,
                award: nil,
                vipTariff: true,
                reviewCount: .string("10"),
                backgrounds: [],
                currency: Currency(id: "1", title: "USD", abbr: "$"),
                masterID: nil
            ))
        }
    }
}

class MockDikidiService: DikidiServiceProtocol {
    func fetchDikidiData(completion: @escaping (Result<ResponseModel, ApiClientError>) -> Void) {
        let mockCatalogItem = Catalog(
            id: "1",
            name: "Sample",
            image: ImageStruct(thumb: "https://via.placeholder.com/50", origin: ""),
            street: "Sample Street",
            house: "123",
            schedule: .bool(false),
            lat: "0.0",
            lng: "0.0",
            categories: ["Category1"],
            categoriesCatalog: [],
            rating: 5.0,
            isMaster: false,
            award: nil,
            vipTariff: true,
            reviewCount: .string("10"),
            backgrounds: [],
            currency: Currency(id: "1", title: "USD", abbr: "$"),
            masterID: nil
        )
        
        let mockResponse = ResponseModel(
            error: ErrorStruct(code: 0, message: nil),
            data: DataClass(
                title: "Sample Title",
                image: "https://via.placeholder.com/300",
                catalogCount: "1",
                blocks: BlocksStruct(
                    shares: SharesStruct(list: [], count: "0"),
                    examples: "https://via.placeholder.com/300",
                    catalog: [mockCatalogItem],
                    examples2: "https://via.placeholder.com/300"
                ),
                order: []
            )
        )
        
        completion(.success(mockResponse))
    }
}
