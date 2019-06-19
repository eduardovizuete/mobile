//
//  MarvelAPIManager.swift
//  marvelapp_start
//
//  Created by eduardo on 5/29/19.
//  Copyright © 2019 eduardo. All rights reserved.
//

import Foundation
import Moya
import RxSwift
import ObjectMapper
import Moya_ObjectMapper

extension Response {
  
  func removeAPIWrappers() -> Response {
    guard let json = try? self.mapJSON() as? Dictionary<String, AnyObject>,
      let results = json?["data"]?["results"] ?? [],
      let newData = try? JSONSerialization.data(withJSONObject: results, options: .prettyPrinted) else {
        return self
    }
    
    let newResponse = Response(statusCode: self.statusCode,
                               data: newData,
                               response: self.response)
    return newResponse
  }
  
}

struct MarvelAPIManager {
  
  let provider: MoyaProvider<MarvelAPI>
  let disposeBag = DisposeBag()
  
  init() {
    provider = MoyaProvider<MarvelAPI>()
  }
  
}

extension MarvelAPIManager {
  typealias AdditionalStepsAction = (() -> ())
  
  fileprivate func requestObject<T: Mappable>(_ token: MarvelAPI, type: T.Type,
                                              completion: @escaping (T?) -> Void,
                                              additionalSteps: AdditionalStepsAction? = nil) {
    provider.rx.request(token)
      .debug()
      .mapObject(T.self)
      .subscribe { event -> Void in
        switch event {
        case .success(let parsedObject):
          completion(parsedObject)
          additionalSteps?()
        case .error(let error):
          print(error)
          completion(nil)
        }
      }.disposed(by: disposeBag)
  }
  
  fileprivate func requestArray<T: Mappable>(_ token: MarvelAPI, type: T.Type,
                                             completion: @escaping ([T]?) -> Void,
                                             additionalSteps: AdditionalStepsAction? = nil) {
    provider.rx.request(token)
      .debug()
      .map { response -> Response in
        return response.removeAPIWrappers()
      }
      .mapArray(T.self)
      .subscribe { event -> Void in
        switch event {
        case .success(let parsedArray):
          completion(parsedArray)
          additionalSteps?()
        case .error(let error):
          print(error)
          completion(nil)
        }
      }.disposed(by: disposeBag)
  }
}

protocol MarvelAPICalls {
  func characters(query: String?, completion: @escaping ([Character]?) -> Void)
}

extension MarvelAPIManager: MarvelAPICalls {
  func characters(query: String? = nil, completion: @escaping ([Character]?) -> Void) {
    requestArray(.characters(query),
                 type: Character.self,
                 completion: completion)
  }
}
