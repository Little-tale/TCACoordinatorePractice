//
//  Stack1View.swift
//  TCACoordinatorePractice
//
//  Created by Jae hyung Kim on 6/15/24.
//

import SwiftUI
import ComposableArchitecture

struct Stack1View: View {
    
    @Perception.Bindable var store: StoreOf<StackFeature>
    
    var body: some View {
        VStack {
            Button("첫번째 탭의 뷰로가기") {
                store.send(.goFirst)
            }
            Button("두번째 뷰로가기") {
                store.send(.next2View)
            }
            Button("세번째 뷰로가기") {
                store.send(.next3View)
            }
            Button("첫번째 뷰로가기") {
                store.send(.next1View)
            }
            Button {
                store.send(.goBack)
            } label: {
                Text("뒤로가기 버튼 따라할래")
                    .bold()
                    .background(.gray)
                    .foregroundStyle(.red)
                Image(systemName: "star")
                    .resizable()
                    .frame(width: 100,height: 40)
                    
            }
        }
        .navigationTitle("첫번쨰 스택이였던곳.")
        .navigationBarTitleDisplayMode(.inline)
    }
}
