//
//  ViewController.swift
//  Collection
//
//  Created by Pham Toan on 14/03/2021.
//

import UIKit

class ViewController: UIViewController ,
                      UICollectionViewDelegate,
                      UICollectionViewDataSource,
                      UICollectionViewDelegateFlowLayout
{
    
    var collectionView : UICollectionView?
    let cellID  = "myCell"
    let spaceCell : CGFloat = 10 ;
    override func viewDidLoad() {
        super.viewDidLoad()
        //        view.backgroundColor = .red
        // Do any additional setup after loading the view.
        collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewLayout())
        collectionView?.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(collectionView!)
        
        collectionView?.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true // align 0
        collectionView?.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true // align 0
        collectionView?.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        collectionView?.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        
        collectionView?.backgroundColor = .purple
        
        //collection view setting
        let collectionViewFlowlayout = UICollectionViewFlowLayout()
        collectionView?.setCollectionViewLayout(collectionViewFlowlayout, animated: true)
        
        collectionViewFlowlayout.sectionInset = UIEdgeInsets(top: 0, left: spaceCell, bottom: 0, right: spaceCell)
        
        collectionViewFlowlayout.minimumInteritemSpacing = 10
        collectionViewFlowlayout.minimumLineSpacing = 10
        
        collectionViewFlowlayout.scrollDirection = .vertical
        collectionView?.register(FoodCollectionViewCell.self,forCellWithReuseIdentifier: cellID ) //register kiểu dữ liệu của từng self (mặc định và key )
        collectionView?.delegate = self
        collectionView?.dataSource = self
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return foodData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! FoodCollectionViewCell
//        cell.labelFoodName = foodData[indexPath.row.]
        let food = foodData[indexPath.row]
        cell.food = food
        
        cell.autolayoutCell()
        return cell
    }
    
    //UI collectionviewDataSource
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize{
        let width = (UIScreen.main.bounds.size.width - 3*spaceCell)/2
        let height = (UIScreen.main.bounds.size.height - 4*spaceCell)/4
        return CGSize(width: width , height: height)
    }
    
    
    
    
    
}

