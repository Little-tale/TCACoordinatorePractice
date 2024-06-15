//
//  HomeCoordinatorView.swift
//  TCACoordinatorePractice
//
//  Created by Jae hyung Kim on 6/15/24.
//

import SwiftUI
import ComposableArchitecture
import TCACoordinators

struct HomeCoordinatorView: View {
    
    @Perception.Bindable var store: StoreOf<HomeTapCoordinatorFeature>
    
    var body: some View {
        WithPerceptionTracking {
            TCARouter(store.scope(state: \.routes, action: \.router)) { screen in
                switch screen.case {
                case let .home(store):
                    HomeView(store: store)
                }
            }
        }
    }
}

