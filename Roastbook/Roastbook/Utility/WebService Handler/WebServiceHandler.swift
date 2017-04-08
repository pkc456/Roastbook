//
//  WebServiceHandler.swift
//

//MARK:- README
/*
 // I have created one generic method (apiRequest) for Api call.
 // Create individual method for each dedicated api call like I do
*/

import UIKit
import Alamofire

class WebServiceHandler: NSObject {

    class var sharedInstance: WebServiceHandler {
        struct Static {
            static let instance: WebServiceHandler = WebServiceHandler()
        }
        return Static.instance
    }
    
    // MARK: Common Request
    func apiRequest( method: Alamofire.HTTPMethod, url: String, completion:@escaping ( _ finished: Bool, _ response: AnyObject?) ->Void) {
        
        Alamofire.request(url, method: method).responseJSON { response in
            if let JSON = response.result.value {
                completion(true, JSON as AnyObject?)
            } else {
                completion(false, response.result.error as AnyObject?)
            }
        }
    }
    
    
}
