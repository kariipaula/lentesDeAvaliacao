

import SwiftUI

struct LensListView: View {
    
    @State private var searchText: String = ""
    @State private var searchCategory: LensCategory = .none
    
    @State private var takePic = false
    @State private var contentHeight: CGFloat = 0
    
    @State private var showShareSheet = false
    var lensCards = lenses.map({ LensCardView(lensCard: $0) })
    @State private var image: UIImage? = nil
    
    var body: some View {
        NavigationView {
            ScrollView {
                Picker(selection: $searchCategory, label: Text("Filtrar por categoria")) {
                    ForEach(LensCategory.allCases, id: \.rawValue) {
                        Text($0.name.prefix(8)).tag($0)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding(.horizontal)
                
                TextField("lens.listing.filter.placeholder", text: $searchText)
                .padding()
                .background(Color(.systemGray5))
                .cornerRadius(8)
                .padding(.horizontal)
                
                LazyVStack {
                    ForEach(
                        lensCards.filter({ self.shouldShowCard(filtering: $0.lensCard) }),
                        id: \.lensCard.code) { lens in
                        lens
                    }
                }
                .background(
                    ZStack {
                        GeometryReader { proxy in
                            Color.clear.onAppear() {
                                contentHeight = proxy.size.height
                            }.onChange(of: takePic) { (newVal) in
                                if newVal {
                                    image = self.takeScreenshot(origin: proxy.frame(in: .global).origin, size: proxy.size)
                                    takePic.toggle()
                                    showShareSheet.toggle()
                                }
                            }
                        }
                    })
            }
            .navigationTitle("lens.listing.title")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(
                        destination: LensInfoView(),
                        label: {
                            Image(systemName: "info.circle")
                        })
                }
//                ToolbarItem(placement: .navigationBarTrailing) {
//                    Button(action: {
//                        self.takePic.toggle()
//                    }, label: {
//                        Image(systemName: "square.and.arrow.up")
//                    })
//                    .sheet(isPresented: self.$showShareSheet) {
////                        let images = lensCards.map({ $0.takeScreenshot(origin: .zero, size: .init(width: 240, height: 380)) })
//                        if let img = image {
//                            ShareSheet(photos: [img])
//                        }
//                    }
//                }
            }
        }
    }
    
    private func shouldShowCard(filtering: LensCard) -> Bool {
        guard
            searchCategory == .none ||
            filtering.category == searchCategory
        else { return false }
        
        guard !searchText.isEmpty else { return true }
        
        return
            filtering.name.lowercased().contains(searchText.lowercased())
            || filtering.code.lowercased().contains(searchText.lowercased())
            || filtering.description.lowercased().contains(searchText.lowercased())
            || filtering.questions.lowercased().contains(searchText.lowercased())
    }
    
}

struct LensListView_Previews: PreviewProvider {
    static var previews: some View {
        LensListView()
            .previewDevice("iPhone 8")
    }
}
