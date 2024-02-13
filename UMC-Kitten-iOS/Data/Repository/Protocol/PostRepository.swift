//
//  PostRepository.swift
//  UMC-Kitten-iOS
//
//  Created by DOYEON LEE on 2/13/24.
//

import Foundation

/// 게시글 생성 및 조회 레포지토리
protocol PostRepository {
    
    /// 게시판 별 게시글 전체 조회
    func getAllPostByBoard(
        boardType: BoardType,
        page: Int,
    completion: @escaping (_ result: [PostModel]?, _ error: Error?) -> Void
    )
}
