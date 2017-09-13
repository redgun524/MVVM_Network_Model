//
//  ErrorHandling.swift
//  MVVM_Network_Modeling
//
//  Created by  noldam on 2017. 9. 1..
//  Copyright © 2017년 Pumpapapumpa. All rights reserved.
//

protocol ErrorHandling: class {
    func showError(code: ErrorCode)
}

enum ErrorCode: Int {
    case badRequest = 400
    case unauthorized = 401
    case forbidden = 403
    case notFound = 404
    case serverInternalError = 500
    case badNetwork = 0
    
    var description: String {
        switch self {
        case .badRequest:
            return "잘못된 요청입니다."
        case .unauthorized:
            return "로그인이 만료되었습니다."
        case .forbidden:
            return "접근이 제한되었습니다."
        case .notFound:
            return "요청 경로가 잘못되었습니다."
        case .serverInternalError:
            return "서버 상의 문제가 발생하였습니다.\n불편을 드려 정말 죄송합니다.\n해당 문제는 개발자에게 문의 부탁드립니다."
        case .badNetwork:
            return "인터넷 연결을 확인주세요."
        }
    }
}
