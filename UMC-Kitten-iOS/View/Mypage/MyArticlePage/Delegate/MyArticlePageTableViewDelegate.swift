//
//  MyArticlePageTableViewDelegate.swift
//  UMC-Kitten-iOS
//
//  Created by DOYEON LEE on 1/31/24.
//

import UIKit

extension MyArticlePage: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10 // 원하는 행의 개수로 수정
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MyTableViewCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // 셀 선택 시 동작
        
    }
}
