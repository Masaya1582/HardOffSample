

import UIKit
import Lottie

class TravelViewController: UIViewController {
    
    @IBOutlet weak var lottieView: LottieView!
    @IBOutlet weak var tableView: UITableView!
    
    private var prefecArray = ["北海道","北海道","北海道","北海道","北海道","北海道","北海道","北海道","北海道"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTV()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        showAnimation()
    }
    
    //tableViewの初期設定
    private func setupTV() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "TravelTableViewCell", bundle: nil), forCellReuseIdentifier: "travelCell")
    }
    
    //lottieファイルの設定
    private func showAnimation() {
        let animationView = AnimationView(name: "car")
        animationView.frame = lottieView.bounds
        animationView.center = self.lottieView.center
        animationView.loopMode = .loop
        animationView.animationSpeed = 1
        view.addSubview(animationView)
        animationView.play()
    }

}

//tableViewの表示設定
extension TravelViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return prefecArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "travelCell", for: indexPath) as! TravelTableViewCell
        cell.prefecLabel.text = prefecArray[indexPath.row]
        cell.numberLabel.text = "000/066"
        return cell
    }
    
}

