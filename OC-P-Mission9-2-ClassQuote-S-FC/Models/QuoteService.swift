// QuoteService.swift
// OC-P-Mission9-2-ClassQuote-S-FC
// Created by Ad Piscinam on 04/04/2022
// 

import Foundation

class QuoteService {
    
    private static let quoteUrl = URL(string: "https://api.forismatic.com/api/1.0/")!
    private static let pictureUrl = URL(string: "https://source.unsplash.com/random/1000x1000")!
    
    static func getQuote() {
        // Request
        var request = URLRequest(url: quoteUrl)
        // Request Method
        request.httpMethod = "POST"
        // Request Body
        let body = "method=getQuote&lang=en&format=json"
        // Encoding method
        request.httpBody = body.data(using: .utf8)
        
        // Creation of URLSession Instance
        let session = URLSession(configuration: .default)
        // Creation of Task
        let task = session.dataTask(with: request) { (data, response, error) in
            // Managing the Response
            // Check if data contains Data and no Error present
            if let data = data, error == nil {
                // Check if status Code is 200
                if let response = response as? HTTPURLResponse, response.statusCode == 200 {
                    // Decode JSON file
                    if let responseJSON = try? JSONDecoder().decode([String : String].self, from: data),
                       let text = responseJSON["quoteText"],
                       let author = responseJSON["quoteAuthor"] {
                        getImage(completionHandler: { (data) in
                            if let data = data {
                                print(data)
                                print(text)
                                print(author)
                            }
                        })
                    }
                }
            }
        }
        task.resume()
    }
    
    private static func getImage(completionHandler: @escaping ((Data?) -> Void)) {
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: pictureUrl) { (data, response, error) in
            
            if let data = data, error == nil {
                if let response = response as? HTTPURLResponse, response.statusCode == 200 {
                    completionHandler(data)
                    
                }
            }
            
        }
        
        
        task.resume()
    }
    
}
