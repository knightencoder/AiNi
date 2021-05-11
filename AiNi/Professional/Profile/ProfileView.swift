//
//  ProfileView.swift
//  AiNi
//
//  Created by Anderson Sprenger on 08/05/21.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        VStack (alignment: .center, spacing: 32){
            ProfileHeader()
            
            VStack (alignment: .center, spacing: 18){
                RoundedRectangle(cornerRadius: 28)
                    .frame(height: 60, alignment: .center)
                    .foregroundColor(Color("card-color"))
                
                RoundedRectangle(cornerRadius: 28)
                    .frame(height: 60, alignment: .center)
                    .foregroundColor(Color("card-color"))
                
                RoundedRectangle(cornerRadius: 28)
                    .frame(height: 60, alignment: .center)
                    .foregroundColor(Color("card-color"))
                
                Spacer()
            }
        }
        .padding()
    }
}

struct Profile_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
