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
    @Published var fullName    = ""
    @Published var document = ""
    @Published var phone    = ""
    @Published var birthday = ""
    //TODO gender
    
}
