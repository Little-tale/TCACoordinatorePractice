//
//  TabbarCoordinator.swift
//  TCACoordinatorePractice
//
//  Created by Jae hyung Kim on 6/15/24.
//

import Foundation
import TCACoordinators
import ComposableArchitecture


@Reducer
struct TabbarCoordinator {
    
    enum Tab: Hashable {
        case home
        case navigationControll
    }
    
    @ObservableState
    struct State {
        static let initState = State(
            homeState: .initalState,
            navigationStackState: .selfInit,
            seletedTab: .home
        )
        // 홈 탭의 관한 스태이트
        var homeState: HomeTapCoordinatorFeature.State
        
        // 네비게션 스택관리 스테이트
        var navigationStackState: NavigationStackControllCoordinator.State
        
        var seletedTab: Tab
        
        
//        static var initState : State {
//            return State(
//                homeState: .initalState,
//                seletedTab: .home
//            )
//        }
    }
    
    enum Action {
        case tabSelected(Tab)
        
        // HomeTab 액션
        case homeAction(HomeTapCoordinatorFeature.Action)
        
        // 네비게이션스택픽처의 액션을 감시
        case navigationStackAction(NavigationStackControllCoordinator.Action)
        
        
        case ifNeedRetureFirst
    }
    
    var body: some ReducerOf<Self> {
        
        // HomeTab 네비기에션을 관리합니다.
        Scope(state: \.homeState, action: \.homeAction) {
            HomeTapCoordinatorFeature()
        }
        
        Scope(state: \.navigationStackState, action: \.navigationStackAction) {
            NavigationStackControllCoordinator()
        }
        
        Reduce { state, action in
            switch action {
            
            case let .tabSelected(tab):
                state.seletedTab = tab
                
            case .homeAction(.returnFirstCatch):
                
                return .run { send in
                    await send(.ifNeedRetureFirst)
                }
                
            case .navigationStackAction(.returnFirstView):
                
                return .run { send in
                    await send(.ifNeedRetureFirst)
                }
                
            default:
                break
            }
            
            return .none
        }
    }
}
