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
    }
    
    @ObservableState
    struct State {
        static let initState = State(
            homeState: .initalState,
            seletedTab: .home
        )
        var homeState: HomeTapCoordinatorFeature.State
        
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
        
        case homeAction(HomeTapCoordinatorFeature.Action)
    }
    
    var body: some ReducerOf<Self> {
        
        // HomeTab 네비기에션을 관리합니다.
        Scope(state: \.homeState, action: \.homeAction) {
            HomeTapCoordinatorFeature()
        }
        
        Reduce { state, action in
            switch action {
            
            case let .tabSelected(tab):
                state.seletedTab = tab
                
            default:
                break
            }
            
            return .none
        }
    }
}
