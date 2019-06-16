import UIKit

@IBDesignable
class PageIndicator__: UIView {

    @IBInspectable var _color: UIColor = UIColor.red
    @IBInspectable var _color2: UIColor = UIColor.red
    
    var indicators: [UIView] = []
    var indicatorWidths: [NSLayoutConstraint] = []
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
//        var widthConstraint: NSLayoutConstraint
        
        for _ in 0..<3 {
            let indicator = UIView()
            indicator.backgroundColor = _color2
            indicator.layer.cornerRadius = 2.5
            
            indicator.translatesAutoresizingMaskIntoConstraints = false
            indicator.widthAnchor.constraint(equalToConstant: 5).isActive = true
            indicator.heightAnchor.constraint(equalToConstant: 5).isActive = true
            
            indicatorWidths.append(indicator.constraints[0])
            indicators.append(indicator)
            addSubview(indicator)
        }
        
        indicators[0].leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        indicators[0].centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        
        indicators[1].leadingAnchor.constraint(equalTo: indicators[0].trailingAnchor, constant: 4).isActive = true
        indicators[1].centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        
        indicators[2].leadingAnchor.constraint(equalTo: indicators[1].trailingAnchor, constant: 4).isActive = true
        indicators[2].centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        
        indicatorWidths[1].constant = 27
        indicators[1].backgroundColor = _color
        
    }
    

}
