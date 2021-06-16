

import SwiftUI

struct LensInfoView: View {
    var body: some View {
        Text("lens.how.text")
        .multilineTextAlignment(.leading)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        .padding(24)
        .navigationTitle("lens.how")
    }
}

struct LensInfoView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            LensInfoView()
        }
    }
}
