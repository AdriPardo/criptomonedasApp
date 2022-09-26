//
//  CriptomonedasService.swift
//  PruebaTecnica
//
//  Created by Adrian Pardo Moreno on 19/9/22.
//

import Foundation
import Alamofire

public class CriptomonedasService {
    public func getCriptomonedas(onSuccess: @escaping (ResponseCriptomonedas?)->(), onError: @escaping (String?)->()){
        let url = "https://api.coincap.io/v2/assets"
        AF.request(url, method: .get).responseJSON(completionHandler: { response in
            if response.response?.statusCode == 200{
                do{
                    let json = try JSONDecoder().decode(ResponseCriptomonedas.self, from: response.data!)
                    onSuccess(json)
                }
                catch{
                    let message = String(data: response.data! , encoding: String.Encoding.utf8)
                    onError(message)
                    
                }
            }else{
                let message = String(response.response?.statusCode ?? 500) + " - ¡Vaya algo no ha ido como debería!"
                onError(message)
            }
        })
    }
}
