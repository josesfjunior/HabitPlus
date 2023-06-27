//
//  SignInView.swift
//  HabitPlus
//
//  Created by José Júnior on 15/06/23.
//

import SwiftUI

struct SignInView: View {
    
    @ObservedObject var viewModel: SigInViewModel
    
    var body: some View {
        ZStack{
            if case SignInUIState.goToHomeScreen = viewModel.uiState {
                Text("Tela Principal")
            } else {
                NavigationView {
                    ScrollView(showsIndicators: false) {
                        VStack(alignment: .center, spacing: 20.0) {
                            
                            Spacer(minLength: 36)
                            
                            VStack(alignment: .center, spacing: 8) {
                                Image("logo")
                                    .resizable()
                                    .scaledToFit()
                                    .padding(.horizontal, 48)
                                
                                Text("Login")
                                    .foregroundColor(Color.orange)
                                    .font(Font.system(.title).bold())
                                    .padding(.bottom, 8)
                                
                                TextField("", text: $viewModel.email)
                                    .border(Color.black)
                                    .cornerRadius(3)
                                
                                SecureField("", text: $viewModel.password)
                                    .border(Color.orange)
                                    .cornerRadius(3)
                                
                                Button("Entrar") {
                                    viewModel.login()
                                }
                                
                                VStack {
                                    Text("Ainda não possui um login ativo?")
                                        .foregroundColor(Color.gray)
                                        .padding(.top, 48)
                                    
                                    ZStack {
                                        NavigationLink(destination: viewModel.homeView(), isActive: $viewModel.goToRegistrationPage, label: { EmptyView() })
                                        Button("Registre aqui"){
                                            viewModel.goToRegistrationPage.toggle()
                                        }
                                    }
                                }
                            }
                            .padding(.horizontal, 30.0)
                        }
                        .padding(.top, 60.0)
                        .ignoresSafeArea()
                    }
                    .navigationBarTitle("Login", displayMode: .inline)
                    .navigationBarHidden(true)
                    
                }
                if case SignInUIState.error(let value) = viewModel.uiState {
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
    
    struct SignInView_Previews: PreviewProvider {
        static var previews: some View {
            SignInView(viewModel: SigInViewModel() )
        }
    }
}

