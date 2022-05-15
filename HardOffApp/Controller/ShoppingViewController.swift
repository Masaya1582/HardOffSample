

import UIKit
import Lottie

class ShoppingViewController: UIViewController {
    
    @IBOutlet weak var lottieSorryView: LottieView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        showSorryAnimation()
    }
    
    //lottieファイルの設定(センターポジションのアニメーション)
    private func showSorryAnimation() {
        let animationView = AnimationView(name: "sorry")
        animationView.frame = lottieSorryView.bounds
        animationView.center = self.lottieSorryView.center
        animationView.loopMode = .loop
        animationView.animationSpeed = 1
        view.addSubview(animationView)
        animationView.play()
    }
    
}
