//
//  ExScreens.swift
//  TCACoordinatorePractice
//
//  Created by Jae hyung Kim on 6/15/24.
//

import Foundation

extension TapCoordinatorFeature.TapCoordinatorScreens.State: Identifiable {
    
    var id: UUID {
        switch self {
        case let .home(state):
            return state.id
        }
    }
    
}
