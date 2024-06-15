//
//  SplashVIew.swift
//  TCACoordinatorePractice
//
//  Created by Jae hyung Kim on 6/15/24.
//

import SwiftUI
import ComposableArchitecture

struct SplashView: View {
    
    @Perception.Bindable var store: StoreOf<SplashPeature>
    
    var body: some View {
        WithPerceptionTracking {
            VStack {
                Spacer()
                Button(store.ButtonText) {
                    store.send(.startButtonTapped)
                }
                Spacer()
            }
        }
    }
}
