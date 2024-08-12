//
//  ViewModel.swift
//  
//
//  Created by Arda Ersoy on 12.08.2024.
//

import Foundation
import Combine

open class ViewModel {

    public var cancellables: Set<AnyCancellable>

    public init(cancellables: Set<AnyCancellable> = Set<AnyCancellable>()) {
        self.cancellables = cancellables
    }
}
