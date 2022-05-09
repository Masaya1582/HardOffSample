

import UIKit

class MyPageViewController: UIViewController {
    
    @IBOutlet weak var firstView: UIView!
    @IBOutlet weak var secondView: UIView!
    @IBOutlet weak var thirdView: UIView!
    @IBOutlet weak var forthView: UIView!
    @IBOutlet weak var fifthView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    
    private let mollArray = ["注文履歴", "送料計算リスト"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupTV()
    }
    
    private func setupView() {
        firstView.layer.cornerRadius = 20.0
        secondView.layer.cornerRadius = 20.0
        thirdView.layer.cornerRadius = 20.0
        forthView.layer.cornerRadius = 20.0
        fifthView.layer.cornerRadius = 20.0
        imageView.image = UIImage(named: "kaitori.jpeg")
    }
    
    private func setupTV() {
        tableView.delegate = self
        tableView.dataSource = self
    }

}

//tableViewの表示設定
extension MyPageViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mollArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.selectionStyle = UITableViewCell.SelectionStyle.none
        cell.textLabel?.text = mollArray[indexPath.row]
        cell.textLabel?.textColor = .black
        return cell
    }

}

