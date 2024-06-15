//
//  RootView.swift
//  TCACoordinatorePractice
//
//  Created by Jae hyung Kim on 6/15/24.
//

import SwiftUI
import ComposableArchitecture
import TCACoordinators

struct RootView: View {
    
    @Perception.Bindable var store: StoreOf<RootFeature> = Store(initialState: RootFeature.State()) {
        RootFeature()
    }
    
    var body: some View {
        viewBuilerCheck()
    }
    
    
    @ViewBuilder
    func viewBuilerCheck() -> some View {
        WithPerceptionTracking {
            if store.ifFirst {
                SplashsView(store: store.scope(state: \.splashState, action: \.splashAction))
            } else {
                // 이때부터는 탭바 코디네이터를 주입 해보겠습니다.
//                TCATabView(store: store.scope(state: \.tapState, action: \.tapAction))
                
                // 해당 코드는 문제가 발생하지 않음
//                TCATabView(store: Store(initialState: TapCoordinatorFeature.State(
//                    routes: [.root(.home(HomeFeature.State()), embedInNavigationView: false)]), reducer: {
//                        TapCoordinatorFeature()
//                    }))
                // 해당 방법으로 해결해야 함.
                IfLetStore(store.scope(state: \.tapState, action: \.tapAction)) { store in
                    TCATabView(store: store)
                } else: {
                    ProgressView()
                }
            }
        }
    }
}
//var tapState = TapCoordinatorFeature.State(routes: [.root(.home(HomeFeature.State()), embedInNavigationView: false)])
