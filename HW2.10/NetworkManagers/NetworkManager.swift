//
//  NetworkManager.swift
//  HW2.10
//
//  Created by Алексей Маслобоев on 04.03.2020.
//  Copyright © 2020 Алексей Маслобоев. All rights reserved.
//

import Alamofire

class NetworkManager {
    
    static let shared = NetworkManager()
    
    func fetchData(with source: Source, completion: @escaping ([DataProtocol]) -> Void) {
        AF.request(source.url).validate().responseData() { (response) in
            switch response.result {
                case .success(let data):
                    completion(source.getItems(from: data))
                case .failure(let error):
                    print(error);
            }
        }
    }
    
}
