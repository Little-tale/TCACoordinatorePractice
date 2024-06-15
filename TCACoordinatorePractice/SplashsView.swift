//
//  SplashsView.swift
//  TCACoordinatorePractice
//
//  Created by Jae hyung Kim on 6/15/24.
//

import Foundation
import SwiftUI
import ComposableArchitecture

/// 구분을 위해서 색을 주었습니다!
struct SplashsView: View {
    
    @Perception.Bindable var store: StoreOf<SplashPeature>
    
    var body: some View {
        WithPerceptionTracking {
            VStack {
                Spacer()
                
                Button(action: {store.send(.startButtonTapped)}, label: {
                    Text(store.ButtonText)
                        .frame(maxWidth: .infinity)
                        .frame(height: 80)
                        .background(.red)
                        .padding(.horizontal, 80)
                })
                
                Spacer()
            }
            .background(.green)
        }
    }
}
