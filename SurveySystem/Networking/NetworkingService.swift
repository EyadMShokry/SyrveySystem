//
//  NetworkingService.swift
//  SurveySystem
//
//  Created by Eyad Shokry on 2/2/21.
//  Copyright © 2021 Eyad Shokry. All rights reserved.
//

import Foundation
import Moya

class NetworkingService {
    
    private init() {}
    
    static let shared = NetworkingService()
    
    static private let publicKey = ""
    static private let privateKey = ""

    
//    let provider = MoyaProvider<MadmoonAPI>(plugins: [CredentialsPlugin { _ -> URLCredential? in
//        return URLCredential(user: publicKey, password: privateKey, persistence: .none)
//        }
//    ])
}
