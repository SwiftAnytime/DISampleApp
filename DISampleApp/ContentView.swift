//
//  ContentView.swift
//  SampleApp
//
//  Created by Sukritha K K on 04/08/24.
//

import SwiftUI
// extension ContentView {
//    init(urlProvider: URLProvider) {
//        _networkManager = StateObject(wrappedValue: NetworkManager())
//    }
// }

struct ContentView: View {
    @StateObject var networkManager: NetworkManager = NetworkManager()
//    @StateObject var networkManager: NetworkManager
//    @EnvironmentObject var networkManager: NetworkManager

    var body: some View {
        VStack {
            Button("Fetch Data") {
//                networkManager.urlProvider = RealURLProvider()
                networkManager.fetchData()
            }
        }
        .padding()
    }
}

// #Preview {
//    ContentView()
// }
