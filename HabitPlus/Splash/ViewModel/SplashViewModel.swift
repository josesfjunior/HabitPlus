//
//  SplashViewModel.swift
//  HabitPlus
//
//  Created by José Júnior on 15/06/23.
//

import SwiftUI

class SplashViewModel: ObservableObject {
    // Estados ficam aqui
    @Published var uistate: SplashUIState = .loading
    
    func onAppear() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2){
            self.uistate = .goToSignInScreen
        }
    }
    
    func signInView () -> some View{
        return SplashViewRouter.makeSignInView()
    }
    
}



