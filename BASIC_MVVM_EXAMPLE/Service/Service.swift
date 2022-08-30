//
//  Service.swift
//  BASIC_MVVM_EXAMPLE
//
//  Created by Alican Yilmaz on 30.08.2022.
//

import Foundation

class Service{
    func downloadCurrencies(url : URL, completion: @escaping ([CryptoCurrency]?) -> ()){
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print(error.localizedDescription)
                completion(nil)
            }else if let data = data {
               let cryptoList = try? JSONDecoder().decode([CryptoCurrency].self, from: data)
                if let cryptoList = cryptoList {
                    completion(cryptoList)
                }
            }
        }.resume()
    }
}
