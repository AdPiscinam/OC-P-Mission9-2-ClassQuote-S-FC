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
    
    
    // UILabel: Quote
    // UILabel: Author
    // UIButton
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
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
    }
}

