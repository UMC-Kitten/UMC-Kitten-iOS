import UIKit

class HealthBookViewController: UIViewController {
    
    let customView = NeedleView()
    let customTwoView = NeedleTwoView()
    
    let slidingBarButton1 = SlidingBarButton(type: .system)
    let slidingBarButton2 = SlidingBarButton(type: .system)
    
    
    @IBOutlet weak var firstStackView: UIView!
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var dogView: UIView!
    @IBOutlet weak var dogLabel: UILabel!
    @IBOutlet weak var catView: UIView!
    @IBOutlet weak var catLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
    }
    
    @IBAction func goToAdd(_ sender: UIButton) {
        
        let storyboard = UIStoryboard(name: "Add", bundle: nil)
        let addViewController = storyboard.instantiateViewController(withIdentifier: "ADD") as! AddViewController
        
        self.navigationController?.pushViewController(addViewController, animated: true)
        
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
