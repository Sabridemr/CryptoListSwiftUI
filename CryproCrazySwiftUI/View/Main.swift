//
//  ContentView.swift
//  CryproCrazySwiftUI
//
//  Created by Sabri Demir on 27.09.2025.
//

import SwiftUI

struct Main: View {
    
    @ObservedObject var cryptoListViewModel : CryptoListViewModel
    
    init(){
        self.cryptoListViewModel = CryptoListViewModel()
    }
    
    var body: some View {
        
        NavigationView{
            
            List(cryptoListViewModel.cryptoList , id:\.id){crypto in
                
                VStack{
                    Text(crypto.currency)
                        .font(.title3)
                        .foregroundColor(.blue)
                        
                    Text(crypto.price)
                        .foregroundColor(.black)
                    
                }
                
                
                
            }.navigationTitle(Text("Crypto Crazy"))
            
            
            
        }.task {
            
          //  await cryptoListViewModel.downloadCryptosAysnc(url: URL(string: "https://raw.githubusercontent.com/atilsamancioglu/K21-JSONDataSet/master/crypto.json")!)
            
            await cryptoListViewModel.downloadCryptosContinuation(url: URL(string: "https://raw.githubusercontent.com/atilsamancioglu/K21-JSONDataSet/master/crypto.json")!)
            
            
        }
      
            //cryptoListViewModel.downloadCryptos(url: URL(string: "https://raw.githubusercontent.com/atilsamancioglu/K21-JSONDataSet/master/crypto.json")!)
   
    }
}

#Preview {
    Main()
}
