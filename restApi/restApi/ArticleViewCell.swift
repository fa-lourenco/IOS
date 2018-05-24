//
//  File.swift
//  restApi
//
//  Created by SQIMI_VM on 23/05/2018.
//  Copyright © 2018 SQIMI.Fabio. All rights reserved.
//

import UIKit

class ArticleViewCell: UICollectionViewCell{
    
    override init(frame:CGRect){
        super.init(frame:frame)
        setupView()
    }
    required init? (coder aDecoder: NSCoder){
        fatalError("init not implemented")
    }
    var article: Article?{
        didSet{
            articleTitle.text = article?.title
            articleDescription.text = article?.description
        }
    }
    
    let articleTitle: UILabel = {
        let title = UILabel()
        
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    let articleDescription: UILabel = {
        let description = UILabel()
        description.translatesAutoresizingMaskIntoConstraints = false
        return description
    }()
    
    func setupView(){
        addSubview(articleTitle)
        articleTitle.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        articleTitle.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        articleTitle.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        articleTitle.heightAnchor.constraint(equalTo: self.heightAnchor).isActive = true
        //Align Desc
        addSubview(articleDescription)
        
        articleDescription.topAnchor.constraint(equalTo: articleTitle.bottomAnchor).isActive = true
        articleDescription.leftAnchor.constraint(equalTo: articleTitle.leftAnchor).isActive = true
        articleDescription.widthAnchor.constraint(equalTo: articleTitle.widthAnchor).isActive = true
        articleDescription.heightAnchor.constraint(equalTo: articleTitle.heightAnchor).isActive = true
    }
}
