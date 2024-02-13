//
//  PostModel.swift
//  UMC-Kitten-iOS
//
//  Created by DOYEON LEE on 2/9/24.
//

import Foundation

/// 자유게시판 글 정보
struct PostModel {
    /// 게시판
    var boardType: BoardType
    /// 사진
    var imageUrl: String?
    /// 게시글 제목
    var postTitle: String
    /// 본문
    var body: String
    /// 좋아요(하트) 개수
    var likeCount: Int
    /// 댓글 개수
    var commentCount: Int
    /// 작성일
    var date: Date
    /// 작성자
    var writer: String
}
