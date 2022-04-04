// ViewController.swift
// OC-P-Mission9-2-ClassQuote-S-FC
// Created by Ad Piscinam on 04/04/2022
// 

import UIKit

class ViewController: UIViewController {
    //MARK: Properties
    // UIImageView
    private let picture: UIImageView = {
        let imageView = UIImageView()
        let image = UIImage(named: "sunset.jpeg")
        imageView.image = image
        imageView.contentMode = .scaleToFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
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
        
        picture.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16).isActive = true
        picture.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 8).isActive = true
        picture.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -8).isActive = true
        picture.heightAnchor.constraint(equalTo: picture.widthAnchor, multiplier: 1).isActive = true
        
        // UIImageView
        // UILabel: Quote
        // UILabel: Author
        // UIButton
    }
}

