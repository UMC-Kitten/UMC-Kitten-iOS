//
//  FeedModel.swift
//  UMC-Kitten-iOS
//
//  Created by DOYEON LEE on 2/11/24.
//

import Foundation

/// 오늘의 피드, 자랑해요/리뷰해요 글 정보
struct FeedModel {
    /// 피드 이미지 이름
    var imageName: String // FIXME: URL로 변경
    /// 본문
    var body: String
    /// 작성일
    var date: Date
    /// 작성자
    var writer: String
}
