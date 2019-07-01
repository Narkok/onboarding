import UIKit

class OnboardingPageCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionText: UITextView!
    
    @IBOutlet weak var titleCenterConstraint: NSLayoutConstraint!
    
    func setOffset(offset: CGFloat) {
        titleCenterConstraint.constant = offset
    }
    
}
