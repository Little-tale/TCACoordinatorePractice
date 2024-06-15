//
//  RootView.swift
//  TCACoordinatorePractice
//
//  Created by Jae hyung Kim on 6/15/24.
//

import SwiftUI
import ComposableArchitecture

struct RootView: View {
    
    @Perception.Bindable var store: StoreOf<RootFeature> = Store(initialState: RootFeature.State()) {
        RootFeature()
    }
    
    var body: some View {
        VStack {
            
        }
    }
}
