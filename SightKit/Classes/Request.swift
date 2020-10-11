//
//  request.swift
//  SightKit
//
//  Created by 湛奇 on 2020/10/11.
//

import Foundation

public typealias ConfigRqHeadClosure = () -> [String:String]

public enum Local_Error : Error {
    ///url is nil
    case null_url
    ///create URL from string failed
    case invalid_url
    ///create Data frome dictionary failed
    case invalid_paramDic_to_data
    ///create JsonObject frome responseData failed
    case invalid_responseData_to_jsonDic
}

public var api_timeout:TimeInterval = 30

public enum RequestMethod:String{
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
}

@objc public class RPHead: NSObject, Codable {
    public let cost:Int64?
    public let errCode:String?
    public let errMsg:String?
}


/// only for error decode
@objc public class RPEmpty: NSObject, Codable {
    public let head:RPHead?
}


/*
 @objc public class RPLoginSuccess: NSObject, Codable {
     public let head:RPHead?
     public let body:RPLoginSuccessBody?
 }
 @objc public class RPLoginSuccessBody: NSObject, Codable {
     public var avatar : String?
     public var customerId : String?
     public var customerType : Int32?
     public var loginName : String?
     public var mobileNo : String?
     public var starLevel : Int32?
     public var starLevelName : String?
     public var token : String?
     public var webInfo : String?
 }
 */

/// every response will pass here ,so we can deal with app level errors
public var appLevelRequestResponse:((_ data:Data?,_ response:URLResponse?,_ error:Error?)->())?
/// open log for normal request result
public var openRequestLog = false

public func skRq<T:Decodable>(urlString:String?,method:RequestMethod = .get,paraDic:[String:Any]=[:],configRqHead:ConfigRqHeadClosure? = nil, rpClosure: @escaping (Data?, URLResponse?, Error?,T?) -> Void)  {
    guard let urlString = urlString else {
        print("Error: urlString is null")
        
        rpClosure(nil,nil,Local_Error.null_url,nil)
        return
    }
    
    var request:URLRequest!
    var finalParaDic = [String:Any]()

    if (method == .get){
        var fixString = ""
        if paraDic.count > 0 {
            fixString.append("?")
            paraDic.forEach { (key: String, value: Any) in
                if (fixString.count>1){
                    fixString.append("&")
                }
                fixString.append(key)
                fixString.append("=")
                fixString.append("\(value)")
            }
        }
        
        let finalStr = urlString+fixString
        guard let url = URL(string: finalStr) else {
            print("Error: cannot create url with urlString:\(urlString)")
            
            rpClosure(nil,nil,Local_Error.invalid_url,nil)
            return
        }
        
        request = URLRequest(url: url)
        request.timeoutInterval = api_timeout
        request.httpMethod = method.rawValue
        if let headDic = configRqHead?(){
            headDic.forEach { (key,value) in
                request.setValue(value, forHTTPHeaderField: key)
            }
        }

    }else{
        guard let url = URL(string: urlString) else {
            print("Error: cannot create url with urlString:\(urlString)")
            
            rpClosure(nil,nil,Local_Error.invalid_url,nil)
            return
        }
        
        //先添加需要的数据到finalParaDic
        //然后添加传进来的数据到fainalParaDic
        paraDic.forEach { (key: String, value: Any) in
            finalParaDic[key] = value
        }
        
        request = URLRequest(url: url)
        request.timeoutInterval = api_timeout
        request.httpMethod = method.rawValue
        var jsonData:Data
        do {
            jsonData = try JSONSerialization.data(withJSONObject: finalParaDic, options: [])
            request.httpBody = jsonData
        } catch {
            print("Error: cannot creat Json from paraDic \(String(describing: finalParaDic))")
            
            rpClosure(nil,nil,Local_Error.invalid_paramDic_to_data,nil)
            return
        }
        
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        if let headDic = configRqHead?(){
            headDic.forEach { (key,value) in
                request.setValue(value, forHTTPHeaderField: key)
            }
        }
    }
    
    let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
        //for log
        if (openRequestLog){
            print("url:",request.url?.absoluteString ?? "")
            print("headFields:",request.allHTTPHeaderFields ?? "")
            print("param:",finalParaDic)
            if let data = data {
                let json = try? JSONSerialization.jsonObject(with: data,options:.allowFragments) as? [String: Any]
                print("json:",json ?? "")
                if json == nil {
                    let str = String(data: data, encoding: String.Encoding.utf8) ?? ""
                    print("string:",str)
                }
            }
        }
        if error != nil {
            print("Error: ",error.debugDescription)
        }
        if data == nil && error == nil &&  response != nil {
            print("response:",response.debugDescription)
        }

        //return block
        let newData:Data = data ?? Data()
        let model = try? JSONDecoder().decode(T.self, from: newData)
        rpClosure(data,response,error,model)
        
        //for app level error handle
        DispatchQueue.main.async {
            if let appLevelRequestResponse = appLevelRequestResponse{
                appLevelRequestResponse(data,response,error)
            }
        }
    }
    task.resume()
}


public func errorTipFrom(head:RPHead?, response: URLResponse?,error:Error?)->String?{
    if error != nil {
        return error?.localizedDescription
    }
    if head != nil {
        if head?.errCode != "0000"{
            return head?.errMsg
        }
    }
    return nil
}


