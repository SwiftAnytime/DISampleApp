//
//  NetworkManager.swift
//  SampleApp
//
//  Created by Sukritha K K on 04/08/24.
//

import Foundation

// Without Dependency Injection:
// class NetworkManager: ObservableObject {
//    func fetchData() {
//        // Code to fetch data from a hardcoded URL
//        let url = URL(string: "https://example.com/api/data")!
//        let session = URLSession.shared
//        // ... (rest of the network fetching code)
//        print("Network fetch completed..")
//    }
// }

// With Dependency Injection:
// class NetworkManager: ObservableObject {
//    private let urlProvider: URLProvider
//
//    init(urlProvider: URLProvider) {
//        self.urlProvider = urlProvider
//    }
//
//    func fetchData() {
//        let url = urlProvider.url
//        let session = URLSession.shared
//        // ... (rest of the network fetching code using the provided URL)
//        print("Network fetch completed..")
//    }
// }

protocol URLProvider {
    var url: URL { get }
}

class RealURLProvider: URLProvider {
    // This class provides the actual production URL
    var url: URL { return URL(string: "https://example.com/api/data")! }
}

class MockURLProvider: URLProvider {
    // This class can be used for testing with a mock URL
    var url: URL { return URL(string: "https://mock.com/data")! }
}

// class NetworkManager: ObservableObject {
//    var urlProvider: URLProvider?
//    init() {}
//
//    func fetchData() {
//        let url = urlProvider?.url
//        let session = URLSession.shared
//        // ... (rest of the network fetching code using the provided URL)
//        print("Network fetch completed..")
//    }
// }

// Dependency Injection Containers
class NetworkManager: ObservableObject {
//    var urlProvider: URLProvider = Injection.shared.container.resolve(URLProvider.self)!
    @Injected var urlProvider: URLProvider

    func fetchData() {
        let url = urlProvider.url
        let session = URLSession.shared
        // ... (rest of the network fetching code using the provided URL)
        print("Network fetch completed..")
    }
}

class NetworkService {
    init(urlProvider: URLProvider) {}
}
