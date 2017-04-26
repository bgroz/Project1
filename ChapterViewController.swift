//
//  ChapViewController.swift
//  CrossWordGame
//
//  Created by Buğra on 26.04.2017.
//  Copyright © 2017 Bartuğ Maden. All rights reserved.
//

import UIKit

class ChapterViewController: UIViewController , UICollectionViewDelegate , UICollectionViewDataSource{

    @IBOutlet weak var MyCollectionView: UICollectionView!
    var backImage = UIImage(named: "kapaticon")

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.MyCollectionView.delegate = self
        self.MyCollectionView.dataSource = self
        backButton()
        
    }
    

//    override func viewDidAppear(_ animated: Bool) {
//        txField.becomeFirstResponder()
//    }
//

    func backButton(){
        
        let backBtn = UIBarButtonItem(image: backImage, style: UIBarButtonItemStyle.plain, target: self, action: #selector(ChapterViewController.goBack))
        navigationItem.title = "Level 1"
        navigationItem.leftBarButtonItem = backBtn
        
    }
    
    func goBack(){
        dismiss(animated: true, completion: nil)
    }

    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    
        return 15
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collection_Cell", for: indexPath) as! ChapterCollectionViewCell
        cell.awakeFromNib()
        return cell
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 15
    }    

}
