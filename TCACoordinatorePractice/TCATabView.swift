//
//  TCATabView.swift
//  TCACoordinatorePractice
//
//  Created by Jae hyung Kim on 6/15/24.
//

import SwiftUI
import ComposableArchitecture

struct TCATabView: View {
    
    @Perception.Bindable var store: StoreOf<TapCoordinatorFeature>
    
    var body: some View {
        WithPerceptionTracking {
            VStack {
                Text("곧 탭뷰 달꺼임!")
            }
        }
    }
    
}
