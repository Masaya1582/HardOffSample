

import UIKit

enum CellTag: Int {
    case mollCell
    case aboutCell
}

class MyPageViewController: UIViewController {
    
    @IBOutlet private weak var firstView: UIView!
    @IBOutlet private weak var secondView: UIView!
    @IBOutlet private weak var thirdView: UIView!
    @IBOutlet private weak var forthView: UIView!
    @IBOutlet private weak var fifthView: UIView!
    @IBOutlet private weak var sixthView: UIView!
    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var firstTableView: UITableView!
    @IBOutlet private weak var secondTableView: UITableView!
    @IBOutlet weak var logout: UIButton!
    
    private var firstArray: NSMutableArray = ["注文履歴", "送料計算リスト"]
    private var aboutArray: NSMutableArray = ["初めての方へ","エコボとは","よくある質問","お問合せ","ご意見フォーム","ランクについて","ハードオフアプリ利用規約", "オフモール利用規約", "プライバシーポリシー"]
    private var tableViewItems: [NSMutableArray] = []
    
    // 処理分岐用
    private var tag = 0
    private var cellIdentifier = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupTV()
    }
    
    private func setupView() {
        let borderRadius: CGFloat = 20.0
        firstView.layer.cornerRadius = borderRadius
        secondView.layer.cornerRadius = borderRadius
        thirdView.layer.cornerRadius = borderRadius
        forthView.layer.cornerRadius = borderRadius
        fifthView.layer.cornerRadius = borderRadius
        sixthView.layer.cornerRadius = borderRadius
        logout.layer.cornerRadius = borderRadius
        imageView.image = ConstUIImage.kaitori
    }
    
    private func setupTV() {
        firstTableView.delegate = self
        firstTableView.dataSource = self
        secondTableView.delegate = self
        secondTableView.dataSource = self
        firstTableView.isScrollEnabled = false
        secondTableView.isScrollEnabled = false
        tableViewItems.append(firstArray)
        tableViewItems.append(aboutArray)
    }
    
}

//tableViewの表示設定
extension MyPageViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableViewItems[tableView.tag].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = tableView.tag == CellTag.mollCell.rawValue ? "mollCell" : "aboutCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        cell.selectionStyle = .none
        cell.textLabel?.text = tableViewItems[tableView.tag][indexPath.row] as? String
        cell.textLabel?.textColor = .black
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
}

