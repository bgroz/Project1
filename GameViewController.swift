//
//  GameViewController.swift
//  CrossWordGame
//
//  Created by Buğra on 21.04.2017.
//  Copyright © 2017 Bartuğ Maden. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {

  
    var window: UIWindow?
    var levelcollectionView: UICollectionView!
    var images = [UIImage(named:"K1"),UIImage(named:"K2"),UIImage(named:"K3"),UIImage(named:"K4")]
    var backImage = UIImage(named: "kapaticon")
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

       
        backButton()
        setupCollectionView()
      
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //  Main menü dönüşü
    func backButton(){
        let backBtn = UIBarButtonItem(image: backImage, style: UIBarButtonItemStyle.plain, target: self, action: #selector(ChapterViewController.goBack))
        navigationItem.leftBarButtonItem = backBtn
        
    }
    func goBack(){
        dismiss(animated: true, completion: nil)
    }

    
    //CollectionView yüklenmesi ve ViewController üzerinde görünecek özellikler
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
    
    // CollectionView row ataması
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    // CollectionView row'ların için eklenecek olan CELL sayıları belirlenir
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    //CellItem'lerinin çağırılması
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "levelCell", for: indexPath) as! LevelCollectionViewCell
        cell.awakeFromNib()
        return cell
    }
    
    // Cell Items gösterilmesi
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        let levelCell = cell as! LevelCollectionViewCell
        levelCell.levelImageView.image = images[indexPath.row]
    }
    
    // Cell Layout boyutları tanımlaması
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 50, height: 50)
    }
    
    // Cell Items seçildiğin yapılması istenen tanımlamalar
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    
        
        let cell:LevelCollectionViewCell = collectionView.cellForItem(at: indexPath) as! LevelCollectionViewCell
        
        // GameScene geçişler
        if cell.levelImageView.image == #imageLiteral(resourceName: "K1")
        {
            if let navigationVc = storyboard?.instantiateViewController(withIdentifier: "ChapterViewController") as? ChapterViewController {
                
                let navController = UINavigationController(rootViewController: navigationVc) // Setting NavigationBar
                self.present(navController, animated: true, completion: nil)
                
            }
        }
    }
    
  
}

