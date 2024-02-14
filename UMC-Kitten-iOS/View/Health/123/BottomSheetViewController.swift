import UIKit

class BottomSheetViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        // 커스텀 UI와 제스처 인식기 설정
    }
    
    // 커스텀 bottom sheet 높이
    var height: CGFloat = 300
    // bottom sheet가 전체 뷰에서 얼마나 위로 올라갈지 결정하는 값
    var topMargin: CGFloat = 200

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        prepareBackgroundView()
    }

    
     func prepareBackgroundView(){
        let blurEffect = UIBlurEffect(style: .dark)
        let visualEffectView = UIVisualEffectView(effect: blurEffect)
        visualEffectView.frame = self.view.frame
        self.view.insertSubview(visualEffectView, at: 0)
    }
}

class CustomPresentationController: UIPresentationController {
    // height 변수를 CustomPresentationController에 추가
    private var height: CGFloat
    
    // CustomPresentationController의 생성자에서 height 값을 초기화
    init(presentedViewController: UIViewController, presenting presentingViewController: UIViewController?, height: CGFloat) {
        self.height = height
        super.init(presentedViewController: presentedViewController, presenting: presentingViewController)
    }
    
    override var frameOfPresentedViewInContainerView: CGRect {
        guard let containerView = containerView else {
            return .zero
        }

        // 이제 height 변수를 사용할 수 있습니다.
        return CGRect(x: 0, y: containerView.bounds.height - height, width: containerView.bounds.width, height: height)
    }
    
    // ... 여기에 다른 필요한 코드를 추가 ...
}
