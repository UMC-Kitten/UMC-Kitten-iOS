//
//  PostModel.swift
//  UMC-Kitten-iOS
//
//  Created by DOYEON LEE on 2/9/24.
//

import Foundation

/// 자유게시판 글 정보
public struct PostModel: Codable {
    /// 게시판
    public var boardType: BoardType
    /// 사진
    public var imageUrl: String?
    /// 게시글 제목
    public var postTitle: String
    /// 본문
    public var body: String
    /// 좋아요(하트) 개수
    public var likeCount: Int
    /// 댓글 개수
    public var commentCount: Int
    /// 작성일
    public var date: Date
    /// 작성자
    public var writer: String
}
