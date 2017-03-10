//
//  NetworkModel.swift
//  CleanArchitectureRxSwift
//
//  Created by Andrey Yastrebov on 10.03.17.
//  Copyright © 2017 sergdort. All rights reserved.
//

import Foundation
import Alamofire
import Domain
import RxAlamofire
import RxSwift
import ObjectMapper

private let ApiEndpoint = "https://jsonplaceholder.typicode.com"

public final class NetworkModel {

    func fetchPosts() -> Observable<[Post]> {
        return RxAlamofire
            .json(.get, ApiEndpoint + "/posts")
            .debug()
            .catchError { error in
                return Observable.never()
            }
            .flatMap({ json -> Observable<[Post]> in
                Observable.just(try Mapper<Post>().mapArray(JSONObject: json))
            })
    }

    func fetchUser(userId: Int) -> Observable<User> {
        return RxAlamofire
            .request(.get, ApiEndpoint + "/users/\(userId)")
            .debug()
            .catchError { error in
                return Observable.never()
            }
            .flatMap({ json -> Observable<User> in
                Observable.just(try Mapper<User>().map(JSONObject: json))
            })
    }
}
