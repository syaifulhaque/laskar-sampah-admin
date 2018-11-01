//
//  CustomNewsTableViewCell.swift
//  AdminLaskarSampah
//
//  Created by Egi Muhamad Saefulhaqi on 01/11/18.
//  Copyright © 2018 Egi Muhamad Saefulhaqi. All rights reserved.
//

import UIKit

class CustomNewsTableViewCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var dataSource = [0, 1, 2, 3, 4, 5, 6] {
        didSet {
            newsCollection?.reloadData()
        }
    }
    var selectedNewsIndex: Int?
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "newsListCell", for: indexPath)
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("select at \(indexPath.row)")
        self.selectedNewsIndex = indexPath.row
//        let storyboard = UIStoryboard(name: "NewsStoryboard", bundle: nil)
//        let vc = storyboard.instantiateViewController(withIdentifier: "NewsViewController")
//        self.navigationController!.pushViewController(vc, animated: true)
    }
    

    
    @IBOutlet weak var newsCollection: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        newsCollection.dataSource = self
        newsCollection.delegate = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
