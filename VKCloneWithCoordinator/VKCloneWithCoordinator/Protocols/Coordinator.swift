//
//  Coordinator.swift
//  VKCloneWithCoordinator
//
//  Created by Denis Kazarin on 27.11.2021.
//

import UIKit
import SwiftUI
import Combine

protocol Coordinator {
    var navigationController: UINavigationController { get set }
    func start()
}
