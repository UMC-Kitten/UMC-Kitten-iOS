//
//  MyInfoImagePickerDelegate.swift
//  UMC-Kitten-iOS
//
//  Created by DOYEON LEE on 1/31/24.
//

import UIKit

import ReactorKit

extension MyInfoViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(
        _ picker: UIImagePickerController,
        didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]
    ) {
        var newImage: UIImage? = nil
        
        if let possibleImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
            newImage = possibleImage
        } else if let possibleImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            newImage = possibleImage
        }
        
        Observable.just(newImage!)
            .map { .updateProfileImage($0) }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
        
        picker.dismiss(animated: true, completion: nil) // picker를 닫아줌
        
    }
}
