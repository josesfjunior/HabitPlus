//
//  SigInViewModel.swift
//  HabitPlus
//
//  Created by José Júnior on 15/06/23.
//

import SwiftUI

class SigInViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var goToRegistrationPage = false
    @Published var uiState: SignInUIState = .none
    
    func login(){
        DispatchQueue.main.asyncAfter(deadline: .now() + 1){
            if self.email == "teste@juninho" && self.password == "juninho123"{
                self.uiState = .goToHomeScreen
            } else {
                self.uiState = .error("Usuario ou senha incorreta")
            }
        }
    }
}

extension SigInViewModel {
    func homeView() -> some View {
        return SignInViewRouter.makeHomeView()
    }
    
    func signUpView() -> some View {
        return SignInViewRouter.MakeSignUp()
    }
}
