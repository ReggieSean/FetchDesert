//
//  File.swift
//  
//
//  Created by SeanHuang on 7/27/24.
//

import Foundation
import SwiftUI

enum APIError : Error{
    case requestError(url : String)
    case decodeError(decodableType: String)
    case networkError(url : String)
    case imageDecodeError(url: String)
    
    var description: String?{
        switch self{
            case .decodeError(decodableType: let type):
                return "Error when decoding type \(type)"
            case .networkError(url: let url):
                return "NetWork Error when making request at: \(url)"
            case .requestError(url: let url):
                return "Response Error when making request at: \(url)"
            case .imageDecodeError(url: let url):
                return "Image Conversion error at: \(url)"
        }
    }
}



public class APIManager {
    public static func downloadDecodable<T: Decodable>( url: URL) async throws -> T{
        let session = URLSession.shared
        do{
            let (data, response) = try await session.data(from: url)
            guard let response = response as? HTTPURLResponse , response.statusCode >= 200 && response.statusCode < 400 else{
                throw APIError.requestError(url: url.absoluteString)
            }
            let decoder = JSONDecoder()
            do{
                let decodedData = try decoder.decode(T.self, from: data)
                return decodedData
            }catch{
                throw APIError.decodeError(decodableType:  String(describing:T.self))
            }
        }catch let error as APIError{
            throw error
        } catch{
            throw APIError.networkError(url: url.absoluteString)
        }
        
    }
    
        
    
    
    
    
    public static func downloadImage(url: URL) async throws-> Image {
        
        let session = URLSession.shared
        let (imageData, response) = try await session.data(from: url)
        
        guard let response = response as? HTTPURLResponse , response.statusCode >= 200 && response.statusCode < 400 else{
            throw APIError.requestError(url: url.absoluteString)
        }
        guard let uiImage = UIImage(data: imageData) else{
            throw APIError.imageDecodeError(url: url.absoluteString)
        }
        return Image(uiImage: uiImage)

        
//        let session = URLSession.shared
//        do{
////            let imageURL = URL(string: mealThumb.replacingOccurrences(of: "\\/", with: "/"))!
//            let imageURL = mealThumb
//            let (imageData, imageResponse) = try await session.data(from:  imageURL)
//            guard let response = imageResponse as? HTTPURLResponse , response.statusCode >= 200 && response.statusCode < 400 else{
//                throw APIError.responseCastError("failed to download image")
//            }
//            if let uiImage = UIImage(data: imageData){
//                return Image(uiImage: uiImage)
//            }
//        } catch let Error{
//            print(Error)
//        }
//        return nil
    }
}
