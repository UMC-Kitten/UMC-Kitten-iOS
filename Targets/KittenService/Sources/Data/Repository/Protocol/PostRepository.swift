//
//  PostRepository.swift
//  UMC-Kitten-iOS
//
//  Created by DOYEON LEE on 2/13/24.
//

import Foundation

/// 게시글 생성 및 조회 레포지토리
public protocol PostRepository {
    
    /// 게시판 별 게시글 전체 조회
    func getAllPostByBoard(
        boardType: BoardType,
        page: Int,
    completion: @escaping (_ result: [PostModel]?, _ error: Error?) -> Void
    )
    
    /// 인기 게시글 조회
    func getPopularPost(
        completion: @escaping (_ result: [PostModel]?, _ error: Error?) -> Void
    )
    
    /// 오늘의 피드 조회
    func getTodayFeed(
        completion: @escaping (_ result: [PostModel]?, _ error: Error?) -> Void
    )
    
    /// 게시글 등록
    func addPost(
        post: PostModel,
        completion: @escaping (_ result: PostModel?, _ error: Error?) -> Void
    )
    
    /// 게시글 삭제
    func deletePost(
        postId: Int64,
        completion: @escaping (_ result: Bool?, _ error: Error?) -> Void
    )
}

