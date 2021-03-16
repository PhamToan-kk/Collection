//
//  FoodCollectionViewCell.swift
//  Collection
//
//  Created by Pham Toan on 17/03/2021.
//

import UIKit

class FoodCollectionViewCell: UICollectionViewCell {
    var stackView : UIStackView = UIStackView()
    var imageView  = UIImageView()
    var labelFoodName = UILabel()
    var labelFoodDescription = UILabel()
    
    var food : Food!{
        didSet{
            labelFoodName.text = food.name ?? ""
            labelFoodDescription.text = food.description ?? ""
        }
    }
    
    func autolayoutCell(){
        self.backgroundColor = .white
        self.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        stackView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true

        //autolayout image view
        stackView.addArrangedSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.heightAnchor.constraint(equalTo: stackView.heightAnchor, multiplier: 2/3).isActive = true
        imageView.image = UIImage(named: "b.png")
        //autolayout labelname
        
        stackView.addArrangedSubview(labelFoodName)
        labelFoodName.translatesAutoresizingMaskIntoConstraints = false;
        labelFoodName.font = UIFont.boldSystemFont(ofSize: 15)
        
        //autolayout foodDescription
        
        stackView.addArrangedSubview(labelFoodDescription)
        labelFoodDescription.translatesAutoresizingMaskIntoConstraints = false;
        labelFoodDescription.font = UIFont.systemFont(ofSize: 14)
         
        
        //stackview setting
        stackView.axis = .vertical;
        stackView.alignment = .leading;
        stackView.distribution = .equalSpacing;
        stackView.spacing = 10
        
        
    }
}
