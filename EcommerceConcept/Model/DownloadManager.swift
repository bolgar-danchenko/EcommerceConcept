//
//  JSONModels.swift
//  EcommerceConcept
//
//  Created by Konstantin Bolgar-Danchenko on 19.12.2022.
//

import Foundation
import SwiftUI

class DownloadManager {
    
    let allProductsUrlString = "https://run.mocky.io/v3/654bd15e-b121-49ba-a588-960956b15175"
    let detailsUrlString = "https://run.mocky.io/v3/6c14c560-15c6-4248-b9d2-b4508df7d4f5"
    let basketUrlString = "https://run.mocky.io/v3/53539a72-3c5f-4f30-bbb1-6ca10d42c149"
    
    func getProducts(completion: @escaping (Answer) -> ()) {
        
        guard let url = URL(string: allProductsUrlString) else {
            print("Invalid url")
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let error {
                print(error.localizedDescription)
                return
            }
            
            if (response as? HTTPURLResponse)?.statusCode != 200 {
                print("Status code = \((response as? HTTPURLResponse)?.statusCode ?? 0)")
            }
            
            guard let data else { return }
            
            do {
                let answer = try JSONDecoder().decode(Answer.self, from: data)
                completion(answer)
            } catch {
                print(error)
            }
        }
        .resume()
    }
    
    func getDetails(completion: @escaping (DetailProduct) -> ()) {
        guard let url = URL(string: detailsUrlString) else {
            print("Invalid url")
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let error {
                print(error.localizedDescription)
                return
            }
            
            if (response as? HTTPURLResponse)?.statusCode != 200 {
                print("Status code = \((response as? HTTPURLResponse)?.statusCode ?? 0)")
            }
            
            guard let data else { return }
            
            do {
                let answer = try JSONDecoder().decode(DetailProduct.self, from: data)
                completion(answer)
            } catch {
                print(error)
            }
        }
        .resume()
    }
    
    func getBasket(completion: @escaping (Basket) -> ()) {
        guard let url = URL(string: basketUrlString) else {
            print("Invalid url")
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let error {
                print(error.localizedDescription)
                return
            }
            
            if (response as? HTTPURLResponse)?.statusCode != 200 {
                print("Status code = \((response as? HTTPURLResponse)?.statusCode ?? 0)")
            }
            
            guard let data else { return }
            
            do {
                let answer = try JSONDecoder().decode(Basket.self, from: data)
                completion(answer)
            } catch {
                print(error)
            }
        }
        .resume()
    }
    
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

extension Image {
    init?(data: Data) {
        guard let image = UIImage(data: data) else { return nil }
        self = .init(uiImage: image)
    }
}
