//
//  SurveySystemAPI.swift
//  SurveySystem
//
//  Created by Eyad Shokry on 3/12/21.
//  Copyright © 2021 Eyad Shokry. All rights reserved.
//

import Moya

public enum SurveySystemAPI {
    case login(email: String, password: String)
    
}

extension SurveySystemAPI: TargetType {
    
    public var baseURL: URL {
        switch self {
        default: return URL(string: "https://host.optimalsolutionslebanon.com/~da7i7a/feedback/api/")!
        }
    }
    
    public var path: String {
        switch self {
        case .login: return "login"
            
        }
    }
    
    public var method: Moya.Method {
        switch self {
//        case .insertEssayQuestionLE, .insertMcqQuestionLE, .insertTFQuestionLE, .insertLiveExamAnswer,
//             .updateEssayQuestionLE, .updateMcqQuestionLE, .updateTFQuestionLE, .insertStudentTeacherRequest: return .post
        default: return .get
        }
    }
    
    public var sampleData: Data {
        return Data()
    }

    public var task: Task {
        switch self {
        case .login(email: let email, password: let password):
            return .requestParameters(parameters: ["email" : email, "password" : password], encoding: URLEncoding.queryString)
        default:
            return .requestPlain

        }
    }
    
    public var headers: [String: String]? {
        switch self {
        default: return ["Content-Type": "application/json"]
        }
    }
    
    public var validationType: ValidationType {
        return .successCodes
    }

}
