//
//  TreatmentStages.swift
//  AiNi
//
//  Etapas de um tratamento, a view chamada ao editar um tratamento.
//
//  Created by Anderson Sprenger on 07/05/21.
//


import SwiftUI

struct TreatmentStages: View {
    
    
    @ObservedObject var viewModel : TreatmentDetailsModel = TreatmentDetailsModel()
    
    @State var novaEtapa = false
    
    var body: some View {
        ScrollView {
            VStack (alignment: .center, spacing: 15) {
                Text("Crie o seu tratamento do jeito que quiser, adicione etapas, tarefas, frequência e tempo.")
                    .font(.footnote)
                    .frame(width: 339, alignment: .center)
                    
                
                ZStack {
                    RoundedRectangle(cornerRadius: 10.0)
                        .frame(width: 327, height: 46, alignment: .center)
                        .foregroundColor(Color(#colorLiteral(red: 0.9176470588, green: 0.9176470588, blue: 0.9176470588, alpha: 1)))
                    
                    Text("\(Image(systemName: "plus")) Nova Etapa")
                        .font(.footnote)
                        .sheet(isPresented: $novaEtapa , content: {
                            ModalNewStep(viewModel : StepDetailsModel(title: "Nova Etapa", stepByStep: "", activityTime: false, frequency: false),novaEtapa: $novaEtapa,completeStep: completeStep)
                        } )
                        .onTapGesture {
                            novaEtapa = true
                        }
                }
                ForEach(viewModel.stepList, id: \.self) { stepItem in
                    TreatmentStage(text:stepItem.title)
                        .sheet(isPresented: $novaEtapa , content: {
                            ModalNewStep(viewModel : stepItem,novaEtapa: $novaEtapa,completeStep: completeStep)
                        } ).onTapGesture {
                            novaEtapa = true
                        }
                    
                }
                
            }
        }
    }
    func completeStep(title : String, stepByStep:String, activityTime : Bool, frequency : Bool) {
        let step : StepDetailsModel = StepDetailsModel(title:title, stepByStep:stepByStep, activityTime:activityTime, frequency:frequency)
        viewModel.stepList.append(step)
    }
}

struct TreatmentDetail_Previews: PreviewProvider {
    static var previews: some View {
        TreatmentStages()
    }
}
