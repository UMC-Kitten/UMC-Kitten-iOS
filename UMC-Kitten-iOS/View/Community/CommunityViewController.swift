//
//  CommunityViewController.swift
//  UMC-Kitten-iOS
//
//  Created by 김정호 on 1/22/24.
//

import UIKit

final class CommunityViewController: UIViewController {
    
    // MARK: - 프로퍼티
    let communityView = CommunityView()
    
    // 탭 수치 관련
    var tapWidthArray: [Double] = [] // 넓이
    var tapLeadingArray: [Double] = [] // 왼쪽으로부터 거리
    var tapSpacingWidth: Double = 0.0 // 간격
    
    // MARK: - 라이프 사이클
    override func loadView() {
        view = communityView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setTableView()
        setAddTarget()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        setTapConstraint()
    }

    // MARK: - 메소드
    private func setTableView() {
        communityView.tableView.delegate = self
        communityView.tableView.dataSource = self
        communityView.tableView.register(FreeBoardTableViewCell.self, forCellReuseIdentifier: "FreeBoardTableViewCell")
    }
    
    private func setAddTarget() {
        communityView.firstTapButton.addTarget(self, action: #selector(didTapTapButton), for: .touchUpInside)
        communityView.secondTapButton.addTarget(self, action: #selector(didTapTapButton), for: .touchUpInside)
        communityView.thirdTapButton.addTarget(self, action: #selector(didTapTapButton), for: .touchUpInside)
        communityView.fourthTapButton.addTarget(self, action: #selector(didTapTapButton), for: .touchUpInside)
        communityView.plusButton.addTarget(self, action: #selector(didTapPlusButton), for: .touchUpInside)
    }
    
    @objc private func didTapTapButton(button: UIButton) {
        let buttonText = button.titleLabel!.text!
        
        switch buttonText {
        case "자랑해요":
            self.communityView.tapBottomViewWidth?.update(offset: tapWidthArray[0])
            self.communityView.tapBottomViewLeading?.update(offset: tapLeadingArray[0])
            setTapButtonTextColor(0)
        case "리뷰해요":
            self.communityView.tapBottomViewWidth?.update(offset: tapWidthArray[1])
            self.communityView.tapBottomViewLeading?.update(offset: tapLeadingArray[1])
            setTapButtonTextColor(1)
        case "자유게시판":
            self.communityView.tapBottomViewWidth?.update(offset: tapWidthArray[2])
            self.communityView.tapBottomViewLeading?.update(offset: tapLeadingArray[2])
            setTapButtonTextColor(2)
        case "입양/실종":
            self.communityView.tapBottomViewWidth?.update(offset: tapWidthArray[3])
            self.communityView.tapBottomViewLeading?.update(offset: tapLeadingArray[3])
            setTapButtonTextColor(3)
        default:
            break
        }
        
        UIView.animate(withDuration: 0.3) {
            self.view.layoutIfNeeded()
        }
        
        func setTapButtonTextColor(_ buttonNum: Int) {
            let tapButtons = communityView.tapStackView.arrangedSubviews.map { $0 as! UIButton }
            let unTappedColor = UIColor(red: 0.596, green: 0.596, blue: 0.62, alpha: 1)
            
            tapButtons.forEach { $0.setTitleColor(unTappedColor, for: .normal) }
            tapButtons[buttonNum].setTitleColor(.black, for: .normal)
        }
    }
    
    @objc private func didTapPlusButton() {
        let communityPostViewController = CommunityPostViewController()
        communityPostViewController.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(communityPostViewController, animated: true)
    }
    
    private func setTapConstraint() {
        tapWidthArray = [communityView.firstTapButton.frame.width,
                         communityView.secondTapButton.frame.width,
                         communityView.thirdTapButton.frame.width,
                         communityView.fourthTapButton.frame.width]
        
        tapSpacingWidth = (self.communityView.frame.width
                                    - tapWidthArray[0]
                                    - tapWidthArray[1]
                                    - tapWidthArray[2]
                                    - tapWidthArray[3] - 60) / 3
        
        tapLeadingArray = [baseWidth(0),
                           baseWidth(1) + tapWidthArray[0],
                           baseWidth(2) + tapWidthArray[0] + tapWidthArray[1],
                           baseWidth(3) + tapWidthArray[0] + tapWidthArray[1] + tapWidthArray[2]]
        
        self.communityView.tapBottomViewWidth?.update(offset: tapWidthArray[tapWidthArray.startIndex])
        self.communityView.tapBottomViewLeading?.update(offset: tapLeadingArray[tapLeadingArray.startIndex])
        
        func baseWidth(_ num: Int) -> Double {
            return 30.0 + (tapSpacingWidth * Double(num))
        }
    }
}

extension CommunityViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let freeBoardDetailViewController = FreeBoardDetailViewController()
        freeBoardDetailViewController.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(freeBoardDetailViewController, animated: true)
    }
}

extension CommunityViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FreeBoardTableViewCell", for: indexPath) as! FreeBoardTableViewCell
        
        cell.titleLabel.text = "제목입니다."
        cell.contentLabel.text = "내용입니다."
        cell.heartCountLabel.text = "999"
        cell.commentCountLabel.text = "999"
        cell.uploadDateLabel.text = "|   01/25 "
        cell.userNameLabel.text = "|   나는 집사"
        
        cell.selectionStyle = .none
        
        return cell
    }
}
