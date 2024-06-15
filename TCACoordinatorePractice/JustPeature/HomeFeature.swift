//
//  HomeFeature.swift
//  TCACoordinatorePractice
//
//  Created by Jae hyung Kim on 6/15/24.
//

import Foundation
import ComposableArchitecture

@Reducer
struct HomeFeature {
    
    @ObservableState
    struct State: Equatable {
        var id = UUID()
    }
    
    enum Action {
        
    }
    
    var body: some ReducerOf<Self> {
        
        Reduce { state, action in
            
            
            
            
            return .none
        }
        
    }
    
}


