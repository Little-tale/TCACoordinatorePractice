//
//  NavigationStackCoordinatorView.swift
//  TCACoordinatorePractice
//
//  Created by Jae hyung Kim on 6/15/24.
//

import SwiftUI
import ComposableArchitecture
import TCACoordinators

struct NavigationStackCoordinatorView: View {
    
    @Perception.Bindable var store: StoreOf<NavigationStackControllCoordinator>
    
    var body: some View {
        WithPerceptionTracking {
            TCARouter(store.scope(state: \.routes, action: \.router)) { screen in
                switch screen.case {
                case let .stack1(store):
                    Stack1View(store: store)
                case let .stack2(store):
                    Stack2View(store: store)
                case let .stack3(store):
                    Stack3View(store: store)
                }
            }
        }
    }
}
