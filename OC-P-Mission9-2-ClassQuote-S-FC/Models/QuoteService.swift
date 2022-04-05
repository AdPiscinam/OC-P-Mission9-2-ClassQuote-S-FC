// QuoteService.swift
// OC-P-Mission9-2-ClassQuote-S-FC
// Created by Ad Piscinam on 04/04/2022
// 

import Foundation

class QuoteService {
    
    private static let quoteUrl = URL(string: "https://api.forismatic.com/api/1.0/")!
    private static let pictureUrl = URL(string: "https://source.unsplash.com/random/1000x1000")!
    private var task: URLSessionDataTask?
    static var shared = QuoteService()
    
    private init() {}
    
    
    func getQuote(callback: @escaping (Bool, Quote?) -> Void) {
        // Request
        var request = URLRequest(url: QuoteService.quoteUrl)
        // Request Method
        request.httpMethod = "POST"
        // Request Body
        let body = "method=getQuote&lang=en&format=json"
        // Encoding method
        request.httpBody = body.data(using: .utf8)
        
        // Creation of URLSession Instance
        let session = URLSession(configuration: .default)
        task?.cancel()
        // Creation of Task
        task = session.dataTask(with: request) { (data, response, error) in
            DispatchQueue.main.async { [self] in
                if let data = data, error == nil {
                    if let response = response as? HTTPURLResponse, response.statusCode == 200 {
                        if let responseJSON = try? JSONDecoder().decode([String: String].self, from: data),
                           let text = responseJSON["quoteText"],
                           let author = responseJSON["quoteAuthor"] {
                            getImage { (data) in
                                if let data = data {
                                    let quote = Quote(text: text, author: author, imageData: data)
                                    callback(true, quote)
                                } else {
                                    callback(false, nil)
                                }
                            }
                        } else {
                            callback(false, nil)
                        }
                    } else {
                        callback(false, nil)
                    }
                } else {
                    callback(false, nil)
                }
            }
        }
        task?.resume()
    }
    
    private func getImage(completionHandler: @escaping ((Data?) -> Void)) {
        let session = URLSession(configuration: .default)
        task?.cancel()
        task = session.dataTask(with: QuoteService.pictureUrl) { (data, response, error) in
            DispatchQueue.main.async {
                if let data = data, error == nil {
                    if let response = response as? HTTPURLResponse, response.statusCode == 200 {
                        completionHandler(data)
                    } else {
                        completionHandler(nil)
                    }
                } else {
                    completionHandler(nil)
                }
            }
            
        }
        task?.resume()
    }
    
}
