//
//  RootFeature.swift
//  TCACoordinatorePractice
//
//  Created by Jae hyung Kim on 6/15/24.
//

import Foundation
import ComposableArchitecture
import TCACoordinators

@Reducer
struct RootFeature {
    
    @ObservableState
    struct State {
        var ifFirst: Bool = true
        var splashState = SplashPeature.State() // 보통은 ? 를 통해 If Let Sctore를 사용하세요
        //var tapState = TapCoordinatorFeature.State(routes: [.root((.home(HomeFeature.State())), embedInNavigationView: true)])
    }
    
    enum Action: BindableAction {
        case binding(BindingAction<State>)
        case splashAction(SplashPeature.Action)
        //case tapAction(TapCoordinatorFeature.Action)
    }
    
    var body: some ReducerOf<Self> {
        BindingReducer()
        
        // State() 가 이닛되있는 경우는 바로 스코프로 연결합니다.
        Scope(state: \.splashState, action: \.splashAction) {
            SplashPeature()
        }
        
        // Tap Coordinator의 store를 감시 하겠습니다.
//        Scope(state: \.tapState, action: \.tapAction) {
//            TapCoordinatorFeature()
//        }
        
        Reduce { state, action in
            
            switch action {
                
                // 하위뷰의 액션을 관찰합니다.
            case .splashAction(.startButtonTapped):
                state.ifFirst = false
                
                return .none
            default :
                break
            }
            
            return .none
        }
    }
}
