//
//  VKAPIService.swift
//  SwiftUIVK
//
//  Created by Denis Kazarin on 08.11.2021.
//

import Foundation
import Alamofire
import SwiftUI

class VKAPIService {
    
    @ObservedObject var loginModel = LoginModel()
    
    private let baseUrl = "https://api.vk.com/"
    
    init(loginModel: LoginModel) {
        self.loginModel = loginModel
    }
    
    func friendsListRequest(_ completion: @escaping (FriendsList?) -> ()) {
        let friendsGetUrl = baseUrl + "method/friends.get"
        let parameters: Parameters = [
            "user_id": loginModel.userID,
            "fields": "photo_50",
            "access_token": loginModel.authToken,
            "v": loginModel.VKversion
        ]
        
        AF.request(friendsGetUrl, method: .get, parameters: parameters).responseData { response in
            
            let jsonDecoder = JSONDecoder()
            
            switch response.result {
            case .success:
                if let data = response.data {
                    do {
                        let friends = try jsonDecoder.decode(FriendsList.self, from: data)
                        completion(friends)
                    } catch let error {
                        print(error.localizedDescription)
                        
                    }
                }
                
            case .failure(let error):
                print(error)
                
            }
        }
    }
    
    func groupsListRequest(_ completion: @escaping (GroupsList?) -> ()) {
        
        let groupsGetUrl = baseUrl + "method/groups.get"
        let parameters: Parameters = [
            "user_id": loginModel.userID,
            "extended": "1",
            "fields": "description",
            "access_token": loginModel.authToken,
            "v": loginModel.VKversion
        ]
        
        AF.request(groupsGetUrl, method: .get, parameters: parameters).responseData { response in
            
            let jsonDecoder = JSONDecoder()
            
            switch response.result {
            case .success:
                if let data = response.data {
                    do {
                        let groups = try jsonDecoder.decode(GroupsList.self, from: data)
                        completion(groups)
                    } catch let error {
                        print(error.localizedDescription)
                        
                    }
                }
                
            case .failure(let error):
                print(error)
                
            }
        }
    }
    
    func photosCollectionRequest(_ completion: @escaping (PhotosCollection?) -> ()) {
        let photosGetUrl = baseUrl + "method/photos.get"
        let parameters: Parameters = [
            "user_id": loginModel.userID,
            "album_id": "wall",
            "photo_sizes": "1",
            "access_token": loginModel.authToken,
            "v": loginModel.VKversion
        ]
        
        AF.request(photosGetUrl, method: .get, parameters: parameters).responseData { response in
            
            let jsonDecoder = JSONDecoder()
            
            switch response.result {
            case .success:
                if let data = response.data {
                    do {
                        let photos = try jsonDecoder.decode(PhotosCollection.self, from: data)
                        completion(photos)
                    } catch let error {
                        print(error.localizedDescription)
                        
                    }
                }
            case .failure(let error):
                print(error)
            }
        }
        
    }
    
    func newsFeedRequest(_ completion: @escaping (NewsList?) -> ()) {
        let newsGetUrl = baseUrl + "method/newsfeed.get"
        let parameters: Parameters = [
            "user_id": loginModel.userID,
            "count": "30",
            "access_token": loginModel.authToken,
            "v": loginModel.VKversion
        ]
        
        AF.request(newsGetUrl, method: .get, parameters: parameters).responseData { response in
            
            let jsonDecoder = JSONDecoder()
            
            switch response.result {
            case .success:
                if let data = response.data {
                    do {
                        let news = try jsonDecoder.decode(NewsList.self, from: data)
                        completion(news)
                    } catch let error {
                        print(error.localizedDescription)
                    }
                }
                
            case .failure(let error):
                print(error)
                
            }
        }
    }
}
