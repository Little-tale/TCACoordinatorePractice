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
struct HomeTapCoordinatorFeature {
    
    @Reducer(state: .equatable)
    enum TapCoordinatorScreens {
        case home(HomeFeature)
    }
//    
    @ObservableState
    struct State: Equatable {
        
        static let initalState = State(
            routes: [.root(.home(HomeFeature.State()), embedInNavigationView: true)]
        )
        
        var routes: IdentifiedArrayOf<Route<TapCoordinatorScreens.State>>
        
    }
//    
    enum Action {
        case router(IdentifiedRouterActionOf<TapCoordinatorScreens>)
        case returnFirstCatch
    }
//    
    var body: some ReducerOf<Self> {
        
        Reduce { state, action in
            switch action {
            case .router(.routeAction(id: _, action: .home(.returnFirst))) :
                return .run { send in
                    await send(.returnFirstCatch)
                }
            case .router(.routeAction(id: _, action: .home(.nextView))):
                
                state.routes.push(.home(HomeFeature.State()))
                
            default :
                break
            }
            
            return .none
        }
        .forEachRoute(\.routes, action: \.router)
    }
    
}
