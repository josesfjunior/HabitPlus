//
//  SignUpViewModel.swift
//  HabitPlus
//
//  Created by José Júnior on 27/06/23.
//

import SwiftUI

class SignUpViewModel: ObservableObject {
    @Published var email    = ""
    @Published var password = ""
    @Published var fullName = ""
    @Published var document = ""
    @Published var phone    = ""
    @Published var birthday = ""
    @Published var gender   = Gender.male
    @Published var uiState: SignUPUiState = .none

    func signUp(){
        self.uiState = .loading
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1 ) {
            self.uiState = .goToHomeScreen
        }
        
    }
    
}


extension SignUpViewModel {
    func homeView() -> some View {
        return SignUPViewRouter.makeHomeView()
    }
}
