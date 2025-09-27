//
//  CryptoViewModel.swift
//  CryproCrazySwiftUI
//
//  Created by Sabri Demir on 27.09.2025.
//

import Foundation
import Combine

class CryptoListViewModel : ObservableObject {
    
    @Published var cryptoList = [CryptoViewModel]()
    
    private let webservice = WebService()
    
    
    
    
    
    
    func downloadCryptosContinuation(url:URL) async {
        
        do{
            let cryptos = try await webservice.downloadCurreciesContinuation(url: url)
            
            DispatchQueue.main.async{
                self.cryptoList = cryptos.map(CryptoViewModel.init)
            }
            
            
        }catch {
            print(error)
        }
        
    }
    
    
    
    
    
    /*
    func downloadCryptosAysnc(url:URL) async {
        do{
         
            let cryptos = try await webservice.downloadCurrenciesAysnc(url: url)
            
            DispatchQueue.main.async{
                self.cryptoList = cryptos.map(CryptoViewModel.init)
            }
      
        }catch {
            
            print(error)
            
        }
        
      
    }
    
     */
    

/*
    func downloadCryptos(url : URL){
        webservice.downloadCurrencies(url: url) { [weak self] result in
            
                switch result {
                case .success(let cryptos):
                    DispatchQueue.main.async{
                        self?.cryptoList = cryptos.map(CryptoViewModel.init)
                    }
                case .failure(let error):
                    print(error)
                }
            }
    }
 
 
 */
    
}

struct CryptoViewModel {
    
    let crypto : CryptoCurrency
    
    var id : UUID {
        crypto.id
    }
    
    var currency : String {
        crypto.currency
    }
    
    var price : String {
        crypto.price
    }
}
