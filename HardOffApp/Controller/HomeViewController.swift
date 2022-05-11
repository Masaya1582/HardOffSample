

import UIKit
import Lottie

class HomeViewController: UIViewController {
    
    @IBOutlet weak var statusButton: UIButton!
    @IBOutlet weak var carImgeView: UIImageView!
    @IBOutlet weak var shopbutton: UIButton!
    @IBOutlet weak var codeImageView: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var lottieView: LottieView!
    
    //cellのID
    private var cellIdentifier = "shopCell"
    //ボタン等の角を丸くする
    private let cornerRadius: CGFloat = 10.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupTV()
    }
    
    //アニメーションの再生を開始する
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        showAnimation()
    }
    
    //UIの初期設定
    private func setupView(){
        shopbutton.layer.cornerRadius = cornerRadius
        statusButton.layer.cornerRadius = cornerRadius
        carImgeView.image = ConstUIImage.car
        codeImageView.image = ConstUIImage.barcode
    }
    
    //tableViewの初期設定
    private func setupTV() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "HomeTableViewCell", bundle: nil), forCellReuseIdentifier: cellIdentifier)
    }
    
    //lottieファイルの設定
    private func showAnimation() {
        let animationView = AnimationView(name: "pc")
        animationView.frame = lottieView.bounds
        animationView.center = self.lottieView.center
        animationView.loopMode = .loop
        animationView.animationSpeed = 1
        view.addSubview(animationView)
        animationView.play()
    }
    
}

//tableViewの表示設定
extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ShopData.shopArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! HomeTableViewCell
        cell.hardoffImageView.image = ConstUIImage.hardoff
        cell.shopLabel.text = ShopData.shopArray[indexPath.row]
        return cell
    }
    
}

