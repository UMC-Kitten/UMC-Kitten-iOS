import UIKit

class HealthBookViewController: UIViewController {
    
    let customView = NeedleView()
    let customTwoView = NeedleTwoView()
    
    
    // 전체 데이터
    let titles = ["광견병", "당뇨병", "켄넬코프", "인플루엔자", "털미용", "광견병", "털미용", "코로나", "코로나장염", "건강수첩"]
    let subtitles = ["[예방접종]", "[질병]", "[질병]", "[예방접종]", "[건강수첩]", "[질병]", "[건강수첩]", "[질병]", "[예방접종]", "[건강수첩]"]
    let dates = ["2월 11일, 2024", "1월 30일, 2023", "9월 9일, 2021", "12월 31일, 2023", "11월 1일, 2019", "9월 30일 2023", "4월 8일, 2018", "6월 30일, 2020", "10월 10일, 2022", "7월 8일, 2020"]
    let hospitals = ["랑스종합동물병원", "경상대학교 동물의료원", "굿닥터동물병원", "수동물메디컬", "돌담동물병원", "펫동물병원", "현대동물병원", "마음동물병원", "한마음동물병원", "해뜨는동물병원"]
    let prices = ["13,250원", "20,000원", "9,700원", "100,000원", "398,200원", "38,000원", "59,700원", "100원", "20,000원", "67,090원"]
    let show = ["광견병 예방을 위해 주사를 놨다.", "강아지에게 당뇨병이 생긴거 같아 치료를 해주었다", "켄넬코프 병이,, 유행이라 해서 접종을 하였다...", "인플루엔자 예방접종 완료!!", "우리 애기 털이 쪘어요 미용을 위해 샾에 방문을 하였습니다.", "광견병이 정말 무서운 병이더...", "샤기컷으로 미용을 하였음.", "요즘 유행인 코로나 증상을 보여 백신을 맞으러..", "장염에 걸렸어요 ㅠㅠ 치료를 위해 병원에 방문했습니다.", "오늘 끙끙 앓는 소리를 내었길래 병원에서 진료를 보았습니다"]
        
        // 필터링된 데이터
        var filteredSubtitles: [String] = []
        
        // 현재 선택된 필터링 조건
        var currentFilter: String?
    
    
    
    
    
    
    
    @IBOutlet weak var label: UILabel!
    
    private var currentIndex = 0
    private let labelTexts = ["오복이", "김율", "몽자", "뽀삐", "쿠키"]
    
    
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
        
        filteredSubtitles = subtitles
        
        updateLabel()
        
        
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
        
        navigationController?.navigationBar.tintColor = .black
        navigationController?.navigationBar.topItem?.title = ""
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.navigationBar.standardAppearance.backgroundColor = .white
        navigationController?.navigationBar.standardAppearance.shadowColor = .clear
        
    }
    
    @IBAction func didTapNextButton(_ sender: UIButton) {
        currentIndex = (currentIndex + 1) % labelTexts.count
        updateLabel()
    }
    
    @IBAction func didTapPreviousButton(_ sender: UIButton) {
        currentIndex = (currentIndex - 1 + labelTexts.count) % labelTexts.count
        updateLabel()
    }
    
    private func updateLabel() {
        label.text = labelTexts[currentIndex]
    }
    
    
    @IBAction func goToAdd(_ sender: UIButton) {
        
        print("next 실행")
        
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
            customView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 105),
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
            customTwoView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 105),
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
        /*
        sender.isSelected.toggle()
        
        // 선택된 상태에 따라 tintColor를 변경합니다.
        sender.tintColor = sender.isSelected ? selectedTintColor : deselectedTintColor
        
        // 선택된 버튼 배열을 업데이트합니다.
        if sender.isSelected {
            selectedButtons.append(sender)
        } else {
            selectedButtons.removeAll { $0 == sender }
        }
         */
        
        // 선택된 버튼에 대한 처리를 여기서 할 수 있습니다.
        // 예를 들어, 선택된 버튼의 정보를 사용합니다.
    }
    
    @IBAction func buttonTwo(_ sender: UIButton) {
        // 선택 상태를 토글합니다.
        /*
        sender.isSelected.toggle()
        
        // 선택된 상태에 따라 tintColor를 변경합니다.
        sender.tintColor = sender.isSelected ? selectedTintColor : deselectedTintColor
        
        // 선택된 버튼 배열을 업데이트합니다.
        if sender.isSelected {
            selectedButtons.append(sender)
        } else {
            selectedButtons.removeAll { $0 == sender }
        }
         */
        
        // 선택된 버튼에 대한 처리를 여기서 할 수 있습니다.
        // 예를 들어, 선택된 버튼의 정보를 사용합니다.
    }
    
    @IBAction func buttonThree(_ sender: UIButton) {
        // 선택 상태를 토글합니다.
        /*
        sender.isSelected.toggle()
        
        // 선택된 상태에 따라 tintColor를 변경합니다.
        sender.tintColor = sender.isSelected ? selectedTintColor : deselectedTintColor
        
        // 선택된 버튼 배열을 업데이트합니다.
        if sender.isSelected {
            selectedButtons.append(sender)
        } else {
            selectedButtons.removeAll { $0 == sender }
        }
        */
        // 선택된 버튼에 대한 처리를 여기서 할 수 있습니다.
        // 예를 들어, 선택된 버튼의 정보를 사용합니다.
    }
    
    @IBAction func buttonFour(_ sender: UIButton) {
        // 선택 상태를 토글합니다.
        /*
         sender.isSelected.toggle()
        
        // 선택된 상태에 따라 tintColor를 변경합니다.
        sender.tintColor = sender.isSelected ? selectedTintColor : deselectedTintColor
        
        // 선택된 버튼 배열을 업데이트합니다.
        if sender.isSelected {
            selectedButtons.append(sender)
        } else {
            selectedButtons.removeAll { $0 == sender }
        }
         */
        
    }
    
    @IBAction func categoryButtonTapped(_ sender: UIButton) {
            switch sender.tag {
            case 0:
                currentFilter = nil
            case 1:
                currentFilter = "[예방접종]"
            case 2:
                currentFilter = "[건강수첩]"
            case 3:
                currentFilter = "[질병]"
            default:
                currentFilter = nil
            }
            
            filterContentForSelectedCategory()
        }
    
    func filterContentForSelectedCategory() {
            if let filter = currentFilter {
                // 필터링 조건에 맞는 데이터로 필터링합니다.
                filteredSubtitles = subtitles.filter { $0.contains(filter) }
            } else {
                // 필터링 조건이 없다면 모든 데이터를 표시합니다.
                filteredSubtitles = subtitles
            }
            
            // 필터링된 데이터로 테이블 뷰를 리로드합니다.
            tableView.reloadData()
        }
    
}
    
    extension HealthBookViewController: UITableViewDelegate, UITableViewDataSource {
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return filteredSubtitles.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "FeedTableViewCell", for: indexPath) as? FeedTableViewCell else { return UITableViewCell() }
            
            // 데이터 배열
        
            
            // 각 레이블에 데이터 할당
            cell.diseaseLabel.text = titles[indexPath.row]
            cell.diseaseNameLabel.text = subtitles[indexPath.row]
            cell.dateLabel.text = dates[indexPath.row]
            cell.firstLabel.text = hospitals[indexPath.row]
            cell.secondLabel.text = prices[indexPath.row]
            cell.texts.text = show[indexPath.row]
            
            return cell
        }
        
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 100
        }
        
    }
