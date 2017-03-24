/// Layout constraint to calculate size based on multiplier.
class PercentLayoutConstraint: NSLayoutConstraint {
    
    @IBInspectable var marginPercent: CGFloat = 0
    
    var screenSize: (width: CGFloat, height: CGFloat) {
        return (UIScreen.mainScreen().bounds.width, UIScreen.mainScreen().bounds.height)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        guard marginPercent > 0 else { return }
        NSNotificationCenter.defaultCenter().addObserver(self,
                                                         selector: #selector(layoutDidChange),
                                                         name: UIDeviceOrientationDidChangeNotification,
                                                         object: nil)
    }
    
    /**
     Re-calculate constant based on orientation and percentage.
     */
    func layoutDidChange() {
        guard marginPercent > 0 else { return }
        
        switch firstAttribute {
        case .Top, .TopMargin, .Bottom, .BottomMargin:
            constant = screenSize.height * marginPercent
        case .Leading, .LeadingMargin, .Trailing, .TrailingMargin:
            constant = screenSize.width * marginPercent
        default: break
        }
    }
    
    deinit {
        guard marginPercent > 0 else { return }
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }
}
