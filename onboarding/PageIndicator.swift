import UIKit

@IBDesignable
class PageIndicator: UIView {

    @IBInspectable var _tintColor: UIColor = UIColor.red
    @IBInspectable var _currentPage: UIColor = UIColor.red
    
    var indicators: [UIView] = []
    var indicatorWidths: [NSLayoutConstraint] = []
    
    let indicatorRadius: CGFloat = 5
    let indicatorOffset: CGFloat = 4
    var indicatorMaxLen = CGFloat()
    
    var tintClr: [CGFloat] = []
    var currClr: [CGFloat] = []
    
    override func draw(_ rect: CGRect) {
        tintClr = _tintColor.cgColor.components!
        currClr = _currentPage.cgColor.components!
        indicatorMaxLen = frame.width - 2 * (indicatorRadius + indicatorOffset)
        
        for _ in 0..<3 {
            let indicator = UIView()
            indicator.backgroundColor = _tintColor
            indicator.layer.cornerRadius = indicatorRadius/2
            
            indicator.translatesAutoresizingMaskIntoConstraints = false
            indicator.widthAnchor.constraint(equalToConstant: indicatorRadius).isActive = true
            indicator.heightAnchor.constraint(equalToConstant: indicatorRadius).isActive = true
            
            indicatorWidths.append(indicator.constraints[0])
            indicators.append(indicator)
            addSubview(indicator)
        }
        
        indicators[0].leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        indicators[0].centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        
        indicators[1].leadingAnchor.constraint(equalTo: indicators[0].trailingAnchor, constant: indicatorOffset).isActive = true
        indicators[1].centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        
        indicators[2].leadingAnchor.constraint(equalTo: indicators[1].trailingAnchor, constant: indicatorOffset).isActive = true
        indicators[2].centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        
        setScroll(width: frame.width, offset: 0)
    }
    
//    override func layoutSubviews() {
//        super.layoutSubviews()
//
//        print("lol")
//
//    }
    
    func setScroll(width: CGFloat, offset: CGFloat) {
        if (offset < 0) || (offset >= 2 * width) { return }
        
        let pageNum = Int(offset / width)
        let rel = (offset - width * CGFloat(Int(offset / width))) / width
        let width1 = indicatorRadius + (indicatorMaxLen - indicatorRadius) * (1 - rel)
        let width2 = indicatorRadius + (indicatorMaxLen - indicatorRadius) * rel

        let color1 = UIColor(red: tintClr[0] + (currClr[0] - tintClr[0]) * (1 - rel),
                             green: tintClr[1] + (currClr[1] - tintClr[1]) * (1 - rel),
                             blue: tintClr[2] + (currClr[2] - tintClr[2]) * (1 - rel),
                             alpha: 1)
        
        let color2 = UIColor(red: tintClr[0] + (currClr[0] - tintClr[0]) * rel,
                             green: tintClr[1] + (currClr[1] - tintClr[1]) * rel,
                             blue: tintClr[2] + (currClr[2] - tintClr[2]) * rel,
                             alpha: 1)
        
        indicators[pageNum].backgroundColor = color1
        indicatorWidths[pageNum].constant = width1
        
        indicators[pageNum+1].backgroundColor = color2
        indicatorWidths[pageNum+1].constant = width2
        
    }
    

}
