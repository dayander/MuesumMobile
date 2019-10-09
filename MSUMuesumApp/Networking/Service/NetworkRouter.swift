//
//  NetworkRouter.swift
//  MSUMuesumApp
//
//  Created by Anderson Day on 10/1/19.
//  Copyright © 2019 Anderson Day. All rights reserved.
//

import Foundation


public typealias NetworkRouterCompletion = (_ data: Data?,_ response: URLResponse?,_ error: Error?)->()
protocol NetworkRouter: class {
    associatedtype Endpoint: EndPointType
    func request(_ route: Endpoint, completion: @escaping NetworkRouterCompletion)
    func cancel()
}
