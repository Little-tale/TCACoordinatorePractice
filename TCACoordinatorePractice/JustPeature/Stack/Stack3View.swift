//
//  Stack3.swift
//  TCACoordinatorePractice
//
//  Created by Jae hyung Kim on 6/15/24.
//

import SwiftUI
import ComposableArchitecture

/*
 해당뷰에서만 한번 처음스택으로 돌아가 보기 버튼을 만든후 이용해 보겠습니다.
 */
struct Stack3View: View {
    
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
            Button("첫번째 스택으로 돌아가보자!") {
                store.send(.goFirstStack)
            }
        }
        .navigationTitle("세번쨰 스택이였던곳.")
        .navigationBarTitleDisplayMode(.automatic)
    }
}
