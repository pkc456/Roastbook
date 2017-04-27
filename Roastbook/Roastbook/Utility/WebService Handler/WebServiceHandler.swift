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
  func apiGetRequest( method: Alamofire.HTTPMethod, url: String, completion:@escaping ( _ finished: Bool, _ response: AnyObject?) ->Void) {
    
    Alamofire.request(url, method: method).responseJSON { response in
      if let JSON = response.result.value {
        completion(true, JSON as AnyObject?)
      } else {
        completion(false, response.result.error as AnyObject?)
      }
    }
  }
  
  func apiPostRequest( method: Alamofire.HTTPMethod, parameters:Parameters, url: String, completion:@escaping ( _ finished: Bool, _ response: AnyObject?) ->Void) {
    
    Alamofire.request(url, method: method, parameters: parameters, encoding: JSONEncoding.default, headers: nil).responseJSON { (response) in
      if let JSON = response.result.value {
        completion(true, JSON as AnyObject?)
      } else {
        completion(false, response.result.error as AnyObject?)
      }
    }
  }
  
  func getMirrorInformation(paginationIndex:Int, isShowLoader:Bool, successBlock:@escaping ( _ result : MirrorRoot) -> Void,failureBlock:@escaping (_ error:NSError)->Void)
  {
    if(isShowLoader == true){
      Utility.showLoader()
    }
    
    var url = MIRROR_URL
    url = url.replacingOccurrences(of: "$", with:  String(paginationIndex))
    url = BASE_URL+url
    
    self.apiPostRequest(method: .post, parameters: [:], url: url) { (finished, response) in
      if(finished){
        if let dictionaryPlayout = response{
          let mirrorInformationModelObject = MirrorBusinessLayer.sharedInstance.parseData(data: dictionaryPlayout as! Dictionary<String, Any>)
          successBlock(mirrorInformationModelObject)
        }
        Utility.hideLoader()
      }else{
        let error = response as! NSError
        failureBlock(error)
        Utility.hideLoader()
      }
    }
    
  }
  
}
