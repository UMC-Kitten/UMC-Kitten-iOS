import UIKit

class SlidingBarButton: UIButton {
    // The underline view
    private let underlineView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear // Set to your desired color
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let normalFont = UIFont.systemFont(ofSize: 17)
    let selectedFont = UIFont.boldSystemFont(ofSize: 17)
    
    let normalTintColor = UIColor.black
    let selectedTintColor = UIColor.black

    
    // Initializer
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUnderlineView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUnderlineView()
    }
    
    override var isSelected: Bool {
            didSet {
    
                self.titleLabel?.font = isSelected ? selectedFont : normalFont
                self.backgroundColor = isSelected ? .white : .white
                
                self.tintColor = isSelected ? selectedTintColor : normalTintColor
                
                animateUnderlineView(shouldShow: isSelected)
            }
        }
    
    private func setupUnderlineView() {
        guard let titleLabel = self.titleLabel else { return }

        addSubview(underlineView)
        
        // Remove previous constraints if they exist
        underlineView.removeConstraints(underlineView.constraints)

        // Set new constraints for the underline view
        NSLayoutConstraint.activate([
            underlineView.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor, constant: -55),
            underlineView.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor, constant: 55),
            underlineView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 8), // Adjust the constant as needed
            underlineView.heightAnchor.constraint(equalToConstant: 3) // Height of the underline
        ])
        underlineView.isHidden = true // Hide initially
    }

    // Function to animate the underline view
    func animateUnderlineView(shouldShow: Bool) {
        UIView.animate(withDuration: 0.3) {
            self.underlineView.isHidden = !shouldShow
        }
    }
    
    // Function to call when the button is tapped
    @objc func buttonTapped() {
        animateUnderlineView(shouldShow: true)
        isSelected.toggle()
    }
    
    
}
