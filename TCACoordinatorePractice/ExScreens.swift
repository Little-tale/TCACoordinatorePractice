//
//  ExScreens.swift
//  TCACoordinatorePractice
//
//  Created by Jae hyung Kim on 6/15/24.
//

import Foundation

extension HomeTapCoordinatorFeature.TapCoordinatorScreens.State: Identifiable {
    
    var id: UUID {
        switch self {
        case let .home(state):
            return state.id
        }
    }
    
}


extension NavigationStackControllCoordinator.NavigationStackScreens.State: Identifiable {
    
    var id: UUID {
        switch self {
        case let .stack1(state):
            return state.id
        case let .stack2(state):
            return state.id
        case let .stack3(state):
            return state.id
        }
    }
    
}
