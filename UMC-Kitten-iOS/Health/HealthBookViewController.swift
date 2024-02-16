import UIKit

class HealthBookViewController: UIViewController {
    
    let customView = NeedleView()
    let customTwoView = NeedleTwoView()
    
    //let slidingBarButton1 = SlidingBarButton(type: .system)
    //let slidingBarButton2 = SlidingBarButton(type: .system)
    
    
    @IBOutlet weak var addButton: UIButton!
    
    
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
    
    // 선택된 배경색과 선택되지 않은 배경색을 정의합니다.
    let selectedTintColor: UIColor = UIColor.selection
    let deselectedTintColor: UIColor = UIColor.systemGray4
    
    // 선택된 버튼들을 추적하는 배열
    var selectedButtons = [UIButton]()
    
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var dogView: UIView!
    @IBOutlet weak var dogLabel: UILabel!
    @IBOutlet weak var catView: UIView!
    @IBOutlet weak var catLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.bringSubviewToFront(addButton)
        
        configureButtons()
        
        
        setupNeedleView()
        setupNeedleTwoView()
        
        showFirstView()
        customView.isHidden = false
        customTwoView.isHidden = true
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTapOne(_:)))
        dogView.addGestureRecognizer(tapGesture)
        
        let tapGesturetwo = UITapGestureRecognizer(target: self, action: #selector(handleTapTwo(_:)))
        catView.addGestureRecognizer(tapGesturetwo)
        
        
        self.view.addSubview(dogView)
        self.view.addSubview(catView)
        
        tableView.delegate = self
        tableView.dataSource = self
        
        let feedNib = UINib(nibName: "FeedTableViewCell", bundle: nil)
        tableView.register(feedNib, forCellReuseIdentifier: "FeedTableViewCell")
        
        /*
        slidingBarButton1.setTitle("건강수첩", for: .normal)
        slidingBarButton2.setTitle("가계부", for: .normal)
        
        slidingBarButton1.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
        slidingBarButton2.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
        
        slidingBarButton1.isSelected = true
        slidingBarButton2.isSelected = false
        
        slidingBarButton1.animateUnderlineView(shouldShow: slidingBarButton1.isSelected)
        
        
        
        let stackView = UIStackView(arrangedSubviews: [slidingBarButton1, slidingBarButton2])
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 120
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        // Add the stack view to the view controller's view
        view.addSubview(stackView)
        
        // Set Auto Layout constraints for the stack view
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 45)
        ])
        */
    }
    
    
    @IBAction func goToAdd(_ sender: UIButton) {
        
        let storyboard = UIStoryboard(name: "Next", bundle: nil)
        let nextViewController = storyboard.instantiateViewController(withIdentifier: "NEXT") as! NextViewController
        
        self.navigationController?.pushViewController(nextViewController, animated: true)
        
    }
    
    @objc func handleTapOne(_ sender: UITapGestureRecognizer) {
        showFirstView()
        customView.isHidden = false
        customTwoView.isHidden = true
        print("first tap")
    }
    
    @objc func handleTapTwo(_ sender: UITapGestureRecognizer) {
        showSecondView()
        customView.isHidden = true
        customTwoView.isHidden = false
        print("second tap")
    }
    
    // 첫 번째 UIView를 보여주는 메서드
    private func showFirstView() {
        dogView.backgroundColor = UIColor.appButton
        catView.backgroundColor = .systemGray5
        
        dogView.layer.shadowColor = UIColor.black.cgColor
        dogView.layer.shadowOpacity = 0.25
        dogView.layer.shadowOffset = CGSize(width: 2, height: 2)
        dogView.layer.shadowRadius = 4.0
        dogView.layer.cornerRadius = 10
        
        catView.layer.shadowColor = UIColor.white.cgColor
        catView.layer.shadowOpacity = 0
        catView.layer.shadowOffset = CGSize(width: 0, height: 0)
        catView.layer.shadowRadius = 0
        catView.layer.cornerRadius = 10
        
    }
    
    // 두 번째 UIView를 보여주는 메서드
    private func showSecondView() {
        dogView.backgroundColor = .systemGray5
        catView.backgroundColor = UIColor.appButton
        
        catView.layer.shadowColor = UIColor.black.cgColor
        catView.layer.shadowOpacity = 0.25
        catView.layer.shadowOffset = CGSize(width: 2, height: 2)
        catView.layer.shadowRadius = 4.0
        catView.layer.cornerRadius = 10
        
        dogView.layer.shadowColor = UIColor.white.cgColor
        dogView.layer.shadowOpacity = 0
        dogView.layer.shadowOffset = CGSize(width: 0, height: 0)
        dogView.layer.shadowRadius = 0
        dogView.layer.cornerRadius = 10
    }
    
    func setupNeedleView() {
        customView.backgroundColor = .white
        customView.layer.borderWidth = 1
        customView.layer.borderColor = UIColor.systemGray5.cgColor
        view.addSubview(customView)
        
        // 제약 조건을 설정하여 화면에 배치합니다.
        customView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            customView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            customView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 130),
            customView.widthAnchor.constraint(equalToConstant: 340),
            customView.heightAnchor.constraint(equalToConstant: 220)
        ])
    }
    
    func setupNeedleTwoView() {
        customTwoView.backgroundColor = .white
        customTwoView.layer.borderWidth = 1
        customTwoView.layer.borderColor = UIColor.systemGray5.cgColor
        view.addSubview(customTwoView)
        
        // 제약 조건을 설정하여 화면에 배치합니다.
        customTwoView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            customTwoView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            customTwoView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 130),
            customTwoView.widthAnchor.constraint(equalToConstant: 340),
            customTwoView.heightAnchor.constraint(equalToConstant: 160)
        ])
    }
   
    /*
    @objc func buttonTapped(_ sender: SlidingBarButton) {
        // Deselect all buttons
        [slidingBarButton1, slidingBarButton2].forEach { button in
            button.isSelected = false
            // This assumes your SlidingBarButton handles its visual state internally based on the isSelected property.
            // If not, adjust the visual state here as needed.
        }
        // Select the tapped button
        sender.isSelected = true
        // If the tapped button should manage its own state, remove this line and ensure the button toggles its state internally.
    }
    */
    
    // 모든 버튼의 초기 상태를 설정하는 함수
        private func configureButtons() {
            let allButtons = [button1, button2, button3, button4] // ... 추가 버튼들을 배열에 포함시킵니다.
            for button in allButtons {
                button?.tintColor = deselectedTintColor
                button?.layer.cornerRadius = 5
                // 기타 초기화 코드
            }
        }
    
    @IBAction func buttonOne(_ sender: UIButton) {
        // 선택 상태를 토글합니다.
            sender.isSelected.toggle()

            // 선택된 상태에 따라 tintColor를 변경합니다.
            sender.tintColor = sender.isSelected ? selectedTintColor : deselectedTintColor

            // 선택된 버튼 배열을 업데이트합니다.
            if sender.isSelected {
                selectedButtons.append(sender)
            } else {
                selectedButtons.removeAll { $0 == sender }
            }

            // 선택된 버튼에 대한 처리를 여기서 할 수 있습니다.
            // 예를 들어, 선택된 버튼의 정보를 사용합니다.
        }
    
    @IBAction func buttonTwo(_ sender: UIButton) {
        // 선택 상태를 토글합니다.
            sender.isSelected.toggle()

            // 선택된 상태에 따라 tintColor를 변경합니다.
            sender.tintColor = sender.isSelected ? selectedTintColor : deselectedTintColor

            // 선택된 버튼 배열을 업데이트합니다.
            if sender.isSelected {
                selectedButtons.append(sender)
            } else {
                selectedButtons.removeAll { $0 == sender }
            }

            // 선택된 버튼에 대한 처리를 여기서 할 수 있습니다.
            // 예를 들어, 선택된 버튼의 정보를 사용합니다.
        }
    
    @IBAction func buttonThree(_ sender: UIButton) {
        // 선택 상태를 토글합니다.
            sender.isSelected.toggle()

            // 선택된 상태에 따라 tintColor를 변경합니다.
            sender.tintColor = sender.isSelected ? selectedTintColor : deselectedTintColor

            // 선택된 버튼 배열을 업데이트합니다.
            if sender.isSelected {
                selectedButtons.append(sender)
            } else {
                selectedButtons.removeAll { $0 == sender }
            }

            // 선택된 버튼에 대한 처리를 여기서 할 수 있습니다.
            // 예를 들어, 선택된 버튼의 정보를 사용합니다.
        }
    
    @IBAction func buttonFour(_ sender: UIButton) {
        // 선택 상태를 토글합니다.
            sender.isSelected.toggle()

            // 선택된 상태에 따라 tintColor를 변경합니다.
            sender.tintColor = sender.isSelected ? selectedTintColor : deselectedTintColor

            // 선택된 버튼 배열을 업데이트합니다.
            if sender.isSelected {
                selectedButtons.append(sender)
            } else {
                selectedButtons.removeAll { $0 == sender }
            }

            // 선택된 버튼에 대한 처리를 여기서 할 수 있습니다.
            // 예를 들어, 선택된 버튼의 정보를 사용합니다.
        }
}


extension HealthBookViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "FeedTableViewCell", for: indexPath) as? FeedTableViewCell else { return UITableViewCell()
        }
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
}
