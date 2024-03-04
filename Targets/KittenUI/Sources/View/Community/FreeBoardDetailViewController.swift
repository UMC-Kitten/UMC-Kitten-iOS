//
//  FreeBoardDetailViewController.swift
//  UMC-Kitten-iOS
//
//  Created by 김정호 on 1/31/24.
//

import UIKit

class FreeBoardDetailViewController: UIViewController {

    // MARK: - 프로퍼티
    let freeBoardDetailView = FreeBoardDetailView()
    var post: PostResponseDto.PostPreviewDto?
    
    // MARK: - 라이프 사이클
    override func loadView() {
        view = freeBoardDetailView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setNavigationBar()
        setTextField()
        setTableView()
    }
    
    // MARK: - 메소드
    private func setNavigationBar() {
        title = "게시물 보기"
    }
    
    private func setTextField() {
        freeBoardDetailView.commentTextField.delegate = self
    }
    
    private func setTableView() {
        freeBoardDetailView.tableView.delegate = self
        freeBoardDetailView.tableView.dataSource = self
        freeBoardDetailView.tableView.register(FreeBoardDetailContentTableViewCell.self, forCellReuseIdentifier: "FreeBoardDetailContentTableViewCell")
        freeBoardDetailView.tableView.register(FreeBoardDetailCommentTableViewCell.self, forCellReuseIdentifier: "FreeBoardDetailCommentTableViewCell")
        freeBoardDetailView.tableView.register(FreeBoardDetailNestedCommentTableViewCell.self, forCellReuseIdentifier: "FreeBoardDetailNestedCommentTableViewCell")
    }
}

extension FreeBoardDetailViewController: UITextFieldDelegate {
}

extension FreeBoardDetailViewController: UITableViewDelegate {
}

extension FreeBoardDetailViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1 + (post?.commentPreviewListDTO.commentList.count ?? 0)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "FreeBoardDetailContentTableViewCell", for: indexPath) as! FreeBoardDetailContentTableViewCell
            
            cell.nicknameLabel.text = post?.writerNickName
            cell.uploadDateLabel.text = post?.createdAt.timeAgoDisplay()
            cell.titleLabel.text = post?.title
            cell.contentLabel.text = post?.content
            cell.heartCountLabel.text = "\(post?.likePreviewListDTO.listSize ?? 0)"
            cell.commentCountLabel.text = "\(post?.commentPreviewListDTO.listSize ?? 0)"
            
            cell.contentCellDelegate = self
            cell.selectionStyle = .none
            
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "FreeBoardDetailCommentTableViewCell", for: indexPath) as! FreeBoardDetailCommentTableViewCell

            // 댓글 데이터를 가져오기
            let comment = post?.commentPreviewListDTO.commentList[indexPath.row - 1]
            /// 댓글 Dto에 참조된 데이터들이 너무 꼬여있어 일부분만 받아서 댓글 닉네임을 따로 뽑진 못했습니다!
            cell.userNameLabel.text = "회원 \(indexPath.row)"
            cell.userCommentLabel.text = comment?.content
            cell.heartCountLabel.text = "0"

            cell.selectionStyle = .none

            return cell
        }
        /// 대댓글은 구현 X
//        else {
//            let cell = tableView.dequeueReusableCell(withIdentifier: "FreeBoardDetailNestedCommentTableViewCell", for: indexPath) as! FreeBoardDetailNestedCommentTableViewCell
//            
//            cell.userNameLabel.text = "냥뭉이"
//            cell.userCommentLabel.text = "너무 귀여워요!"
//            
//            cell.selectionStyle = .none
//            
//            return cell
//        }
    }
}

extension FreeBoardDetailViewController: ContentCellDelegate {
    func didTapMoreButton() {
        let alert = UIAlertController()
        
        let edit = UIAlertAction(title: "게시물 수정", style: .default) { action in
            print("수정버튼이 눌렸습니다.")
        }
        let remove = UIAlertAction(title: "게시물 삭제", style: .destructive) { action in
            print("삭제버튼이 눌렸습니다.")
        }
        let cancel = UIAlertAction(title: "취소", style: .cancel) { action in
            print("취소버튼이 눌렸습니다.")
        }
        
        alert.addAction(edit)
        alert.addAction(remove)
        alert.addAction(cancel)
        
        self.present(alert, animated: true, completion: nil)
    }
}
