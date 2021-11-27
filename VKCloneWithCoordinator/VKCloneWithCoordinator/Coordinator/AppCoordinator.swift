//
//  AppCoordinator.swift
//  VKCloneWithCoordinator
//
//  Created by Denis Kazarin on 27.11.2021.
//

import UIKit
import SwiftUI
import Combine

class AppCoordinator: Coordinator {
    //MARK: Protocol property
    var navigationController: UINavigationController
    
    //MARK: Additional properties
    private let loginModel = LoginModel()
    private var calcelLables: Set<AnyCancellable> = []
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        //MARK: Subscraibing for auth changes, checking authorization and adding the events in true and false cases
        loginModel.$isLogedIn.subscribe(on: RunLoop.main).sink { [weak self] isLoggedIn in
            guard let self = self else { return }
            if !isLoggedIn {
                self.navigationController.popToRootViewController(animated: true)
            } else {
                let tabbarVC = self.buildTabbarVC()
                self.navigationController.pushViewController(tabbarVC, animated: true)
            }
        }
    }
    
    private func buildTabbarVC() -> UIViewController {
        let tabbarView = TabbarView()
        return UIHostingController(rootView: tabbarView)
    }
}
