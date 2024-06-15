//
//  StackFeature.swift
//  TCACoordinatorePractice
//
//  Created by Jae hyung Kim on 6/15/24.
//

import Foundation
import ComposableArchitecture

/*
 여러개의 픽처가 존재 해야겠지만
 여기선 간단한 예시를 위해 하나의 픽처로 관리하겠습니다.
 */

@Reducer
struct StackFeature {
    
    @ObservableState
    struct State: Equatable {
        var id = UUID() // 첫번째 탭에서 같은뷰, 같은 스토어를 구분하기 위해서
    }
    
    enum Action {
        case goFirst
        case next2View
        case next3View
        case next1View
        case goFirstStack
        case goBack
    }
    
}
