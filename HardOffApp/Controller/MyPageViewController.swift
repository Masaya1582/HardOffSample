

import UIKit

class MyPageViewController: UIViewController {
    
    @IBOutlet weak var firstView: UIView!
    @IBOutlet weak var secondView: UIView!
    @IBOutlet weak var thirdView: UIView!
    @IBOutlet weak var forthView: UIView!
    @IBOutlet weak var fifthView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var tableView1: UITableView!
    @IBOutlet weak var tableView2: UITableView!
    
    private var items1: NSMutableArray = ["注文履歴", "送料計算リスト"]
    private var items2: NSMutableArray = ["テスト","テスト","テスト","テスト","テスト","テスト",]
    private var items: [NSMutableArray] = []
    
    // 処理分岐用
    private var tag = 0
    private var cellIdentifier = ""
    
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
        tableView1.delegate = self
        tableView1.dataSource = self
        tableView2.delegate = self
        tableView2.dataSource = self
        items.append(items1)
        items.append(items2)
    }
    
    // 処理を分岐するメソッド
    private func checkTableView(_ tableView: UITableView) -> Void{
        if tableView.tag == 1 {
            tag = 1
            cellIdentifier = "mollCell"
        }
        else if tableView.tag == 2 {
            tag = 2
            cellIdentifier = "aboutCell"
        }
    }
    
}

//tableViewの表示設定
extension MyPageViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        checkTableView(tableView)
        return items[tag].count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        checkTableView(tableView)
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        cell.selectionStyle = UITableViewCell.SelectionStyle.none
        cell.textLabel?.text = items[tag][indexPath.row] as? String
        cell.textLabel?.textColor = .black
        return cell
    }
    
}

