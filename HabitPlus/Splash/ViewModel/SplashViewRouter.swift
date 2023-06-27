//
//  SplashViewRouter.swift
//  HabitPlus
//
//  Created by José Júnior on 15/06/23.
//

import SwiftUI

enum SplashViewRouter {
    
    static func makeSignInView() -> some View{
        return SignInView(viewModel: SigInViewModel() )
    }
}
