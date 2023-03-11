//
//  StorageService.swift
//  xzuvyShop
//
//  Created by Peter Clarke on 11.03.2023.
//

import Foundation
import FirebaseStorage

class StorageService {
    
    static let shared = StorageService()
    
    private init() { }
    
    
    private var storage = Storage.storage().reference()
    
    private var productRef: StorageReference {
        storage.child("products")
    }
    
    func upload(id: String, image: Data, completion: @escaping (Result<String,Error>) -> ()) {
        
        let metadata = StorageMetadata()
        metadata.contentType = "image/jpg"
        
        productRef.child(id).putData(image, metadata: metadata) { metadata, error in
           
            guard let metadata = metadata else {
                if let error = error {
                    completion(.failure(error))
                }
                return
            }
        }
        completion(.success("Razmer image : \(metadata.size)"))
        
    }
    
    
    func download(id: String, completion: @escaping (Result<Data,Error>) ->  ()) {
        
        productRef.child(id).getData(maxSize: 2 * 1024 * 1024) { data, error in
            guard let data = data else {
                if let error = error {
                    completion(.failure(error))
                }
                return
            }
            completion(.success(data))
        }
        
    }
    
}

