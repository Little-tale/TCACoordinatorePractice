//
//  RootView.swift
//  TCACoordinatorePractice
//
//  Created by Jae hyung Kim on 6/15/24.
//

import SwiftUI
import ComposableArchitecture

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
                SplashView(store: store.scope(state: \.splashState, action: \.splashAction))
            } else {
                // 이때부터는 탭바 코디네이터를 주입 해보겠습니다.
//                TCATabView(store: store.scope(state: \.tapState, action: \.tapAction))
            }
        }
    }
}
