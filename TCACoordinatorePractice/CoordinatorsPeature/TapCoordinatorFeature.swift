//
//  TapCoordinatorFeatur .swift
//  TCACoordinatorePractice
//
//  Created by Jae hyung Kim on 6/15/24.
//

import Foundation
import ComposableArchitecture
import TCACoordinators


@Reducer
struct TapCoordinatorFeature {
    
    @Reducer(state: .equatable)
    enum TapCoordinatorScreens {
        case home(HomeFeature)
    }
    
    @ObservableState
    struct State: Equatable {
        
        static let selfInitState = State(
            routes: [.root((.home(HomeFeature.State())), embedInNavigationView: true)]
        )
        
        var routes: IdentifiedArrayOf<Route<TapCoordinatorScreens.State>>
    }
    
    enum Action {
        case router(IdentifiedRouterActionOf<TapCoordinatorScreens>)
    }
    
    var body: some ReducerOf<Self> {
        
        Reduce { state, action in
            switch action {
                
            default :
                break
            }
            
            return .none
        }
        .forEachRoute(\.routes, action: \.router)
    }
    
}
