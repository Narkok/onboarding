import UIKit

class Onboarding: UIViewController {

    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var onboardingPages: UICollectionView!
    @IBOutlet weak var skipButton: UIButton!
    @IBOutlet weak var pageIndicator: PageIndicator!
    
    let titles = ["Web development", "Design", "Complementary services"]
    let descriptoins = [
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam eget eros sed felis mollis iaculis.",
        "Vivamus dignissim posuere consectetur. Morbi diam mauris, semper sit.",
        "Etiam eget tempus orci. Mauris et diam id velit feugiat venenatis in ut diam."
    ]
    var pages: [OnboardingPageCell] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nextButton.layer.shadowColor = nextButton.backgroundColor?.cgColor
        nextButton.layer.shadowRadius = 8
        nextButton.layer.shadowOpacity = 0.2
        nextButton.layer.shadowOffset = CGSize(width: 0, height: 0)
    }

    
    @IBAction func skipButton(_ sender: Any) {
    }
    
    @IBAction func nextButton(_ sender: Any) {
    }
    
}


extension Onboarding: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "OnboardingPageCell", for: indexPath) as! OnboardingPageCell
        cell.imageView.image      = UIImage(named: "onboarding_\(indexPath.row)")
        cell.titleLabel.text      = titles[indexPath.row]
        cell.descriptionText.text = descriptoins[indexPath.row]
        return cell
    }
}

extension Onboarding: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return onboardingPages.bounds.size
    }
}

extension Onboarding: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        for indexPath in onboardingPages.indexPathsForVisibleItems {
            let cell = onboardingPages.cellForItem(at: indexPath) as! OnboardingPageCell
            cell.setOffset(offset: (CGFloat(indexPath.row) * onboardingPages.bounds.width - scrollView.contentOffset.x) / 8)
        }
        
        pageIndicator.setScroll(width: scrollView.bounds.width, offset: scrollView.contentOffset.x)
    }
}
