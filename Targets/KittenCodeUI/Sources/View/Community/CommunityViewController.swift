//
//  CommunityViewController.swift
//  UMC-Kitten-iOS
//
//  Created by 김정호 on 1/22/24.
//

import UIKit

import KittenCommonUI
import KittenService

import Moya

final public class CommunityViewController: BaseViewController {
    // MARK: - 프로퍼티
    private let postService = MoyaProvider<PostApiClient>()
    let communityView = CommunityView()
    var didSetTapConstraints = false
    
    /// tab 관련
    var tapWidthArray: [Double] = [] // 넓이
    var tapLeadingArray: [Double] = [] // 왼쪽으로부터 거리
    var tapSpacingWidth: Double = 0.0 // 간격
    
    // MARK: - 데이터
//    var posts: [BoardType: [PostModel]] = [:]
    var posts = [PostTypeDto: [PostResponseDto.PostPreviewDto]]()
    var postList: [PostResponseDto.PostPreviewDto] = []
    
    var currentPostType: PostTypeDto = .boast
//    var currentBoardType: BoardType = .boast
    
    // MARK: Set Method
    public override func setStyle() {
        navigationController?.navigationBar.tintColor = .black
        navigationController?.navigationBar.topItem?.title = ""
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.navigationBar.standardAppearance.backgroundColor = .white
        navigationController?.navigationBar.standardAppearance.shadowColor = .clear
    }
    
    // MARK: - 라이프 사이클
    public override func loadView() {
        view = communityView
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    public override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    public override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        if !didSetTapConstraints {
            setTapConstraint()
            didTapTapButton(button: communityView.firstTapButton)
            didSetTapConstraints = true
        }
    }
    
    // MARK: - 메소드
    public override func setDelegate() {
        communityView.tableView.delegate = self
        communityView.tableView.dataSource = self
    }
    
    public override func setHierarchy() {
        communityView.tableView.register(FreeBoardTableViewCell.self, forCellReuseIdentifier: "FreeBoardTableViewCell")
    }
    
    public override func setBind() {
        communityView.firstTapButton.addTarget(self, action: #selector(didTapTapButton), for: .touchUpInside)
        communityView.secondTapButton.addTarget(self, action: #selector(didTapTapButton), for: .touchUpInside)
        communityView.thirdTapButton.addTarget(self, action: #selector(didTapTapButton), for: .touchUpInside)
        communityView.plusButton.addTarget(self, action: #selector(didTapPlusButton), for: .touchUpInside)
    }
    
    @objc private func didTapTapButton(button: UIButton) {
        print("Button tapped")
        let tapButtons = communityView.tapStackView.arrangedSubviews
        let buttonText = button.titleLabel!.text!
        let buttonWidth = Double(communityView.tapStackView.bounds.width) / Double(tapButtons.count)
        
        switch buttonText {
        case "자랑해요":
            self.communityView.tapBottomViewWidth?.update(offset: buttonWidth)
            self.communityView.tapBottomViewLeading?.update(offset: tapLeadingArray[0])
            setTapButtonTextColor(0)
            currentPostType = .boast
        case "리뷰해요":
            self.communityView.tapBottomViewWidth?.update(offset: buttonWidth)
            self.communityView.tapBottomViewLeading?.update(offset: tapLeadingArray[1])
            setTapButtonTextColor(1)
            currentPostType = .review
        case "자유게시판":
            self.communityView.tapBottomViewWidth?.update(offset: buttonWidth)
            self.communityView.tapBottomViewLeading?.update(offset: tapLeadingArray[2])
            setTapButtonTextColor(2)
            currentPostType = .free
        default:
            break
        }
        
        fetchPosts(with: currentPostType)
        
        UIView.animate(withDuration: 0.3) {
            self.view.layoutIfNeeded()
        }
        communityView.tableView.reloadData()
        
        func setTapButtonTextColor(_ buttonNum: Int) {
            let tapButtons = communityView.tapStackView.arrangedSubviews.map { $0 as! UIButton }
            let unTappedColor = UIColor(red: 0.596, green: 0.596, blue: 0.62, alpha: 1)
            
            tapButtons.forEach { $0.setTitleColor(unTappedColor, for: .normal) }
            tapButtons[buttonNum].setTitleColor(.black, for: .normal)
        }
    }
    
    @objc private func didTapPlusButton() {
        let communityPostViewController = CommunityPostViewController()
        pushView(vc: communityPostViewController)
    }
    
    private func setTapConstraint() {
        let tapButtons = communityView.tapStackView.arrangedSubviews
        let buttonWidth = Double(communityView.tapStackView.bounds.width) / Double(tapButtons.count)
        
        tapLeadingArray = []
        for i in 0..<tapButtons.count {
            let leading = Double(i) * buttonWidth + 30.0
            tapLeadingArray.append(leading)
        }
    }
    
    private func fetchPosts(with type: PostTypeDto) {
        postService.request(.getPostsByBoard(postType: type, page: 0)) { [weak self] result in
            switch result {
                case let .success(moyaResponse):
                do {
                    /// date 포맷과 백엔드의 createdAt가 자꾸 충돌 일어나서 변경작업을 수행.
                    /// 배보다 배꼽이 커진것같다...
                    let dateFormatter = DateFormatter()
                    dateFormatter.locale = Locale(identifier: "en_US_POSIX")
                    dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
                    dateFormatter.timeZone = TimeZone(secondsFromGMT: 0)
                    
                    let decoder = JSONDecoder()
                    decoder.dateDecodingStrategy = .formatted(dateFormatter)
                    let data = try decoder.decode(ApiResponse<PostResponseDto.PostPreviewListDto>.self, from: moyaResponse.data)
                                    
                    self?.posts[type] = data.result.postList
                                    
                    DispatchQueue.main.async {
                        self?.communityView.tableView.reloadData()
                    }
                    
                } catch {
                    print("Decoding error: \(error)")
                }
                    
                case let .failure(error):
                    print("Error: \(error)")
                }
            }
    }
}

extension CommunityViewController: UITableViewDelegate {
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let freeBoardDetailViewController = FreeBoardDetailViewController()
        /// 선택한 게시글의 정보 전달
        if let postPreviewDto = posts[currentPostType]?[indexPath.row] {
            freeBoardDetailViewController.post = postPreviewDto
        }
        pushView(vc: freeBoardDetailViewController)
    }
}

extension CommunityViewController: UITableViewDataSource {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts[currentPostType]?.count ?? 0
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "FreeBoardTableViewCell", for: indexPath) as! FreeBoardTableViewCell
        if let postPreviewDto = posts[currentPostType]?[indexPath.row] {
            cell.titleLabel.text = postPreviewDto.title
            cell.contentLabel.text = postPreviewDto.content
            cell.heartCountLabel.text = "\(postPreviewDto.likePreviewListDTO.likeList.count)"
            cell.commentCountLabel.text = "\(postPreviewDto.commentPreviewListDTO.commentList.count)"
            cell.uploadDateLabel.text = postPreviewDto.createdAt.timeAgoDisplay()
            cell.userNameLabel.text = postPreviewDto.writerNickName
        }
        
        cell.selectionStyle = .none
        
        return cell
    }
}
