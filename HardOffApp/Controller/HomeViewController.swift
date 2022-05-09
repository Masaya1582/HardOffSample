

import UIKit
import Lottie

class HomeViewController: UIViewController {
    
    @IBOutlet weak var statusButton: UIButton!
    @IBOutlet weak var carImgeView: UIImageView!
    @IBOutlet weak var shopbutton: UIButton!
    @IBOutlet weak var codeImageView: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var lottieView: LottieView!
    
    private var shopArray = ["四日市店", "桑名店","朝日店","日永店","津店"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupTV()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        showAnimation()
    }
    
    private func setupView(){
        shopbutton.layer.cornerRadius = 10.0
        statusButton.layer.cornerRadius = 10.0
        carImgeView.image = UIImage(named: "car.png")
        codeImageView.image = UIImage(named: "barcode.jpeg")
    }
    
    private func setupTV() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "HomeTableViewCell", bundle: nil), forCellReuseIdentifier: "shopCell")
    }
    
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

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shopArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "shopCell", for: indexPath) as! HomeTableViewCell
        cell.hardoffImageView.image = UIImage(named: "hardoff.png")
        cell.shopLabel.text = shopArray[indexPath.row]
        return cell
    }
    
}

