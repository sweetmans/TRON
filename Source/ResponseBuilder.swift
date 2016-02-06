//
//  ResponseBuilder.swift
//  Hint
//
//  Created by Denys Telezhkin on 11.12.15.
//  Copyright © 2015 - present MLSDev. All rights reserved.
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

import Foundation
import SwiftyJSON

/**
 Default ResponseBuilder.
 */
public class ResponseBuilder<T:ResponseParseable>
{
    /// Initialize default response builder
    public init() {}
//    
//    /**
//     Create model from json response.
//     
//     - parameter json: SwiftyJSON.json instance
//     
//     - returns parsed model.
//     */
    public func buildResponseFromJSON(json : AnyObject) throws -> T {
        return T.from(json)
    }
}

public class SwiftyJSONResponseBuilder<T:JSONDecodable where T: ResponseParseable> : ResponseBuilder<T> {
    
}

/**
 Protocol for parsing JSON response. It is used as a generic constraint for `APIRequest` instance.
 */
public protocol JSONDecodable : ResponseParseable {
    
    /// Create model object from SwiftyJSON.JSON struct.
    init(json: JSON)
}

extension ResponseParseable where Self: JSONDecodable {
    public static func from(json: AnyObject) -> Self {
        return self.init(json: JSON(json))
    }
}