

import SwiftUI
import LinkPresentation

struct ShareSheet: UIViewControllerRepresentable {
    let photos: [UIImage]
          
    func makeUIViewController(context: Context) -> UIActivityViewController {
        let controller = UIActivityViewController(
            activityItems: photos,
            applicationActivities: nil)
        
        return controller
    }
      
    func updateUIViewController(_ vc: UIActivityViewController, context: Context) {
    }
}
