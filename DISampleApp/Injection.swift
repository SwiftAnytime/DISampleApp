//
//  Injection.swift
//  SampleApp
//
//  Created by Sukritha K K on 04/08/24.
//

import Foundation
import Swinject

final class Injection {
    static let shared = Injection()
    var container: Container {
        get {
            return _container ?? buildContainer()
        }
        set {
            _container = newValue
        }
    }

    private var _container: Container?
    private func buildContainer() -> Container {
        let container = Container()
        container.register(URLProvider.self) { _ in RealURLProvider() }
        return container
    }
}

@propertyWrapper struct Injected<Dependency> {
    var wrappedValue: Dependency

    init() {
        wrappedValue = Injection.shared.container.resolve(Dependency.self)!
    }
}
