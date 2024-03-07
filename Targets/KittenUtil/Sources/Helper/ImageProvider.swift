//
//  ImageProvider.swift
//  UMC-Kitten-iOS
//
//  Created by DOYEON LEE on 2/17/24.
//

import UIKit
import RxSwift

public class ImageProvider {

    /// 콜백 형식으로 이미지 처리
    public static func loadImage(_ source: String, completion: @escaping (UIImage?) -> Void) {
        loadImageInternal(source) { image, error in
            if let image = image {
                completion(image)
            } else {
                print(error?.localizedDescription ?? "Unknown error")
                completion(nil)
            }
        }
    }
    
    /// Rx 형식으로 이미지 처리
    public static func loadImage(_ source: String) -> Observable<UIImage?> {
        return Observable.create { observer in
            loadImageInternal(source) { image, error in
                if let error = error {
                    observer.onError(error)
                } else if let image = image {
                    observer.onNext(image)
                } else {
                    observer.onNext(nil)
                }
                observer.onCompleted()
            }
            return Disposables.create()
        }
    }
    
    /// source로 URL 형식을 받으면 외부에서 이미지를 다운로드하고,
    /// URL형식이 아닌 문자열을 받으면 Asset에서  이미지를 찾아 반환합니다.
    private static func loadImageInternal(
        _ source: String, 
        completion: @escaping (UIImage?, Error?) -> Void
    ) {
        if isValidURL(source), let imageUrl = URL(string: source) {
            URLSession.shared.dataTask(with: imageUrl) { data, response, error in
                if let error = error {
                    completion(nil, error)
                } else if let data = data, let image = UIImage(data: data) {
                    completion(image, nil)
                } else {
                    let error = NSError(domain: "ImageLoadingError", code: 0, userInfo: [NSLocalizedDescriptionKey: "Failed to load or convert image from URL: \(imageUrl)"])
                    completion(nil, error)
                }
            }.resume()
        } else {
            if let image = UIImage(named: source) {
                completion(image, nil)
            } else {
                let error = NSError(domain: "ImageLoadingError", code: 0, userInfo: [NSLocalizedDescriptionKey: "No matching asset image found: \(source)"])
                completion(nil, error)
            }
        }
    }
    
    private static func isValidURL(_ urlString: String) -> Bool {
        // URL 정규식 패턴
        let urlPattern = #"^(http(s)?:\/\/)[-a-zA-Z0-9@:%._\+~#=]{2,256}\.[a-z]{2,6}\b([-a-zA-Z0-9@:%_\+.~#?&//=]*)$"# 
        
        // NSPredicate를 사용하여 정규식 패턴에 맞는지 확인
        let predicate = NSPredicate(format:"SELF MATCHES %@", urlPattern)
        return predicate.evaluate(with: urlString)
    }
}
