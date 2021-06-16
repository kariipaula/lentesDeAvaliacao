
import SwiftUI

struct LensCardView: View {
    
    @State
    var lensCard: LensCard
    
    var body: some View {
        ZStack {
            HStack(spacing: .none, content: {
                VStack(content: {
                    Text(lensCard.category.name)
                        .font(.lensTitle)
                        .foregroundColor(lensCard.category.color)
                        .rotationEffect(
                            .degrees(-90)
                        )
                        .fixedSize()
                        .frame(maxWidth: 24, minHeight: lensCard.category.height)
                    Spacer()
                })
                .padding(.leading, 10)
                
                VStack(
                    alignment: .leading,
                    spacing: .some(5),
                    content: {
                        lensCard.category.icon
                        
                        Text(lensCard.name)
                            .font(.lensTitle)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.top, 12)
                        
                        Rectangle()
                            .frame(width: 11, height: 1)
                            .foregroundColor(lensCard.category.color)
                        
                        Text(lensCard.description)
                            .font(.lensBody)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        
                        Text("lens.questions")
                            .font(.lensTitle)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.top, 15)
                        
                        Rectangle()
                            .frame(width: 11, height: 1)
                            .foregroundColor(lensCard.category.color)
                        
                        Text(lensCard.questions)
                            .font(.lensBody)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        Spacer()
                        
                        if let relatedCards = lensCard.relatedCards {
                            Text("lens.releated")
                                .font(.lensFooterTitle)
                                .frame(maxWidth: .infinity, alignment: .trailing)
                            
                            Text(relatedCards)
                                .font(.lensFooterBody)
                                .frame(maxWidth: .infinity, alignment: .trailing)
                                .padding(.top, -3)
                        }
                        
                })
                .frame(maxWidth: .infinity)
                
                VStack(content: {
                    Text(lensCard.code)
                        .font(.lensCode)
                        .foregroundColor(lensCard.category.color)
                        .padding(.trailing, 2)
                    Spacer()
                    
                    Text(lensCard.category.name)
                        .font(.lensTitle)
                        .foregroundColor(lensCard.category.color)
                        .rotationEffect(
                            .degrees(90)
                        )
                        .fixedSize()
                        .frame(maxWidth: 24, minHeight: lensCard.category.height)
                })
                .padding(.trailing, 10)
            })
            .padding(.vertical, 25)
            .frame(width: 214, height: 354)
            .background(Color.white)
            .cornerRadius(4)
            .shadow(radius: 4)
        }
        .padding()
    }
}

struct LensCardView_Previews: PreviewProvider {
    static var previews: some View {
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
    }
}
