//
//  GameViewController.swift
//  CrossWordGame
//
//  Created by Buğra on 21.04.2017.
//  Copyright © 2017 Bartuğ Maden. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {

    
    var levelcollectionView: UICollectionView!
    var images = [UIImage(named:"K1"),UIImage(named:"K2"),UIImage(named:"K3"),UIImage(named:"K4")]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCollectionView()
        
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func setupCollectionView() {
        
        let layout = UICollectionViewFlowLayout()
        levelcollectionView = UICollectionView(frame: view.frame, collectionViewLayout: layout)
        levelcollectionView.register(LevelCollectionViewCell.self, forCellWithReuseIdentifier: "levelCell")
        levelcollectionView.backgroundColor = .green
        levelcollectionView.delegate = self
        levelcollectionView.dataSource = self
        view.addSubview(levelcollectionView)
        
        
        
    }
    
    
    
}

extension GameViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "levelCell", for: indexPath) as! LevelCollectionViewCell
        cell.awakeFromNib()
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        let levelCell = cell as! LevelCollectionViewCell
        levelCell.levelImageView.image = images[indexPath.row]
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 50, height: 50)
    }
    
        func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    
    
            let cell:LevelCollectionViewCell = collectionView.cellForItem(at: indexPath) as! LevelCollectionViewCell
    
            if cell.levelImageView.image == #imageLiteral(resourceName: "K1")
            {
                let navigationVc = storyboard?.instantiateViewController(withIdentifier: "ChapterViewController")
                self.present(navigationVc!, animated: true, completion: nil)
                
            }
            
        }
    
    
    
}
