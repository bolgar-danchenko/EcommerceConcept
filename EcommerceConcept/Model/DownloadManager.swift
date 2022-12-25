//
//  JSONModels.swift
//  EcommerceConcept
//
//  Created by Konstantin Bolgar-Danchenko on 19.12.2022.
//

import SwiftUI

class DownloadManager {
    
    func downloadImage(imageUrl: URL, completion: ((_ image: Image?) -> Void)?) {
        let session = URLSession(configuration: .default)
        let task = session.downloadTask(with: imageUrl) { urlSavedImageTMP, response, error in
            
            guard let urlSavedImageTMP else {
                print("image = nil, check error and response")
                completion?(nil)
                return
            }
            guard let data = try? Data(contentsOf: urlSavedImageTMP) else { return }
            guard let image = Image(data: data) else { return }
            completion?(image)
        }
        task.resume()
    }
}
