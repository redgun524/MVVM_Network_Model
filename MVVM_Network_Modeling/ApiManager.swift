//
//  ApiManager.swift
//  MVVM-Network-Modeling
//
//  Created by  Pumpapapumpa on 2017. 8. 22..
//  Copyright © 2017년 Pumpa. All rights reserved.
//

import Alamofire
import SwiftyJSON

final class ApiManager {
    
    static let PATH_MATCHING_LIST = "session/test/matchinglist"
    
    static var matching: ApiMatching {
        return ApiMatching()
    }
    lazy var member = ApiMember()
    
    class ApiBase {
        //본 서버
        internal let baseURL = "https://noldamapp.com:4000"
        
        var authHeaders: [String : String] {
            return ["Authorization" : "SessionModel.getToken()"]
        }
        
        func request(path: String, method: HTTPMethod, params: [String : Any]?, withHeader: Bool, completion: @escaping (JSON) -> Void, error: @escaping (ErrorCode) -> Void) {
            let encoding: ParameterEncoding = method == .get ? URLEncoding.queryString : JSONEncoding.default
            let header = withHeader ? authHeaders : nil
            Alamofire.request("\(baseURL)/\(path)", method: method, parameters: params, encoding: encoding, headers: header).validate().responseJSON { res in
                switch res.result {
                case .success(let value):
                    let data = JSON(value)
                    completion(data)
                case .failure:
                    error(ErrorCode(rawValue: res.response?.statusCode ?? 0) ?? .badNetwork)
                }
            }
        }
    }
    
    //Matching 관련 요청입니다.
    class ApiMatching: ApiBase {
        
        func fetchMatchingList(id: Int, errorHandling: ErrorHandling, completion: @escaping ([MatchingVO]) -> Void) {
            let params: [String : Any] = ["id" : id]
            request(path: ApiManager.PATH_MATCHING_LIST, method: .get, params: params, withHeader: false, completion: { data in
                var matchingList = [MatchingVO]()
                for item in data.arrayValue {
                    matchingList.append(MatchingVO(json: item))
                }
                completion(matchingList)
            }, error: { code in
                errorHandling.showError(code: code)
            })
        }
    }
    
    //Member 관련 요청입니다.
    class ApiMember: ApiBase {
        
        func fetchMemberList(id: Int, errorHandling: ErrorHandling, completion: @escaping ([MatchingVO]) -> Void) {
            let params: [String : Any] = ["id" : id]
            request(path: ApiManager.PATH_MATCHING_LIST, method: .get, params: params, withHeader: false, completion: { data in
                var matchingList = [MatchingVO]()
                for item in data.arrayValue {
                    matchingList.append(MatchingVO(json: item))
                }
                completion(matchingList)
            }, error: { code in
                errorHandling.showError(code: code)
            })
            
        }
    }
    
    
}
