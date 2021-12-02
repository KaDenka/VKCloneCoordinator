//
//  LoginModel.swift
//  VKCloneWithCoordinator
//
//  Created by Denis Kazarin on 27.11.2021.
//

import SwiftUI

class LoginModel: ObservableObject {
    
    //MARK: VK verification data
    
    @Published var appID = "8015781"
    @Published var VKversion = "5.131"
    
    
    //MARK: User verification data
    
    @Published var isLogedIn: Bool = false
    @Published var userID: String = ""
    @Published var authToken: String = ""
}
