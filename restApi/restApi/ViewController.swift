//
//  ViewController.swift
//  restApi
//
//  Created by SQIMI_VM on 23/05/2018.
//  Copyright © 2018 SQIMI.Fabio. All rights reserved.
//

import UIKit

class ViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    //MARK:Properties
    
    fileprivate let cellId = "cellId"
    var articles:[Article]?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Rest API"
        collectionView?.register(ArticleViewCell.self, forCellWithReuseIdentifier: cellId)
        
        //URLSession
        let urlString = "https://swift.mrgott.pro/blog.json"
        guard let url = URL(string: urlString) else {return}
        
        URLSession.shared.dataTask(with: url){
            (data, response, error) in
            if(error != nil){
                print (error!.localizedDescription)
            }
            do{
                guard let data = data else {return}
                //Json Decoding and parsing
                let articlesData = try JSONDecoder().decode([Article].self, from: data)
                
                //
                DispatchQueue.main.async {
                    self.articles = articlesData
                    self.collectionView?.reloadData()
                }
            }catch let jsonError {
                print(jsonError)
            }
            }.resume()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return articles?.count ?? 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier:cellId, for:indexPath) as! ArticleViewCell
        
            cell.article = articles?[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width:view.bounds.width, height:100)
    }
    
}

