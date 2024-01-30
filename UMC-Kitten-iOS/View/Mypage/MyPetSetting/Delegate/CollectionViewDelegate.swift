//
//  CollectionViewDelegate.swift
//  UMC-Kitten-iOS
//
//  Created by DOYEON LEE on 1/30/24.
//

import UIKit

extension MyPetSettingViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pets.count // FIXME: 하드코딩 수정
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemWidth: CGFloat = (collectionView.bounds.width - COLLECTION_VIEW_SPACING) / 2
        let itemHeight: CGFloat = 180
        
        return CGSize(width: itemWidth, height: UIScreen.main.bounds.height * 0.25)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "myPetCardCell", for: indexPath) as? MyPetCardCell else {
            fatalError("Unable to dequeue MyPetCardCell")
        }
        
        let pet = pets[indexPath.item]
        cell.configure(
            petImageName: pet.imageName,
            petName: pet.name,
            petInfo: "\(pet.species) / \(pet.gender) / \(pet.age)살"
        )
        
        return cell
    }
}
