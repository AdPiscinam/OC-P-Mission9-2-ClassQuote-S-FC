// ViewController.swift
// OC-P-Mission9-2-ClassQuote-S-FC
// Created by Ad Piscinam on 04/04/2022
// 

import UIKit

class ViewController: UIViewController {
    //MARK: Properties
    // UIImageView
    
    private let loremIpsum = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat."
    
    private let picture: UIImageView = {
        let imageView = UIImageView()
      //  let image = UIImage(named: "sunset.jpeg")
       // imageView.image = image
        imageView.backgroundColor = .textViewGray
        imageView.contentMode = .scaleToFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    // UILabel: Quote
    private let quoteLabel: UILabel = {
        let label = UILabel()
        label.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit"
        label.shadowOffset = CGSize(width: 1, height: 1)
        label.shadowColor = .black
        label.numberOfLines = 0
        label.textAlignment = .center
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // UILabel: Author
    private let authorLabel: UILabel = {
        let label = UILabel()
        label.text = "Jean L'Auteur"
        label.numberOfLines = 1
        label.textAlignment = .center
        label.textColor = .black
        label.font = UIFont.italicSystemFont(ofSize: 17)
        label.addCharacterSpacing(kernValue: 4)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // UIButton
    lazy var newQuoteButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle("New Quote", for: .normal)
        button.backgroundColor = .merlotRed
        button.setTitleColor(UIColor.init(white: 1, alpha: 0.3), for: .highlighted)
        button.addTarget(self, action: #selector(getNewQuote), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    //
    let indicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView()
        indicator.color = .merlotRed
       
        indicator.translatesAutoresizingMaskIntoConstraints = false
        return indicator
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        firstExecuteSearch()
    }


}

//MARK: User Interface Methods
extension ViewController {
    
    private func setupUI() {
        // Background Color
        view.backgroundColor = UIColor.backgroundIsabelline
        view.addSubview(picture)
        picture.addSubview(quoteLabel)
        view.addSubview(authorLabel)
        view.addSubview(newQuoteButton)
        view.addSubview(indicator)
        
        // UIImageView
        picture.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16).isActive = true
        picture.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 8).isActive = true
        picture.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -8).isActive = true
        picture.heightAnchor.constraint(equalTo: picture.widthAnchor, multiplier: 1).isActive = true
        
        // UILabel: Quote
        quoteLabel.centerXAnchor.constraint(equalTo: picture.centerXAnchor).isActive = true
        quoteLabel.centerYAnchor.constraint(equalTo: picture.centerYAnchor).isActive = true
        quoteLabel.leadingAnchor.constraint(equalTo: picture.leadingAnchor, constant: 8).isActive = true
        quoteLabel.trailingAnchor.constraint(equalTo: picture.trailingAnchor, constant: -8).isActive = true
      
        // UILabel: Author
        authorLabel.topAnchor.constraint(equalTo: picture.bottomAnchor, constant: 8).isActive = true
        authorLabel.trailingAnchor.constraint(equalTo: picture.trailingAnchor).isActive = true
        
        // UIButton
        newQuoteButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 8).isActive = true
        newQuoteButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -8).isActive = true
        newQuoteButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16).isActive = true
        newQuoteButton.heightAnchor.constraint(equalToConstant: 48).isActive = true
        
        // UIActivityIndicatorView
        indicator.centerXAnchor.constraint(equalTo: newQuoteButton.centerXAnchor).isActive = true
        indicator.centerYAnchor.constraint(equalTo: newQuoteButton.centerYAnchor).isActive = true
    }
    
    @objc private func getNewQuote() {
        toggleActivityIndicator(shown: true)
        indicator.startAnimating()
     
        QuoteService.shared.getQuote { [self] (success, quote) in
            toggleActivityIndicator(shown: false)
          
            if success, let quote = quote {
                update(quote: quote)
            } else {
                presentAlert()
            }
        }
    }
    
    private func update(quote: Quote) {
        quoteLabel.text = quote.text
        authorLabel.text = quote.author
        picture.image = UIImage(data: quote.imageData)
    }
    private func presentAlert() {
        let alertVC = UIAlertController(title: "Error", message: "Please retry downloading.", preferredStyle: .alert)
        alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        present(alertVC, animated: true, completion: nil)
    }
    
    private func toggleActivityIndicator(shown: Bool) {
        indicator.isHidden = !shown
        newQuoteButton.isHidden = shown
    }
    
    private func firstExecuteSearch() {
        QuoteService.shared.getQuote { [self] (success, quote) in
            if success, let quote = quote {
                update(quote: quote)
            } else {
                presentAlert()
            }
        }
    }
}

