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
        return 11
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "FreeBoardDetailContentTableViewCell", for: indexPath) as! FreeBoardDetailContentTableViewCell
            
            cell.nicknameLabel.text = "냥뭉이"
            cell.uploadDateLabel.text = "20분 전"
            cell.titleLabel.text = "강아지 목에 이상한 멍울 자국 관련 문의"
            cell.contentLabel.text = "새해에는 새롭게 출발하는 거야!\n오늘도 냥이와 함께하는 하루일과!"
            cell.heartCountLabel.text = "20"
            cell.commentCountLabel.text = "1"
            
            cell.contentCellDelegate = self
            
            cell.selectionStyle = .none
            
            return cell
        } else if indexPath.row % 2 == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "FreeBoardDetailCommentTableViewCell", for: indexPath) as! FreeBoardDetailCommentTableViewCell
            
            cell.userNameLabel.text = "냥뭉이"
            cell.userCommentLabel.text = "너무 귀여워요!"
            cell.heartCountLabel.text = "25"

            cell.selectionStyle = .none
            
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "FreeBoardDetailNestedCommentTableViewCell", for: indexPath) as! FreeBoardDetailNestedCommentTableViewCell
            
            cell.userNameLabel.text = "냥뭉이"
            cell.userCommentLabel.text = "너무 귀여워요!"
            
            cell.selectionStyle = .none
            
            return cell
        }
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
