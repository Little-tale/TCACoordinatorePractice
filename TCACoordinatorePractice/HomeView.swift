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
            VStack {
                Text("홈이에요!")
                
                Button("처음으로 돌아가기") {
                    store.send(.returnFirst)
                }
                .background(.red)
                Button("다음으로 넘어가 보기") {
                    
                }
                .background(.green)
            }
            .navigationTitle("홈뷰 였던것 !")
        }
    }
}
