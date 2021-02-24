import Foundation
import UIKit

extension Data {
    mutating func append(_ string: String) {
        if let data = string.data(using: .utf8, allowLossyConversion: false) {
            append(data)
        }
    }
}

class BaseNetwork {
    
    //MARK: - Configure POST Request
    private func configurePostRequest( request:inout NSMutableURLRequest,requestMessage:NetworkRequestMessage){
        
        request.httpMethod = "POST"
        
        if(requestMessage.contentType == ContentType.JSON){
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            
            do {
                let jsonData = try JSONSerialization.data(withJSONObject: requestMessage.params, options: .prettyPrinted)
                request.httpBody = jsonData
            } catch _ {
                /* TODO: Finish migration: handle the expression passed to error arg: error */
            }
        }else if requestMessage.contentType == ContentType.HTML {
            
            var queryString = ""
            
            for (key,value) in requestMessage.params {
                let valueString = "\(value)".htmlEncodedString()
                queryString = "\(queryString)\(key)=\(valueString)&"
            }
            
            print("----- POST Request -----")
            print("URL : \(String(describing: request.url))")
            print("Query String : \(queryString)")
            print("----- POST Request -----")
            request.httpBody = queryString.data(using: String.Encoding.utf8)
        }
        
    }
    //MARK: - Configure Get Request
    private func configureGetRequest(request:inout NSMutableURLRequest , requestMessage : NetworkRequestMessage) {
        
        request.httpMethod = "GET"
        let queryString = ""

        if let reallyURL = NSURL(string: requestMessage.url ){//+ "?" + queryString){
            request.url = reallyURL as URL
        }
        else{
            
        }
        
        print("----- GET Request -----")
        print("URL : \(String(describing: request.url))")
        print("Query String : \(queryString)")
        print("----- GET Request -----")
    }
    
    private func configureRequest (request:inout NSMutableURLRequest , requestMessage : NetworkRequestMessage) {
        
        switch requestMessage.requestType {
            
        case RequestType.GET:
            
            self.configureGetRequest(request: &request, requestMessage: requestMessage)
            
        case RequestType.POST:
            
            self.configurePostRequest(request: &request, requestMessage: requestMessage)
            
        case RequestType.PUT:
            
            request.httpMethod = "PUT"
            
        case RequestType.DELETE:
            
            request.httpMethod = "DELETE"
            
        case RequestType.HEAD:
            
            request.httpMethod = "HEAD"
            
        case RequestType.OPTIONS:
            
            request.httpMethod = "OPTIONS"
            
        }
    }
    private func addCustomHeaders(request:inout NSMutableURLRequest){
        
        request.addValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        // request.addValue(Global.shared.API_TOKEN, forHTTPHeaderField: "Authorization")
        
    }
    private  func addTokenHeader (request:inout NSMutableURLRequest){          
        request.addValue("Bearer \("Global.shared.headerToken")", forHTTPHeaderField: "Authorization")
    }
    
    //MARK: - Perform Get NetWork Call
    func performNetworkTask(isToken:Bool,requestMessage : NetworkRequestMessage, complete: @escaping ((_ responseMessage: NetworkResponseMessage)->Void)) {
        
        let responseMessage = NetworkResponseMessage()
        
        if let reallyURL = NSURL(string: requestMessage.url){
            
            var request = NSMutableURLRequest(url: reallyURL as URL)
            if isToken{
                self.addTokenHeader(request: &request)
            }
            self.configureRequest(request: &request, requestMessage: requestMessage)
            
            let session = URLSession(configuration: .default)
            
            let task = session.dataTask(with: request as URLRequest, completionHandler: { (incomingData, response, error) in
                
                if let err = error{
                    if err.localizedDescription.contains("timed out"){
                        responseMessage.statusCode = StatusCode.Timeout
                    }else{
                        responseMessage.statusCode = StatusCode.Failure
                    }
                    responseMessage.message = err.localizedDescription
                }else if let incomingData = incomingData {
                    let responseInStringFormat : String = String(data: incomingData, encoding: String.Encoding.utf8)!
                    print("----- Response -----")
                    print("\(responseInStringFormat)")
                    print("----- Response -----")
                    
                    responseMessage.statusCode = StatusCode.Success
                    responseMessage.message = "Success"
                    responseMessage.data = incomingData as AnyObject?
                }
                complete(responseMessage)
            })
            task.resume()
        }
    }
    
    //MARK: - Get NetWork Call
    func performGetNetworkTask(requestMessage : NetworkRequestMessage, complete: @escaping ((_ responseMessage: NetworkResponseMessage)->Void)) {
        
        let responseMessage = NetworkResponseMessage()
        
        let  reallyURL = requestMessage.completeUrl
        var request = NSMutableURLRequest(url: reallyURL as URL)
        self.addCustomHeaders(request: &request)
        
        
        let session = URLSession(configuration: .default)
        
        let task = session.dataTask(with: request as URLRequest, completionHandler: { (incomingData, response, error) in
            
            if let err = error{
                if err.localizedDescription.contains("timed out"){
                    responseMessage.statusCode = StatusCode.Timeout
                }else{
                    responseMessage.statusCode = StatusCode.Failure
                }
                responseMessage.message = err.localizedDescription
            }else if let incomingData = incomingData {
                let responseInStringFormat : String = String(data: incomingData, encoding: String.Encoding.utf8)!
                print("----- Response -----")
                print("\(responseInStringFormat)")
                print("----- Response -----")
                
                responseMessage.statusCode = StatusCode.Success
                responseMessage.message = "Success"
                responseMessage.data = incomingData as AnyObject?
            }
            complete(responseMessage)
        })
        task.resume()
    }
    
}
extension NSMutableData {
    
    func appendString(string: String) {
        let data = string.data(using: String.Encoding.utf8,allowLossyConversion: true)
        append(data!)
    }
    
}

