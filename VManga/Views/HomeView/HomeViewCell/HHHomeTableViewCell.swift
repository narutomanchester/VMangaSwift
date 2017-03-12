//
//  HHHomeTableViewCell.swift
//  VManga
//
//  Created by mac on 3/11/17.
//  Copyright © 2017 mac. All rights reserved.
//

import UIKit

class HHHomeTableViewCell: UITableViewCell , UICollectionViewDelegate , UICollectionViewDataSource  {

    var books = [Book]()
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var label: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        let nib = UINib(nibName: "HHBookCollectionViewCell", bundle: nil)
        self.collectionView.register(nib, forCellWithReuseIdentifier: "HHBookCollectionViewCell")
    }
    
    func setUp()  {
//        self.collectionView.backgroundColor = .none
//        self.backgroundColor = .none
//        let layout = self.collectionView.collectionViewLayout as! UICollectionViewFlowLayout
//        layout.itemSize = CGSize(width: self.collectionView.frame.height * 1/1, height:self.collectionView.frame.height * 1.1/1)
//        layout.sectionInset = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 0)
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.collectionView.isPagingEnabled = true
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HHBookCollectionViewCell", for: indexPath) as! HHBookCollectionViewCell
        cell.label.text = self.books[indexPath.row].title
        
        let defaultImage = UIImage(named: "Vmanga-icon")
        let url = URL(string: self.books[indexPath.row].thumbnail)
        cell.image.sd_setImage(with: url, placeholderImage: defaultImage)
        //cell.setUp()
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        API.getMangaInfo(manga_id: self.books[indexPath.row].manga_id)
            .then { (book) -> Void in
                let b = ["book" : book]
                NotificationCenter.default.post(name: NSNotification.Name(rawValue: "mainDetail"), object: nil, userInfo: b)
            }.catch { e in
        }
    }

    
}
