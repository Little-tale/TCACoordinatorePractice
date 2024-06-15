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
        case returnFirst
        case nextView
    }
    
    var body: some ReducerOf<Self> {
        
        Reduce { state, action in
            
            switch action {
             
            case .returnFirst: //  최상위 뷰가 관찰 해보죠
                return .none
                
            default: // 상위 코디네이터가 nextView 를 관찰 합니다.
                break
            }
            return .none
        }
        
    }
    
}


