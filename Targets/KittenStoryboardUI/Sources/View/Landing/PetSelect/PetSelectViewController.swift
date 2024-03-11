//
//  PetSelectViewController.swift
//  UMC-Kitten-iOS
//
//  Created by Jongkwon on 1/27/24.
//

import UIKit

import KittenCommonUI
import KittenService

import SnapKit

class PetSelectViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    // MARK: UI Component
    let collectionView: BaseCollectionView = .init()
    
    @IBOutlet weak var nextButton: UIButton!
    var pets: [PetModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(MyPetInfoCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.register(MyPetAddCell.self, forCellWithReuseIdentifier: "addCell")
        
        [collectionView]
            .forEach { view.addSubview($0) }
        
        collectionView.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(20)
            $0.bottom.equalTo(nextButton.snp.top)
            $0.leading.trailing.equalToSuperview().inset(20)
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        refresh()
    }
    
    @IBAction func nextButtonTapped(_ sender: Any) {
        print("nextButtonTapped")
        let sb = UIStoryboard(name: "Welcome", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "WELCOME") as! WelcomeViewController
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func refresh() {
        PetRemoteRepository()
            .getRegisteredPets { pets, _ in
                if let pets = pets {
                    self.pets = pets
                    self.collectionView.reloadData()
                }
            }
    }
}

extension PetSelectViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pets.count + 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        print(pets.count + 1 )
        if indexPath.row == pets.count {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "addCell", for: indexPath) as! MyPetAddCell
            cell.parentViewController = self
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! MyPetInfoCell
            let pet = pets[indexPath.row]
            cell.configure(
                petId: pet.id,
                petImageName: pet.image,
                petName: pet.name,
                petInfo: "\(pet.species.krDescription) / \(pet.gender.krDescription) / \(pet.age)살"
            )
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        guard let flowLayout = collectionViewLayout as? UICollectionViewFlowLayout else {
            return CGSize.zero
        }
        
        let value = (collectionView.frame.width - (flowLayout.sectionInset.left + flowLayout.sectionInset.right + flowLayout.minimumInteritemSpacing)) / 2
        return CGSize(width: value, height: value+50)
    }
}
