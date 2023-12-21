//
//  ViewModel.swift
//  
//
//  Created by Arda Ersoy on 21.12.2023.
//

import Foundation
import Combine

open class ViewModel {

    public var cancellables: Set<AnyCancellable>

    public init(cancellables: Set<AnyCancellable> = Set<AnyCancellable>()) {
        self.cancellables = cancellables
    }
}
