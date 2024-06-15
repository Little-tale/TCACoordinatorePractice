//
//  TCATabView.swift
//  TCACoordinatorePractice
//
//  Created by Jae hyung Kim on 6/15/24.
//

import SwiftUI
import ComposableArchitecture
import TCACoordinators

struct TCATabView: View {
    
    @Perception.Bindable var store: StoreOf<TabbarCoordinator>
    
    var body: some View {
        WithPerceptionTracking {
            TabView(selection: $store.seletedTab.sending(\.tabSelected)) {
                
                /// HOME
                HomeCoordinatorView(store: store.scope(state: \.homeState, action: \.homeAction))
                    .tabItem { Text("HOME") }
                    .tag(TabbarCoordinator.Tab.home)
                
            }
        }
    }
    
}
