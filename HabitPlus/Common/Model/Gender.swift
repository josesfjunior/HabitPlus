//
//  Gender.swift
//  HabitPlus
//
//  Created by José Júnior on 27/06/23.
//

import Foundation

enum Gender: String, CaseIterable, Identifiable {
    case male = "Masculino"
    case famele = "Feminino"
    
    var id: String {
        self.rawValue
    }
}
