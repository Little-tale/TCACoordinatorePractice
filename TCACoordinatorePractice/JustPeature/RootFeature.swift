//
//  RootFeature.swift
//  TCACoordinatorePractice
//
//  Created by Jae hyung Kim on 6/15/24.
//

import Foundation
import ComposableArchitecture

@Reducer
struct RootFeature {
    
    @ObservableState
    struct State {
        var ifFirst: Bool = true
        var splashState = SplashPeature.State()
    }
    
    enum Action: BindableAction {
        case binding(BindingAction<State>)
        case splashAction(SplashPeature.Action)
    }
    
    var body: some ReducerOf<Self> {
        BindingReducer()
        
        // State() 가 이닛되있는 경우는 바로 스코프로 연결합니다.
        Scope(state: \.splashState, action: \.splashAction) {
            SplashPeature()
        }
        
        Reduce { state, action in
            
            switch action {
                
            default :
                break
            }
            
            return .none
        }
    }
}
