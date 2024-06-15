//
//  HomeView.swift
//  TCACoordinatorePractice
//
//  Created by Jae hyung Kim on 6/15/24.
//

import SwiftUI
import ComposableArchitecture

struct HomeView: View {
    
    @Perception.Bindable var store: StoreOf<HomeFeature>
    
    var body: some View {
        WithPerceptionTracking {
            Text("홈이에요!")
        }
    }
}
