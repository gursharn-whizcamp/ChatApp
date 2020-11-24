////
////  WebService.swift
//  AutoForce
//
//  Created by Apple2 on 20/08/19.
//  Copyright © 2019 Apple2. All rights reserved.
//

import Foundation
//import Alamofire
import Foundation
import MobileCoreServices
import AVKit
import AVFoundation

typealias GoogleAutocompleteResponseReturn = (String?, String?, NSDictionary?) -> Void
typealias ServiceResponseReturn = (Bool?, String?, NSDictionary?) -> Void
typealias ServiceResponseString = (Bool?, String?) -> Void

class WebServices : NSObject, URLSessionDelegate, URLSessionTaskDelegate, URLSessionDataDelegate {
//
//
//    var responseData = NSMutableData()
//    var requestData : Data?
//
//
//    func isInternetWorking() -> (Bool) {
//        if Reachability.isConnectedToNetwork(){
//            print("Internet Connection Available!")
//            return true
//        }else{
//            print("Internet Connection not Available!")
//            return false
//        }
//    }
//
//    //Post Request
//    func postRequest(methodName:String, params:NSDictionary?, oncompletion:@escaping ServiceResponseReturn) {
//        if !isInternetWorking() {
//            oncompletion(false,AppMessages.noInternetConnection,nil)
//            return
//        }
//        var request = URLRequest(url: URL(string: ApiServiceName.serverUrl + methodName)!)
//        print(request)
//        request.httpMethod = "POST"
//        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
//        request.addValue("7890abcdefghijkl", forHTTPHeaderField: "X-custom-header")
//        request.httpBody = try? JSONSerialization.data(withJSONObject: params ?? NSDictionary())
//
//        Alamofire.request(request).responseJSON { (response) in
//            if response.result.value != nil {
//                if let response = response.result.value as? [String : Any] {
//                    print(response)
//                    let success = response["success"] as? Bool
//                    let message = response["message"] as? String
//                    oncompletion(success,message,response as NSDictionary)
//                }
//            } else {
//                oncompletion(false, AppMessages.foundSnag, nil)
//            }
//        }
//    }
//
//
//    func googleAutoComplete(methodName:String, params:NSDictionary?, oncompletion:@escaping GoogleAutocompleteResponseReturn) {
//        if !isInternetWorking() {
//            oncompletion("",AppMessages.noInternetConnection,nil)
//            return
//        }
//
//        var request = URLRequest(url: URL(string: methodName)!)
//        request.httpMethod = "POST"
//
//        request.httpBody = try? JSONSerialization.data(withJSONObject: params ?? NSDictionary())
//
//        Alamofire.request(request).responseJSON { (response) in
//            if response.result.value != nil {
//                if let response = response.result.value as? [String : Any] {
//                    print(response)
//                    let success = response["status"] as? String
//                    let message = response["message"] as? String
//                    oncompletion(success,message,response as NSDictionary)
//                }
//            } else {
//            oncompletion("", AppMessages.foundSnag, nil)
//            }
//        }
//    }
//
//    // get map request
//    func getMapRequest(methodName:String, params:NSDictionary?, oncompletion:@escaping ServiceResponseReturn) {
//        if !isInternetWorking() {
//            oncompletion(false,AppMessages.noInternetConnection,nil)
//            return
//        }
//
//        request(URL(string: methodName)!, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil).responseJSON { (response) in
//            if response.result.value != nil {
//                if let response = response.result.value as? [String : Any] {
//                    print(response)
//                    let success = response["status"] as? Bool
//                    let message = response["message"] as? String
//                    oncompletion(success,message,response as NSDictionary)
//                }
//            } else {
//                if let err = response.error as? URLError, err.code == .notConnectedToInternet || err.code == .networkConnectionLost {
//                    oncompletion(false,AppMessages.noInternetConnection,nil)
//
//                } else {
//                    oncompletion(false, AppMessages.foundSnag, nil)
//                }
//            }
//        }
//    }
//
//    //Get Request
//    func getRequest(methodName:String, params:NSDictionary?, oncompletion:@escaping ServiceResponseReturn) {
//        if !isInternetWorking() {
//            oncompletion(false,AppMessages.noInternetConnection,nil)
//            return
//        }
//
//        let header: HTTPHeaders = [
//            "Content-Type" : "application/json",
//            "X-custom-header":"7890abcdefghijkl"
//        ]
//
//        request(URL(string: ApiServiceName.serverUrl + methodName)!, method: .get, parameters: params as? Parameters, encoding: URLEncoding.default, headers: header).responseJSON { (response) in
//            if response.result.value != nil {
//                if let response = response.result.value as? [String : Any] {
//                    print(response)
//                    let success = response["success"] as? Bool
//                    let message = response["message"] as? String
//                    oncompletion(success,message,response as NSDictionary)
//                }
//            } else {
//                if let err = response.error as? URLError, err.code == .notConnectedToInternet || err.code == .networkConnectionLost {
//                    oncompletion(false,AppMessages.noInternetConnection,nil)
//
//                } else {
//                    oncompletion(false, AppMessages.foundSnag, nil)
//                }
//            }
//        }
//    }
//
//
//    // Upload video New
//
//    func uploadVideo(url:String?,uploadUrlString:String,param:NSDictionary?) throws -> URLRequest{
//
//
//            let request = NSMutableURLRequest(url: URL(string:uploadUrlString)!)
//            request.httpMethod = "POST"
//
//            let boundary = generateBoundaryString()
//            request.cachePolicy = .useProtocolCachePolicy
//            request.timeoutInterval = 20
//            request.setValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")
//            requestData = try createBody(with: param as? [String : String], filePathKey: "file", paths: [url!], boundary: boundary)
//            return request as URLRequest
//
//        }
//
//        // MARK: - Uploading videos
//
//        func uploadFiles(_ request: URLRequest, data: Data) {
//            let configuration = URLSessionConfiguration.default
//            let session = Foundation.URLSession(configuration: configuration, delegate: self, delegateQueue: OperationQueue.main)
//            let task = session.uploadTask(with: request, from: data)
//            task.resume()
//        }
//
//        func urlSession(_ session: URLSession, task: URLSessionTask, didCompleteWithError error: Error?) {
//            if error != nil {
//                print("session \(session) occurred error \(String(describing: error?.localizedDescription))")
//
//                //self.model!.updateUploadingStatusVideos!(false,nil)
//
//            } else {
//                print("session \(session) upload completed, response: \(String(describing: NSString(data: responseData as Data, encoding: String.Encoding.utf8.rawValue)))")
////                DispatchQueue.main.async {
//
//                    do {
//                        let json = try JSONSerialization.jsonObject(with: self.responseData as Data, options: .mutableContainers) as? [String:Any]
//                        print(json)
//                        //self.model!.updateUploadingStatusVideos!(true,json as! NSDictionary)
//                        //FileManager.default.clearTmpDirectory()
//                    } catch {
//                        print("Something went wrong")
//                       // self.model!.updateUploadingStatusVideos!(false,nil)
//                    }
////                }
//            }
//        }
//
//
//        func urlSession(_ session: URLSession, task: URLSessionTask, didSendBodyData bytesSent: Int64, totalBytesSent: Int64, totalBytesExpectedToSend: Int64) {
//
//             DispatchQueue.main.async {
//            let uploadProgress: Float = Float(totalBytesSent) / Float(totalBytesExpectedToSend)
//            print("session \(session) uploaded \(uploadProgress * 100)%.")
//
//            let str =  "\(Int(uploadProgress * 100))"
//
//            //NVActivityIndicatorPresenter.sharedInstance.setMessage("\(AppMessages.uploadInProgress)\n \(str) %")
//
//            }
//
//        }
//
//        func urlSession(_ session: URLSession, dataTask: URLSessionDataTask, didReceive response: URLResponse, completionHandler: @escaping (URLSession.ResponseDisposition) -> Void) {
//            print("session \(session), received response \(response)")
//
//            DispatchQueue.main.async {
//
//    //            let hud = MBProgressHUD(for: self.view)
//    //            hud.mode = MBProgressHUDMode.text
//    //            hud.label.text = "Finishing ..."
//    //            self.videoImage.image = nil
//
//
//            }
//
//            completionHandler(Foundation.URLSession.ResponseDisposition.allow)
//        }
//
//        func urlSession(_ session: URLSession, dataTask: URLSessionDataTask, didReceive data: Data) {
//            responseData.append(data)
//        }
//
//
//        private func createBody(with parameters: [String: String]?, filePathKey: String, paths: [String], boundary: String) throws -> Data {
//            var body = Data()
//
//            if parameters != nil {
//                for (key, value) in parameters! {
//                    body.append("--\(boundary)\r\n")
//                    body.append("Content-Disposition: form-data; name=\"\(key)\"\r\n\r\n")
//                    body.append("\(value)\r\n")
//                }
//            }
//
//            for path in paths {
//                let url = URL(string: path)
//                let filename = url!.lastPathComponent
//                let data = try Data(contentsOf: url!)
//                let mimetype = mimeType(for: path)
//
//                body.append("--\(boundary)\r\n")
//                body.append("Content-Disposition: form-data; name=\"\(filePathKey)\"; filename=\"\(filename)\"\r\n")
//                body.append("Content-Type: \(mimetype)\r\n\r\n")
//                body.append(data)
//                body.append("\r\n")
//            }
//
//            body.append("--\(boundary)--\r\n")
//            return body
//        }
//
//        private func generateBoundaryString() -> String {
//            return "Boundary-\(UUID().uuidString)"
//        }
//
//        private func mimeType(for path: String) -> String {
//            let url = URL(fileURLWithPath: path)
//            let pathExtension = url.pathExtension
//
//            if let uti = UTTypeCreatePreferredIdentifierForTag(kUTTagClassFilenameExtension, pathExtension as NSString, nil)?.takeRetainedValue() {
//                if let mimetype = UTTypeCopyPreferredTagWithClass(uti, kUTTagClassMIMEType)?.takeRetainedValue() {
//                    return mimetype as String
//                }
//            }
//            return "application/octet-stream"
//        }
//
//
//
//
//
//
//    //Create Post
//    func createPost(methodName:String, params:NSDictionary, oncompletion:@escaping ServiceResponseReturn) {
//
//        let URLStr =  ApiServiceName.serverUrl + methodName
//        let header: HTTPHeaders = [
//            "X-custom-header" : "7890abcdefghijkl"
//        ]
//        upload(multipartFormData: { (multipartFormData) in
//            if let type = params["type"] as? String
//            {
//                multipartFormData.append(type.data(using: .utf8)!, withName: "type")
//                if let data = params["data"] as? Data
//                {
//                    if type == "video"
//                    {
//                        multipartFormData.append(data, withName:"media[]",fileName: "file.mp4", mimeType: "video/mp4")
//                        if let thumbnail = params["thumbnail"] as? Data{
//                            multipartFormData.append(thumbnail, withName:"thumbnail[]",fileName: "file.jpg", mimeType: "image/jpg")
//                        }
//                    }else
//                    {
//                        multipartFormData.append(data, withName: "media[]",fileName: "file.jpg", mimeType: "image/jpg")
//                    }
//                }
//            }
//            if let user_id = params["user_id"] as? String{
//                let id = String(user_id)
//                multipartFormData.append(user_id.data(using: .utf8)!, withName: "user_id")
//            }
//
//            if let post_id = params["post_id"] as? String{
//                let id = String(post_id)
//                multipartFormData.append(post_id.data(using: .utf8)!, withName: "post_id")
//            }
//
//            if let tagged_pets = params["tagged_pets"] as? String{
//                multipartFormData.append(tagged_pets.data(using: .utf8)!, withName: "tagged_pets")
//            }
//            if let hash_tags = params["hash_tags"] as? String{
//                multipartFormData.append(hash_tags.data(using: .utf8)!, withName: "hash_tags")
//            }
//            if let tagged_users = params["tagged_users"] as? String{
//                multipartFormData.append(tagged_users.data(using: .utf8)!, withName: "tagged_users")
//            }
//            if let description = params["description"] as? String{
//                multipartFormData.append(description.data(using: .utf8)!, withName: "description")
//            }
//            if let twitter_access_token = params["twitter_access_token"] as? String{
//                multipartFormData.append(twitter_access_token.data(using: .utf8)!, withName: "twitter_access_token")
//            }
//            if let twitter_access_token_secret = params["twitter_access_token_secret"] as? String{
//                multipartFormData.append(twitter_access_token_secret.data(using: .utf8)!, withName: "twitter_access_token_secret")
//            }
//            if let facebook_access_token = params["facebook_access_token"] as? String{
//                multipartFormData.append(facebook_access_token.data(using: .utf8)!, withName: "facebook_access_token")
//            }
//            if let isShare = params["is_share"] as? String{
//                multipartFormData.append(isShare.data(using: .utf8)!, withName: "is_share")
//            }
//            if let location = params["location"] as? String{
//                multipartFormData.append(location.data(using: .utf8)!, withName: "location")
//            }
//            if let latitude = params["latitude"] as? String{
//                multipartFormData.append(latitude.data(using: .utf8)!, withName: "latitude")
//            }
//            if let longitude = params["longitude"] as? String{
//                multipartFormData.append(longitude.data(using: .utf8)!, withName: "longitude")
//            }
//        },
//               usingThreshold: UInt64.init(),
//               to: URLStr,
//               method: .post,
//               headers: header
//
//        ) { (result) in
//            switch result {
//            case .success(let upload, _, _):
//                upload.responseJSON { response in
//                    print(response)
//                    if response.result.value != nil {
//                        oncompletion(true, "", response.result.value as? NSDictionary)
//                    } else {
//                        oncompletion(false, AppMessages.foundSnag, nil)
//                    }
//                }
//            case .failure(let encodingError):
//                oncompletion(false, encodingError as? String, nil)
//            }
//        }
//    }
//
//    //Edit Profile
//    func edituserProfile(urlStr:String,params:NSDictionary?, oncompletion:@escaping ServiceResponseReturn) {
//
//        let URLStr =  urlStr
//        let header: HTTPHeaders = [
//            "X-custom-header" : "7890abcdefghijkl"
//        ]
//        upload(multipartFormData: { (multipartFormData) in
//
//            if let params = params {
//                for (key, value) in params {
//                    if let value = value as? Data {
//                       // data
//                        multipartFormData.append(value, withName: "user_image", fileName: "image.png", mimeType: "image/png")
//                    }else{
//                           multipartFormData.append((value as AnyObject).data(using: String.Encoding.utf8.rawValue)!, withName: key as? String ?? "")
//                    }
//                }
//            }
//        },
//               usingThreshold: UInt64.init(),
//               to: URLStr,
//               method: .post,
//               headers: header
//
//        ) { (result) in
//            switch result {
//            case .success(let upload, _, _):
//                upload.responseJSON { response in
//                    print(response)
//                    if response.result.value != nil {
//                        oncompletion(true, "", response.result.value as? NSDictionary)
//                    } else {
//                        oncompletion(false, AppMessages.foundSnag, nil)
//                    }
//                }
//            case .failure(let encodingError):
//                oncompletion(false, encodingError as? String, nil)
//            }
//        }
//    }
//    //Upload image
//
//
//    //Add Forum
//    func addForum(urlStr:String,params:NSDictionary?, oncompletion:@escaping ServiceResponseReturn) {
//
//        let URLStr =  urlStr
//        let header: HTTPHeaders = [
//            "X-custom-header" : "7890abcdefghijkl"
//        ]
//        upload(multipartFormData: { (multipartFormData) in
//
//            if let params = params {
//                for (key, value) in params {
//                    if let value = value as? Data {
//                       // data
//
//                        var str = key as! String
//                        var fileName = ""
//                        var mimeType = ""
//                        if str.contains("_image"){
//                            str = str.replacingOccurrences(of: "_image", with: "")
//                            fileName = "image.png"
//                            mimeType = "image/png"
//                        }else{
//                            str = str.replacingOccurrences(of: "_video", with: "")
//                            fileName = "file.mp4"
//                            mimeType = "video/mp4"
//                        }
//
//                        multipartFormData.append(value, withName: str, fileName: fileName, mimeType: mimeType)
//                    }else{
//                           multipartFormData.append((value as AnyObject).data(using: String.Encoding.utf8.rawValue)!, withName: key as? String ?? "")
//                    }
//                }
//            }
//        },
//               usingThreshold: UInt64.init(),
//               to: URLStr,
//               method: .post,
//               headers: header
//
//        ) { (result) in
//            switch result {
//            case .success(let upload, _, _):
//                upload.responseJSON { response in
//                    print(response)
//                    if response.result.value != nil {
//                        oncompletion(true, "", response.result.value as? NSDictionary)
//                    } else {
//                        oncompletion(false, AppMessages.foundSnag, nil)
//                    }
//                }
//            case .failure(let encodingError):
//                oncompletion(false, encodingError as? String, nil)
//            }
//        }
//    }
//
//    //Edit Profile
//    func editPetProfile(urlStr:String,params:NSDictionary?, oncompletion:@escaping ServiceResponseReturn) {
//
//        let URLStr =  urlStr
//        let header: HTTPHeaders = [
//            "X-custom-header" : "7890abcdefghijkl"
//        ]
//        upload(multipartFormData: { (multipartFormData) in
//
//            if let params = params {
//                for (key, value) in params {
//                    if let value = value as? Data {
//                       // data
//                        multipartFormData.append(value, withName: "photo[]", fileName: "image.png", mimeType: "image/png")
//                    }else{
//                           multipartFormData.append((value as AnyObject).data(using: String.Encoding.utf8.rawValue)!, withName: key as? String ?? "")
//                    }
//                }
//            }
//        },
//               usingThreshold: UInt64.init(),
//               to: URLStr,
//               method: .post,
//               headers: header
//
//        ) { (result) in
//            switch result {
//            case .success(let upload, _, _):
//                upload.responseJSON { response in
//                    print(response)
//                    if response.result.value != nil {
//                        oncompletion(true, "", response.result.value as? NSDictionary)
//                    } else {
//                        oncompletion(false, AppMessages.foundSnag, nil)
//                    }
//                }
//            case .failure(let encodingError):
//                oncompletion(false, encodingError as? String, nil)
//            }
//        }
//    }
//
//    func AddPost(methodName:String,imageType:String,imageUpload:Data?,mimeType:String,fileName:String, params:NSDictionary?, oncompletion:@escaping ServiceResponseReturn) {
//
//            if !isInternetWorking() {
//                oncompletion(false,AppMessages.noInternetConnection,nil)
//                return
//            }
//
//            let header: HTTPHeaders = [
//                "Content-Type" : "application/json",
//                "X-custom-header":"7890abcdefghijkl"
//            ]
//
////            var data : Data?
////
////            if let imgUpload = imageUpload {
////                data = imgUpload.pngData()
////            }else if let data1 = params?.value(forKey: "photo") as? Data{
////                data = data1
////            }
////
////
//
//            upload(multipartFormData: { (multipartFormData) in
//               // if let data = params?.value(forKey: "file") as? Data {
//    //                if image == true{
//    //                    //For image upload
//                if let dataNew = imageUpload {
//                    multipartFormData.append(dataNew, withName: imageType, fileName: fileName, mimeType: mimeType)
//                }
//    //                }else{
//    //                    //For image upload
//    //                    multipartFormData.append(data, withName: "file", fileName: "video.mp4", mimeType: "video/mp4")
//    //                }
//    //
//             //  }
//                if let params = params {
//                    for (key, value) in params {
//                        if let value = value as? Data {
//                           // data
//                        }else{
//                               multipartFormData.append((value as AnyObject).data(using: String.Encoding.utf8.rawValue)!, withName: key as? String ?? "")
//                        }
//                    }
//                }
//            },
//                   usingThreshold: UInt64.init(),
//                   to: ApiServiceName.serverUrl + methodName,
//                   method: .post,
//                   headers: header
//
//            ) { (result) in
//                switch result {
//                case .success(let upload, _, _):
//
//                    upload.uploadProgress(closure: { (progress) in
//                       // print(".")
//                        print(" \(NSDate())Upload Progress: \(progress.fractionCompleted)")
//                    })
//
//                    upload.responseJSON { response in
//                        print(response)
//                        if response.result.value != nil {
//                            if let response = response.result.value as? [String : Any] {
//                                print(response)
//                                let success = response["success"] as? Bool
//                                let message = response["message"] as? String
//                                oncompletion(success,message,response as NSDictionary)
//                            }else{
//                                oncompletion(false, AppMessages.foundSnag, nil)
//                            }
//
//                        } else {
//                            oncompletion(false, AppMessages.foundSnag, nil)
//                        }
//                    }
//
//                case .failure(let encodingError):
//                    print(encodingError)
//                    oncompletion(false, encodingError.localizedDescription, nil)
//                }
//            }
//        }
//
//
//    //Upload image
//    func uploadImage(methodName:String,image:Bool?,imageUpload:UIImage?, params:NSDictionary?, oncompletion:@escaping ServiceResponseReturn) {
//
//        if !isInternetWorking() {
//            oncompletion(false,AppMessages.noInternetConnection,nil)
//            return
//        }
//
//        let header: HTTPHeaders = [
//            "Content-Type" : "application/json",
//            "X-custom-header":"7890abcdefghijkl"
//        ]
//
//        var data : Data?
//
//        if let imgUpload = imageUpload {
//            data = imgUpload.pngData()
//        }else if let data1 = params?.value(forKey: "photo") as? Data{
//            data = data1
//        }
//
//
//
//        upload(multipartFormData: { (multipartFormData) in
//
//            if let dataNew = data {
//                multipartFormData.append(dataNew, withName: "photo[]", fileName: "image.png", mimeType: "image/png")
//            }
//
//            if let params = params {
//                for (key, value) in params {
//                    if let value = value as? Data {
//                       // data
//                    }else{
//                           multipartFormData.append((value as AnyObject).data(using: String.Encoding.utf8.rawValue)!, withName: key as? String ?? "")
//                    }
//                }
//            }
//        },
//               usingThreshold: UInt64.init(),
//               to: ApiServiceName.serverUrl + methodName,
//               method: .post,
//               headers: header
//
//        ) { (result) in
//            switch result {
//            case .success(let upload, _, _):
//
//                upload.uploadProgress(closure: { (progress) in
//                   // print(".")
//                    print(" \(NSDate())Upload Progress: \(progress.fractionCompleted)")
//                })
//
//                upload.responseJSON { response in
//                    print(response)
//                    if response.result.value != nil {
//                        if let response = response.result.value as? [String : Any] {
//                            print(response)
//                            let success = response["success"] as? Bool
//                            let message = response["message"] as? String
//                            oncompletion(success,message,response as NSDictionary)
//                        }else{
//                            oncompletion(false, AppMessages.foundSnag, nil)
//                        }
//
//                    } else {
//                        oncompletion(false, AppMessages.foundSnag, nil)
//                    }
//                }
//
//            case .failure(let encodingError):
//                print(encodingError)
//                oncompletion(false, encodingError.localizedDescription, nil)
//            }
//        }
//    }
//
//    func postBackgroundRequestt(methodName:String, params:NSDictionary?, oncompletion:@escaping ServiceResponseReturn) {
//        if !isInternetWorking() {
//            oncompletion(false,AppMessages.noInternetConnection,nil)
//            return
//        }
//        var request = URLRequest(url: URL(string: ApiServiceName.serverUrl + methodName)!)
//        print(request)
//        request.httpMethod = "POST"
//        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
//        request.httpBody = try! JSONSerialization.data(withJSONObject: params ?? NSDictionary())
//        let queue = DispatchQueue(label: "com.test.api", qos: .background, attributes: .concurrent)
//        Alamofire.request(request).responseJSON(queue: queue) { response in
//            if response.result.value != nil {
//                if let response = response.result.value as? [String : Any] {
//                    print(response)
//                    let success = response["success"] as? Bool
//                    let message = response["message"] as? String
//                    oncompletion(success,message,response as NSDictionary)
//                }
//            } else {
//                oncompletion(false, AppMessages.foundSnag, nil)
//            }
//        }
//    }
}



extension Data {

    /// Append string to Data
    ///
    /// Rather than littering my code with calls to `data(using: .utf8)` to convert `String` values to `Data`, this wraps it in a nice convenient little extension to Data. This defaults to converting using UTF-8.
    ///
    /// - parameter string:       The string to be added to the `Data`.

    mutating func append(_ string: String, using encoding: String.Encoding = .utf8) {
        if let data = string.data(using: encoding) {
            append(data)
        }
    }
}
