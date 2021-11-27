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
    private var cancellables: Set<AnyCancellable> = []
    
    init(navigationController: UINavigationController) {
        let loginView = LoginView(model: loginModel)
        let loginVC = UIHostingController(rootView: loginView)
        self.navigationController = UINavigationController(rootViewController: loginVC)
    }
    
    func start() {
        //MARK: Subscraibing for auth changes, checking authorization and adding the events in true and false cases
        loginModel.$isLogedIn.subscribe(on: RunLoop.main).sink { [weak self] isLogedIn in
            guard let self = self else { return }
            if !isLogedIn {
                self.navigationController.popToRootViewController(animated: true)
            } else {
                let tabbarVC = self.buildTabbarVC()
                self.navigationController.pushViewController(tabbarVC, animated: true)
            }
        }.store(in: &cancellables)
    }
    
    private func buildTabbarVC() -> UIViewController {
        let tabbarView = TabbarView(model: loginModel)
        return UIHostingController(rootView: tabbarView)
    }
}
