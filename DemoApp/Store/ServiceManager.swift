//
//  ServiceManager.swift
//  GampzApp
//
//  Created by CSPC178 on 14/12/16.
//  Copyright © 2016 CSPC178cs. All rights reserved.
//

import UIKit
import Alamofire
import SVProgressHUD

class ServiceManager: NSObject {
    
    //MARK: Singleton Method
    class var sharedInstance: ServiceManager {
        struct Singleton {
            static let instance = ServiceManager()
        }
        return Singleton.instance
    }
    
    //MARK: Comman Post Method
    func postMethod(urlStr:String, parametersDic:NSDictionary, completion: @escaping (_ result: NSDictionary?, _ errorMessage: String?) -> Void) {
        
        Alamofire.request(urlStr, method: .post, parameters: parametersDic as? Parameters, encoding: JSONEncoding.default, headers: nil).responseJSON { (response:DataResponse<Any>) in
            
            switch(response.result) {
            case .success(_):
                if response.result.value != nil{
                    if let result = response.result.value as? NSDictionary {
                        
                        
                     //   print(result)
                        
                        if result["error"] != nil && !(result["error"] is NSNull){
                            
                            if result["message"] != nil && !(result["message"] is NSNull)
                            {
                                completion(nil,result["message"] as? String )
                            }
                       
                            else {
                                completion(nil,"Error occured, please check all details.")
                            }
                        }
                        else {
                            completion(result,nil)
                        }
                    }
                    else if let message = response.result.value as? String {
                        completion(nil,message)
                    }
                   // print(response.result.value ?? "Error")
                }
                else{
                    completion(nil,self.handleError(response: response))
                }
                break
            case .failure(_):
                completion(nil,self.handleError(response: response))
                break
            }
        }
    }
    
    func putMethod(urlStr:String, parametersDic:NSDictionary?, completion: @escaping (_ result: NSDictionary?, _ errorMessage: String?) -> Void) {
        
       // print(parametersDic ?? "")
        print(urlStr)
        Alamofire.request(urlStr, method: .put, parameters: parametersDic as? Parameters, encoding: JSONEncoding.default, headers: nil).responseJSON { (response:DataResponse<Any>) in
            switch(response.result) {
            case .success(_):
                if response.result.value != nil{
                    if let result = response.result.value as? NSDictionary {
                        
                        completion(result,nil)
                        print(result)
                        
                    }
                    else if let message = response.result.value as? String {
                        completion(nil,message)
                    }
               //     print(response.result.value ?? "Error")
                }
                else{
                    completion(nil,self.handleError(response: response))
                }
                break
            case .failure(_):
                completion(nil,self.handleError(response: response))
                break
            }
        }
    }
    
 
    
    func getMethod(urlStr:String, parametersDic:NSDictionary?, completion: @escaping (_ resultDic: NSDictionary?, _ resultArr:NSArray?, _ errorMessage: String?) -> Void) {
        
        SVProgressHUD.show()
        
        let strUrl1 = urlStr as NSString
        
        let urlStr = strUrl1.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        
        Alamofire.request(urlStr!, method: .get, parameters: parametersDic as? Parameters, encoding: JSONEncoding.default, headers: nil).responseJSON { (response:DataResponse<Any>) in
            
            SVProgressHUD.dismiss()
            switch(response.result) {

        case .success(_):
            
            if response.result.value != nil {
                if let result = response.result.value as? NSDictionary {
                    completion(result,nil,nil)
                }
                else if let resultArr = response.result.value as? NSArray {
                    completion(nil,resultArr,nil)
                }
                else if let message = response.result.value as? String {
                    completion(nil,nil,message)
                }
            }
            else {
                completion(nil,nil,self.handleError(response: response))
            }
            break
        case .failure(_):
            completion(nil,nil,self.handleError(response: response))
            break
            }
        }
    }
    
    func handleError(response:DataResponse<Any>) -> String {
        SVProgressHUD.dismiss()
        
        if let message = (response.result.error?.localizedDescription) {
            return message
        }
      //  print(response.result.error ?? "Failure")
        return "Somthing went wrong"
    }
    
}






