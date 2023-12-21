//
//  ViewController.swift
//
//
//  Created by Arda Ersoy on 21.12.2023.
//

import Foundation
import UIKit
import Combine

open class ViewController<T>: UIViewController {

    public let input: PassthroughSubject<T, Never> = .init()
    public var cancellables = Set<AnyCancellable>()

    override open func viewDidLoad() {
        super.viewDidLoad()
        bind()
        setupUI()
    }

    override open func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }

    open func bind() {}

    open func setupUI() {}
}
