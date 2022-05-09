

import UIKit

class TravelTableViewCell: UITableViewCell {
    
    @IBOutlet weak var prefecLabel: UILabel!
    @IBOutlet weak var numberLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        
    }
    @IBAction func plusAction(_ sender: Any) {
    }
    
}
