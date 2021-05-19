//
//  BlueButton.swift
//  AiNi
//
//  Created by Julia Silveira de Souza on 17/05/21.
//
import SwiftUI

struct BlueButton: View {
    
    var ButtonTitle: String
    @State var NextStep = false
    
    var body: some View {
        ZStack {
            
            Button(action: {}) {
                Text(ButtonTitle)
                    .font(.footnote)
                    .foregroundColor(.white)
                    .padding()
                    .frame(width: 130, height: 48, alignment: .center)
                
            }.background(CardsGradientStyle())
            
            .onTapGesture {
                NextStep = true
            }
            
        }.clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

struct BlueButton_Previews: PreviewProvider {
    static var previews: some View {
        BlueButton(ButtonTitle: "")
    }
}
