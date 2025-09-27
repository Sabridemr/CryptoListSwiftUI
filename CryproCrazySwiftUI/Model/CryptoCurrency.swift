//
//  CryptoCurrency.swift
//  CryproCrazySwiftUI
//
//  Created by Sabri Demir on 27.09.2025.
//

import Foundation

struct CryptoCurrency : Decodable , Identifiable {
    
    let id = UUID()
    let currency : String
    let price: String
    
    
    private enum CodingKeys : String , CodingKey {
        case currency = "currency"
        case price = "price"
    }
    
}
