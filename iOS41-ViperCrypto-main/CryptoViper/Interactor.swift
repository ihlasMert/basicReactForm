//
//  Interactor.swift
//  CryptoViper
//
//  Created by Atil Samancioglu on 11.12.2021.
//

import Foundation


// Class
// Protocol
// Talks To -> Presenter
// No completion handlers in interactor. It will inform the presenter once it happens.


protocol AnyInteractor {
    var presenter : AnyPresenter? {get set}
    
    func downloadCrypto()
}

class CryptoInteractor : AnyInteractor {
    var presenter: AnyPresenter?
    
    func downloadCrypto() {
        
        guard let url = URL(string: "http://api.exchangeratesapi.io/v1/latest?access_key=de6e43cec4a3e0b276f6511e1d9eb1a6")
        else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            guard let data = data, error == nil else {
                self?.presenter?.interactorDidDownloadCrypto(result: .failure(NetworkError.networkFailed))
                return
            }
            
            do {
                let cryptos = try JSONDecoder().decode([Crypto].self,from: data)
                self?.presenter?.interactorDidDownloadCrypto(result: .success(cryptos))
            } catch {
                self?.presenter?.interactorDidDownloadCrypto(result: .failure(NetworkError.parsingFailed))
            }
        }
        task.resume()
        
    }
    
    
}
