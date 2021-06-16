

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        NavigationView {
            VStack(spacing: .some(24), content: {
                
                LensCardView(
                    lensCard: LensCard(
                        category: .aesthetic,
                        code: "ES01",
                        name: "Estilo de interface",
                        description: "Acompanhe os movimentos estéticos e compreenda como se beneficiar e aplicar de forma coerente no projeto.",
                        questions: "Que estilos são tendências atualmente? \nHá benefícios em incorporá-los na interface?",
                        relatedCards: nil
                    )
                )
                
                Button("Sortear carta", action: {})
                    .font(.lensCode)
                    .padding(8)
                    .background(Color.black)
                    .foregroundColor(.white)
                    .cornerRadius(100)
            })
            .navigationBarTitle("Lente", displayMode: .inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        
                    }, label: {
                        Image(systemName: "")
                    })
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
        }
    }
}
