//
//  WebService.swift
//  CryproCrazySwiftUI
//
//  Created by Sabri Demir on 27.09.2025.
//

import Foundation

class WebService{
    
    /*func downloadCurrenciesAysnc(url : URL) async throws -> [CryptoCurrency] {
         
        
        let (data, _ ) = try await URLSession.shared.data(from: url)
        
        let currencies = try JSONDecoder().decode([CryptoCurrency].self, from: data)
        
        return currencies
    }
    
    */
    
    
    func downloadCurreciesContinuation(url : URL) async throws -> [CryptoCurrency] {
        
        try await withCheckedThrowingContinuation { continuation in
            
            downloadCurrencies(url: url) { result in
                switch result{
                case .success(let currencies):
                    continuation.resume(returning: currencies)
                case .failure:
                    continuation.resume(throwing: DownloadError.badURL)
                }
            }
            
            
        }
    }
    
    
    
    
    
    
    func downloadCurrencies(url : URL , completion : @escaping (Result<[CryptoCurrency], DownloadError>) -> Void){
        URLSession.shared.dataTask(with: url) { data, response , error in
            
            if let error = error{
                print (error.localizedDescription)
                completion(.failure(.badURL))
                return
            }
            
            guard let data = data , error == nil else {
                return completion(.failure(.noData))
            }
            
            guard let currencies = try? JSONDecoder().decode([CryptoCurrency].self, from: data) else {
                return completion(.failure(.dataParseError))
            }
    
            completion(.success(currencies))
            
            
        }.resume()
      
    }
     
}
enum DownloadError : Error{
    case badURL
    case noData
    case dataParseError
}
