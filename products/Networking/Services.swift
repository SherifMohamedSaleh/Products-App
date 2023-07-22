//
//  Services.swift
//  gk
//
//  Created by Sherif Abd El-Moniem on 30/01/2022.
//


import Alamofire
import RxSwift



class BaseAPI<T: TargetType> : BaseService {
    
      func Request<M: Decodable>(target: T, responseClass: M.Type)  async throws -> M  {
        let method = Alamofire.HTTPMethod(rawValue: target.method.rawValue)
        let headers = buildHeader(type: target.headers)
        let params = buildParams(task: target.task)
        printRequest(target: target)
        
        // build request
        let task = AF.request(target.baseURL + target.path, method: method , parameters: params.0, encoding: params.1 , headers: headers )
        // send request
        let response = await task.serializingDecodable(M.self).response // Returns full
          
        // check if th
        if let error = response.error {
            throw(NetworkError.customError(error: error))
        }else {
            guard let statusCode =  response.response?.statusCode  else {
                throw(NetworkError.error)
            }
            print(statusCode)
            if statusCode == ServerStatusCodes.Successed.rawValue {
                switch response.result {
                case  .success(let success):
                    return success
                case .failure(let error):
                    throw(NetworkError.customErrorWithCode(errrMessage: error, withCode: ServerStatusCodes.init(rawValue: statusCode)!))
                }
            } else{
                throw(NetworkError.errorCode(withCode: ServerStatusCodes.init(rawValue: statusCode)!))
            }
        }
    }
    /// build parmeters and encoding
    private func buildParams(task: RequestTask) -> ([String:Any], ParameterEncoding) {
        switch task {
        case .requestPlain:
            return ([:], URLEncoding.default)
        case .requestParameters(parameters: let parameters, encoding: let encoding):
            return (parameters, encoding)
        }
    }
    
    /// build request  headers
    private func buildHeader(type : RequestHeader) -> HTTPHeaders {
        switch type {
        case .anonymous:
            return anonymousHeaders
        case .authorized:
            return authorizedHeaders
        }
    }
    
    /// print request
    private func printRequest(target: T) {
        print("------Start------")
        print("request called: \(target.baseURL)\(target.path)")
        print("http method: \(target.method)")
        print("headers: \(target.headers)")
        print("parameters: \(target.task)")
        print("------End------")
    }
}

