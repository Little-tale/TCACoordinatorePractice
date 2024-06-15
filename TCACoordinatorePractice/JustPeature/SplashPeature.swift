//
//  SplashPeature.swift
//  TCACoordinatorePractice
//
//  Created by Jae hyung Kim on 6/15/24.
//

import Foundation
import ComposableArchitecture

@Reducer
struct SplashPeature {
    
    @ObservableState
    struct State {
        var ButtonText: String = "시작"
        
    }
    
    enum Action {
        case startButtonTapped
    }
    
    
    var body: some ReducerOf<Self> {
        
        
        Reduce { state, action in
            switch action {
            default: // 상위 뷰가 관찰합니다. 즉 여기서는 관찰 하지 않습니다.
                break
            }
            return .none
        }
        
    }
    
}
