//
//  SignInViewRouter.swift
//  HabitPlus
//
//  Created by José Júnior on 21/06/23.
//

import SwiftUI

enum SignInViewRouter {
    static func makeHomeView() -> some View {
        HomeView()
    }
    
    static func MakeSignUp() -> some View{
        SignUpView(viewModel: SignUpViewModel())
    }
}
