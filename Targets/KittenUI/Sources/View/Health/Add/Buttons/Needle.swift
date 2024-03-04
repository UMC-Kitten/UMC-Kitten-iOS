import UIKit

class NeedleView: UIView {
    
    
    let titles = ["종합백신", "코로나장염", "인플루엔자", "켄넬코프", "광견병"]

    let buttonFillPositions: [String: Int] = [
        "종합백신": 0,  // 예: "종합백신" 제목에 대해서는 첫 번째 버튼을 채웁니다.
        "코로나장염": 4, // "코로나장염"에 대해서는 두 번째 버튼을 채웁니다.
        "인플루엔자": 2, // 이와 같이 각 제목에 대한 버튼의 위치를 지정합니다.
        "켄넬코프": 2,
        "광견병": 1
    ]
    
        override init(frame: CGRect) {
            super.init(frame: frame)
            setupViews()
        }
        
        required init?(coder: NSCoder) {
            super.init(coder: coder)
            setupViews()
        }
        
    
        private func setupViews() {
            
            let titleLabel = UILabel()
                titleLabel.text = "주요 접종 현황표"
                titleLabel.font = UIFont.boldSystemFont(ofSize: 15)
                titleLabel.textAlignment = .left
            
            titleLabel.translatesAutoresizingMaskIntoConstraints = false
                addSubview(titleLabel)
            
            NSLayoutConstraint.activate([
                    titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 17), // 상단 여백
                    titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15), // 좌측 여백
                    titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0) // 우측 여백, 필요에 따라 조정
                ])
            
            // 전체 스택 뷰를 만듭니다.
            let stackView = UIStackView()
            stackView.axis = .vertical
            stackView.distribution = .fillEqually
            stackView.alignment = .fill
            stackView.spacing = -90
            
            
            // 각 항목에 대해 레이블과 수평 스택 뷰를 만듭니다.
            titles.enumerated().forEach { (index, title) in
                let label = UILabel()
                label.text = title
                label.font = UIFont.systemFont(ofSize: 14)
                
                let buttonsStackView = UIStackView()
                buttonsStackView.axis = .horizontal
                buttonsStackView.distribution = .fillEqually
                buttonsStackView.alignment = .center
                buttonsStackView.spacing = 10
                
                // 5개의 버튼을 만들고, 조건에 따라 특정 버튼에만 색상을 채웁니다.
                for buttonIndex in 0..<5 {
                    let button = UIButton()
                    button.layer.borderWidth = 1
                    button.layer.borderColor = UIColor.lightGray.cgColor
                    button.layer.cornerRadius = 13
                    button.backgroundColor = .white // 기본 배경색 설정
                    
                    // 버튼 크기를 설정합니다.
                    button.widthAnchor.constraint(equalToConstant: 28).isActive = true
                    button.heightAnchor.constraint(equalToConstant: 28).isActive = true
                    
                    // 제목에 따른 버튼 위치에만 색상을 채웁니다.
                    if let fillPosition = buttonFillPositions[title], fillPosition == buttonIndex {
                        button.backgroundColor = UIColor.appButton // 채워진 상태를 나타내는 색상으로 변경합니다.
                    }
                    
                    buttonsStackView.addArrangedSubview(button)
                }
                
                let horizontalStackView = UIStackView(arrangedSubviews: [label, buttonsStackView])
                horizontalStackView.axis = .horizontal
                horizontalStackView.distribution = .fill
                horizontalStackView.alignment = .center
                horizontalStackView.spacing = 4
                
                label.widthAnchor.constraint(equalToConstant: 130).isActive = true
                
                stackView.addArrangedSubview(horizontalStackView)
            }
            
            // 스택 뷰를 뷰에 추가하고 제약 조건을 설정합니다.
            stackView.translatesAutoresizingMaskIntoConstraints = false
            addSubview(stackView)
            
            NSLayoutConstraint.activate([
                stackView.topAnchor.constraint(equalTo: self.topAnchor),
                stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 30),
                stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15),
                stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -15)
            ])
        }
}
