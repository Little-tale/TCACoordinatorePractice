//
//  NavigationStackControllCoordinator.swift
//  TCACoordinatorePractice
//
//  Created by Jae hyung Kim on 6/15/24.
//

import Foundation
import ComposableArchitecture
import TCACoordinators

@Reducer
struct NavigationStackControllCoordinator {
    
    
    @Reducer(state: .equatable)
    enum NavigationStackScreens {
        case stack1(StackFeature)
        case stack2(StackFeature)
        case stack3(StackFeature)
    }
    
    @ObservableState
    struct State {
        
        static let selfInit = State(
            routes: [.root(.stack1(StackFeature.State()), embedInNavigationView: true)]
        )
        
        var routes: IdentifiedArrayOf<Route<NavigationStackScreens.State>>
    }
    
    enum Action {
        case router(IdentifiedRouterActionOf<NavigationStackScreens>)
        case returnFirstView
    }
    
    var body: some ReducerOf<Self> {
        
        Reduce { state, action in
            switch action {
            case .router(.routeAction(id: _, action: .stack1(.goFirst))):
                
                return .run { send in
                    await send(.returnFirstView)
                }
                
            case .router(.routeAction(id: _, action: .stack2(.goFirst))):
                
                return .run { send in
                    await send(.returnFirstView)
                }
            case .router(.routeAction(id: _, action: .stack3(.goFirst))):
                
                return .run { send in
                    await send(.returnFirstView)
                }
                
            case .router(.routeAction(id: _, action: .stack1(.next2View))):
                state.routes.push(.stack2(StackFeature.State()))
                
            case .router(.routeAction(id: _, action: .stack2(.next2View))):
                state.routes.push(.stack2(StackFeature.State()))
                
            case .router(.routeAction(id: _, action: .stack3(.next2View))):
                state.routes.push(.stack2(StackFeature.State()))
                
            case .router(.routeAction(id: _, action: .stack1(.next3View))):
                state.routes.push(.stack3(StackFeature.State()))
                
            case .router(.routeAction(id: _, action: .stack2(.next3View))):
                state.routes.push(.stack3(StackFeature.State()))
                
            case .router(.routeAction(id: _, action: .stack3(.next3View))):
                state.routes.push(.stack3(StackFeature.State()))
                
                
            case .router(.routeAction(id: _, action: .stack1(.next1View))):
                state.routes.push(.stack1(StackFeature.State()))
                
            case .router(.routeAction(id: _, action: .stack2(.next1View))):
                state.routes.push(.stack1(StackFeature.State()))
                
            case .router(.routeAction(id: _, action: .stack3(.next1View))):
                state.routes.push(.stack1(StackFeature.State()))
                
                // 처음스택으로 돌아갑니다.
            case .router(.routeAction(id: _, action: .stack3(.goFirstStack))):
                
                // state.routes.goBackToRoot() // 이렇게만 해놓으면
                /*
                 Trying to pop to a missing destination - SwiftUI/NavigationBridge_PhoneTV.swift:213 - please file a bug report. 라는 이슈가 나옵니다.
                 */
                /*
                return .routeWithDelaysIfUnsupported(state.routes, action: \.router) { $0.goBackToRoot() }
                 */
                
                /*
                 해당 하는 방법으로도
                 Trying to pop to a missing destination - SwiftUI/NavigationBridge_PhoneTV.swift:213 - please file a bug report. 라는 이슈가 나옵니다.
                 */
                
                return .routeWithDelaysIfUnsupported(state.routes, action: \.router, scheduler: .main) { $0.goBackToRoot() }
                // 해당 방법으로도 같은 이슈가 발생합니다.
                
            default:
                break
            }
            return .none
        }
        .forEachRoute(\.routes, action: \.router)
    }
}
