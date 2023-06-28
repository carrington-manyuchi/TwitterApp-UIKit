//
//  TweetTableViewCell.swift
//  TwitterApp-UIKit
//
//  Created by DA MAC M1 157 on 2023/06/28.
//

import UIKit

class TweetTableViewCell: UITableViewCell {
    
    static let identifier = "TweetTableViewCell"
    
    private let avatarImageView: UIImageView = {
        
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 25
        imageView.layer.masksToBounds = true
        imageView.clipsToBounds = true
        imageView.image = UIImage(systemName: "person")
        imageView.backgroundColor = .red
        return imageView
    }()
    
    
    
    private let displayNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Carrington Manyuchi"
        label.font = .systemFont(ofSize: 18, weight: .bold )
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let usernameLabel: UILabel = {
        let label = UILabel()
        label.text = "@Johnson"
        label.textColor = .secondaryLabel
        label.font = .systemFont(ofSize: 16, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    private let tweetContentLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "This is my mockup tweet. It is going to take multiple lines. I believe some molre tweets and texts are going to come and they will be enough but lets addd spme more anyway.... and cheers DIgital Academy!!! \n #IfYouKnowYouKnow"
        label.numberOfLines = 0
        
        return label
    }()
    
    // first of all lets initialise that
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(avatarImageView)
        contentView.addSubview(displayNameLabel)
        contentView.addSubview(usernameLabel)
        contentView.addSubview(tweetContentLabel)
        
        configureConstraints()
    }
    
    
    private func configureConstraints() {
        
        let avatarImageViewConstraints = [
            avatarImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            avatarImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 14),
            avatarImageView.heightAnchor.constraint(equalToConstant: 50),
            avatarImageView.widthAnchor.constraint(equalToConstant: 50)
        ]
        
        let displayNameConstraints = [
            displayNameLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 20),
            displayNameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
        ]
        
        let usernameLabelConstraints = [
            usernameLabel.leadingAnchor.constraint(equalTo: displayNameLabel.trailingAnchor, constant: 10),
            usernameLabel.centerYAnchor.constraint(equalTo: displayNameLabel.centerYAnchor)
        ]
        
        let tweetContentLabelConstraints = [
            tweetContentLabel.leadingAnchor.constraint(equalTo: displayNameLabel.leadingAnchor),
            tweetContentLabel.topAnchor.constraint(equalTo: displayNameLabel.bottomAnchor, constant: 10),
            tweetContentLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15),
            tweetContentLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15)
        ]
        
        NSLayoutConstraint.activate(avatarImageViewConstraints)
        NSLayoutConstraint.activate(displayNameConstraints)
        NSLayoutConstraint.activate(usernameLabelConstraints)
        NSLayoutConstraint.activate(tweetContentLabelConstraints)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
}
