//
//  HTTPClient.swift
//  deviget
//
//  Created by Pedro Luis Valdivieso on 1/21/17.
//  Copyright © 2017 Pedro Luis Valdivieso. All rights reserved.
//

import UIKit

class HTTPClient: NSObject {
    
    static let sharedHTTPClient = HTTPClient()
    
    class func getQueryStringFrom(url: String, params: [String:Any]?) -> String {
        
        guard let params = params else {
            return url
        }
        
        var qs: String = "?"
        for (key, value) in params {
            if qs != "?" {
                qs += "&"
            }
            qs += key
            qs += "="
            qs += value is Int ? String(describing: value) : value as! String
        }
        
        return url + qs
    }
    
    class func convertToDictionary(text: String) -> [String: Any]? {
        if let data = text.data(using: .utf8) {
            do {
                return try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
            } catch {
                print(error.localizedDescription)
            }
        }
        return nil
    }
    
    func doGET(url: String,
               params: [String:Any]?,
               onSuccess successCallback: @escaping (_ response: [String:Any]) -> (),
               onFailure failureCallback: @escaping () -> ()) {
    
        let urlWithQueryString = HTTPClient.getQueryStringFrom(url: url, params: params)
        var request = URLRequest(url: URL(string: urlWithQueryString)!)
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            
            UIApplication.shared.isNetworkActivityIndicatorVisible = false
            
            guard let data = data, error == nil else {
                // check for fundamental networking error
                print("error=\(error)")
                failureCallback()
                return
            }
            
            if let httpStatus = response as? HTTPURLResponse,
                httpStatus.statusCode < 200,
                httpStatus.statusCode >= 300 {
                // check for http errors
                print("statusCode should be >= 200 or < than 300, but is \(httpStatus.statusCode)")
                print("response = \(response)")
                failureCallback()
                return
            }
            
            let responseJSONString = String(data: data, encoding: .utf8)
            let jsonDictionary = HTTPClient.convertToDictionary(text: responseJSONString!)
            successCallback(jsonDictionary!)
        }
        
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        task.resume()
    }

}
