//
//  SignUpVIew.swift
//  HabitPlus
//
//  Created by José Júnior on 27/06/23.
//

import SwiftUI

struct SignUpView: View {
    @ObservedObject var viewModel: SignUpViewModel
    
    var body: some View {
        ZStack {
            ScrollView(showsIndicators: false) {
                signUpViewPage
            }.padding()
            
            if case SignUPUiState.error(let value) = viewModel.uiState{
                Text("")
                    .alert(isPresented: .constant(true)){
                        Alert(title: Text("Falha ao validar"), message: Text(value), dismissButton: .default(Text("Ok")){
                            //Vai fazer algo
                        })
                    }
            }
        }
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView(viewModel: SignUpViewModel())
    }
}

extension SignUpView {
    
    var signUpViewPage: some View{
        VStack(alignment: .center) {
            VStack(alignment: .leading, spacing: 10) {
                Text("Cadastro")
                    .foregroundColor(.black)
                    .font(.title)
                    .bold()
                    .padding(.bottom, 8)
                
                emailField
                
                passwordlField
                
                documentField
                
                fullNameField
                
                phoneField
                
                genderField
                
                enterButton
            }
            Spacer()
        } .padding(.horizontal, 8)
    }
    
    var emailField: some View {
        TextField("", text: $viewModel.email)
            .border(.black)
    }
    
    var passwordlField: some View {
        SecureField("", text: $viewModel.password)
            .border(.orange)
    }
    
    var documentField: some View {
        TextField("", text: $viewModel.document)
            .border(.black)
    }
    
    var fullNameField: some View {
        TextField("", text: $viewModel.fullName)
            .border(.black)
    }
    
    var phoneField: some View {
        TextField("", text: $viewModel.phone)
            .border(.black)
    }
    
    var birthdayField: some View {
        TextField("", text: $viewModel.birthday)
            .border(.black)
    }
    
    var genderField: some View {
        Picker("Gender", selection: $viewModel.gender){
            ForEach(Gender.allCases, id: \.self) {
                value in
                Text(value.rawValue)
                    .tag(value)
            }
        }.pickerStyle(.segmented)
            .padding(.top, 16)
            .padding(.bottom, 32)
    }
    
    var enterButton: some View {
        Button("Realize seu Cadastro") {
            viewModel.signUp()
        }
    }
}
