//
//  StorageManager.swift
//  TwitterApp-UIKit
//
//  Created by DA MAC M1 157 on 2023/07/03.
//

import UIKit
import Combine
import FirebaseStorageCombineSwift
import FirebaseStorage


enum FirestorageError: Error {
    case invalidImageID
}


final class StorageManger {
    static let shared = StorageManger()
    
    let storage = Storage.storage()
    
    func getDownloadURL(for id: String?) -> AnyPublisher<URL, Error> {
        guard let id = id else {
            return Fail(error: FirestorageError.invalidImageID)
                .eraseToAnyPublisher()
        }
        return storage
            
            .reference(withPath: id)
            .downloadURL()
            .print()
            .eraseToAnyPublisher()
    }
    
    func uploadProfilePhoto(with randomID: String, image: Data, metaData: StorageMetadata) -> AnyPublisher<StorageMetadata, Error> {
        storage
            .reference()
            .child("images/\(randomID).JPG")
            .putData(image, metadata: metaData)
            .print()
            .eraseToAnyPublisher()
    }
}
 
