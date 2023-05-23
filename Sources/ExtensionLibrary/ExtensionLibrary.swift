import UIKit

public struct ExtensionLibrary {
    public private(set) var text = "Hello, World!"

    public init() {
    }
}



//
//extension Int{
//    public var toCGFloat: CGFloat{
//        CGFloat(self)
//    }
//
//    public var decimal: String?{
//        let formater = NumberFormatter()
//        formater.numberStyle = .decimal
//        formater.locale = Locale.current
//        return formater.string(from: NSNumber.init(value: self))
//    }
//
//    public var timeSecToStr: String{
//        let sec = (self) % 60
//        let min = (self) / 60
//
//        let secToString = "\(sec)".count == 1 ? "0\(sec)":"\(sec)"
//        let minToString = "\(min)".count == 1 ? "0\(min)":"\(min)"
//
//        return "\(minToString):\(secToString)"
//    }
//
//}
//extension String{
//
//    public var date: Date? {
//        let dateFormatter = DateFormatter()
//        dateFormatter.dateFormat = "yyyy-MM-dd"
//        if let date = dateFormatter.date(from: self){
//            return date
//        }else{
//            dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
//            return dateFormatter.date(from: self)
//        }
//    }
//
//    public var date_m_d_week: String {
//        let formatter = DateFormatter()
//        formatter.dateFormat = "M.d (E)"
//        if let _ = self.date{
//            return formatter.string(from: self.date!)
//        }
//        return ""
//    }
//
//    public var date_yyyy_m_dd: String {
//        let formatter = DateFormatter()
//        formatter.dateFormat = "yyyy.M.d"
//        if let _ = self.date{
//            return formatter.string(from: self.date!)
//        }
//        return ""
//    }
//
//    public var date_m_dd: String {
//        let formatter = DateFormatter()
//        formatter.dateFormat = "M.d"
//        if let _ = self.date{
//            return formatter.string(from: self.date!)
//        }
//        return ""
//    }
//
//    public var date_ymd: String {
//        let formatter = DateFormatter()
//        formatter.dateFormat = "yyyy년 M월 d일"
//        if let _ = self.date{
//            return formatter.string(from: self.date!)
//        }
//        return ""
//    }
//
//    public var time_hour_minute: String {
//        let formatter = DateFormatter()
//        formatter.dateFormat = "a h:mm"
//        if let _ = self.date{
//            return formatter.string(from: self.date!)
//        }
//        return ""
//    }
//
//    public var date_time_hour_minute: String {
//        let formatter = DateFormatter()
//        formatter.dateFormat = "M.d ah:mm"
//        if let _ = self.date{
//            return formatter.string(from: self.date!)
//        }
//        return ""
//    }
//
//    public var toDouble: Double?{
//        Double(self)
//    }
//
//    public func parse<T: Decodable>(type: T.Type) -> T? {
//        if let dic = self.toJsonDic {
//            let decoder  = JSONDecoder()
//            if let data = try? JSONSerialization.data(withJSONObject: dic , options: .prettyPrinted){
//                return try? decoder.decode(T.self, from: data)
//            }
//        }
//        return nil
//    }
//
//    public var toInt : Int {
//        if let intv = Int(self) {
//            return intv
//        }
//        return 0
//    }
//
//    public var asURL: URL?{
//        if let url = URL(string: self){
//            return url
//        }
//        return nil
//    }
//
//
//    public func getPartyBold(font: UIFont, color: [UIColor], signal:[Character] = ["<", ">"]) -> NSAttributedString {
//        var text = self
//
//        let firstIndex = text.enumerated().filter{$0.element == signal.first}.map{$0.offset}
//        let lastIndex = text.enumerated().filter{$0.element == signal.last}.map{$0.offset}
//
//        var ranges = [NSRange]()
//
//        if firstIndex.count == lastIndex.count{
//            for i in 0..<firstIndex.count{
//                let range = NSRange(location: firstIndex[i], length: lastIndex[i]-firstIndex[i])
//                ranges.append(range)
//            }
//        }
//
//        let attributedText = NSMutableAttributedString(string: text)
//
////
////        for range in ranges {
////            attributedText.addAttribute(.foregroundColor, value: color, range: range)
////            attributedText.addAttribute(.font, value: font, range: range)
////        }
//
//        var cl: UIColor = color.first ?? .black
//
//        for i in 0..<ranges.count{
//
//            if i < color.count{
//                cl = color[i]
//            }
//
//            attributedText.addAttribute(.foregroundColor, value: cl, range: ranges[i])
//            attributedText.addAttribute(.font, value: font, range: ranges[i])
//        }
//
//        for i in 0..<firstIndex.count{
//            attributedText.deleteCharacters(in: NSRange(location: firstIndex[i]-i, length: 1))
//        }
//        let removedLastIndex = attributedText.string.enumerated().filter{$0.element == signal.last}.map{$0.offset}
//        for i in 0..<removedLastIndex.count{
//            attributedText.deleteCharacters(in: NSRange(location: removedLastIndex[i]-i, length: 1))
//        }
//        return attributedText
//    }
//
//
//    public func getUnderlineColor(font: UIFont, color: [UIColor]) -> NSAttributedString {
//        var text = self
//
//        let firstIndex = text.enumerated().filter{$0.element == "<"}.map{$0.offset}
//        let lastIndex = text.enumerated().filter{$0.element == ">"}.map{$0.offset}
//
//        var ranges = [NSRange]()
//
//        if firstIndex.count == lastIndex.count{
//            for i in 0..<firstIndex.count{
//                let range = NSRange(location: firstIndex[i], length: lastIndex[i]-firstIndex[i])
//                ranges.append(range)
//            }
//        }
//
//        let attributedText = NSMutableAttributedString(string: text)
//        var cl: UIColor = color.first ?? .black
//        for i in 0..<ranges.count{
//            if i < color.count{
//                cl = color[i]
//            }
//            attributedText.addAttribute(.foregroundColor, value: cl, range: ranges[i])
//            attributedText.addAttribute(.font, value: font, range: ranges[i])
//            attributedText.addAttribute(.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: ranges[i])
//        }
//
//        for i in 0..<firstIndex.count{
//            attributedText.deleteCharacters(in: NSRange(location: firstIndex[i]-i, length: 1))
//        }
//        let removedLastIndex = attributedText.string.enumerated().filter{$0.element == ">"}.map{$0.offset}
//        for i in 0..<removedLastIndex.count{
//            attributedText.deleteCharacters(in: NSRange(location: removedLastIndex[i]-i, length: 1))
//        }
//        return attributedText
//    }
//
//    public func urlEncoded(denying deniedCharacters: CharacterSet) -> String? {
//        return addingPercentEncoding(withAllowedCharacters: deniedCharacters.inverted)
//    }
//
//
//}
//extension UIColor{
//    public func rgb() -> Int? {
//        var fRed: CGFloat = 0
//        var fGreen: CGFloat = 0
//        var fBlue: CGFloat = 0
//        var fAlpha: CGFloat = 0
//        if self.getRed(&fRed, green: &fGreen, blue: &fBlue, alpha: &fAlpha) {
//            let iRed = Int(fRed * 255.0)
//            let iGreen = Int(fGreen * 255.0)
//            let iBlue = Int(fBlue * 255.0)
//            let iAlpha = Int(fAlpha * 255.0)
//            //  (Bits 24-31 are alpha, 16-23 are red, 8-15 are green, 0-7 are blue).
//            let rgb = (iAlpha << 24) + (iRed << 16) + (iGreen << 8) + iBlue
//            return rgb
//        } else {
//            // Could not extract RGBA components:
//            return 4
//        }
//    }
//
//    public convenience init(hexString: String, alpha:CGFloat? = 1.0) {
//
//        func intFromHexString(hexStr: String) -> UInt32 {
//            var hexInt: UInt32 = 0
//            let scanner: Scanner = Scanner(string: hexStr)
//            scanner.charactersToBeSkipped = NSCharacterSet(charactersIn: "#") as CharacterSet
//            scanner.scanHexInt32(&hexInt)
//            return hexInt
//        }
//
//        // Convert hex string to an integer
//        let hexint = Int(intFromHexString(hexStr: hexString))
//        let red = CGFloat((hexint & 0xff0000) >> 16) / 255.0
//        let green = CGFloat((hexint & 0xff00) >> 8) / 255.0
//        let blue = CGFloat((hexint & 0xff) >> 0) / 255.0
//        let alpha = alpha!
//
//        self.init(red: red, green: green, blue: blue, alpha: alpha)
//    }
//
//    public func lighter(amount : CGFloat = 0.25) -> UIColor {
//        return hueColorWithBrightnessAmount(amount: 1 + amount)
//    }
//
//    public func darker(amount : CGFloat = 0.25) -> UIColor {
//        return hueColorWithBrightnessAmount(amount: 1 - amount)
//    }
//
//    private func hueColorWithBrightnessAmount(amount: CGFloat) -> UIColor {
//        var hue         : CGFloat = 0
//        var saturation  : CGFloat = 0
//        var brightness  : CGFloat = 0
//        var alpha       : CGFloat = 0
//
//
//        if getHue(&hue, saturation: &saturation, brightness: &brightness, alpha: &alpha) {
//            return UIColor( hue: hue,
//                            saturation: saturation,
//                            brightness: brightness * amount,
//                            alpha: alpha )
//        } else {
//            return self
//        }
//    }
//
//}
//extension UIDeviceOrientation{
//    public var interfaceOrient: UIInterfaceOrientation{
//        switch self {
//        case .unknown:
//            return .unknown
//        case .portrait:
//            return .portrait
//        case .portraitUpsideDown:
//            return .portraitUpsideDown
//        case .landscapeLeft:
//            return .landscapeLeft
//        case .landscapeRight:
//            return .landscapeRight
//        case .faceUp:
//            return .unknown
//        case .faceDown:
//            return .unknown
//        @unknown default:
//            return .unknown
//        }
//    }
//}
//extension UIInterfaceOrientation{
//    public var mask: UIInterfaceOrientationMask{
//        switch self {
//        case .unknown:
//            return .all
//        case .portrait:
//            return .portrait
//        case .portraitUpsideDown:
//            return .portraitUpsideDown
//        case .landscapeLeft:
//            return .landscapeLeft
//        case .landscapeRight:
//            return .landscapeRight
//        }
//    }
//
//    public var deviceOrient: UIDeviceOrientation{
//        switch self {
//        case .unknown:
//            return .unknown
//        case .portrait:
//            return .portrait
//        case .portraitUpsideDown:
//            return .portraitUpsideDown
//        case .landscapeLeft:
//            return .landscapeLeft
//        case .landscapeRight:
//            return .landscapeRight
//        }
//    }
//}
//
//
//extension UIView {
//    public var endPosY: CGFloat {
//        get{
//            return self.frame.size.height + self.frame.origin.y
//        }
//    }
//    public  var endPosX: CGFloat {
//        get{
//            return self.frame.size.width + self.frame.origin.x
//        }
//    }
//
//    public func addRound(cornerRadius: CGFloat,borderColor: UIColor ,borderWidth: CGFloat = 1) {
//        self.layer.cornerRadius = cornerRadius
//        self.layer.borderWidth = borderWidth
//        self.layer.borderColor = borderColor.cgColor
//        self.clipsToBounds = true
//    }
//
//    public func addRoundSpecificedCorners(cornerRadius: CGFloat, byRoundingCorners: UIRectCorner, boderColor: UIColor = .clear, boderWidth: CGFloat = 1.5) {
//        clipsToBounds = true
//        if #available(iOS 11.0, *) {
//
//            layer.cornerRadius = cornerRadius
//            layer.borderColor = boderColor.cgColor
//            layer.borderWidth = boderWidth
//            layer.maskedCorners = CACornerMask(rawValue: byRoundingCorners.rawValue)
//        } else {
//            let path = UIBezierPath(roundedRect: self.bounds,
//                                    byRoundingCorners: byRoundingCorners,
//                                    cornerRadii: CGSize(width:cornerRadius, height: cornerRadius))
//
//            let maskLayer = CAShapeLayer()
//            maskLayer.borderColor = boderColor.cgColor
//            //                maskLayer.boderWidth = boderWidth
//            maskLayer.borderWidth = boderWidth
//            maskLayer.frame = self.bounds
//            maskLayer.path = path.cgPath
//
//            layer.mask = maskLayer
//        }
//
//    }
//
//    public func makeBottomShadow(shadowHeight: CGFloat = 5) {
//        let shadowPath = UIBezierPath()
//        shadowPath.move(to: CGPoint(x: 0, y: self.bounds.height))
//        shadowPath.addLine(to: CGPoint(x: self.bounds.width, y: self.bounds.height))
//        shadowPath.addLine(to: CGPoint(x: self.bounds.width, y: self.bounds.height + shadowHeight))
//        shadowPath.addLine(to: CGPoint(x: 0, y: self.bounds.height + shadowHeight))
//        shadowPath.close()
//
//        self.layer.shadowColor = UIColor.darkGray.cgColor
//        self.layer.shadowOpacity = 0.5
//        self.layer.masksToBounds = false
//        self.layer.shadowPath = shadowPath.cgPath
//        self.layer.shadowRadius = 2
//    }
//
//    @available(iOS 10.0, *)
//    public func asImage() -> UIImage {
//        let renderer = UIGraphicsImageRenderer(bounds: bounds)
//        return renderer.image { rendererContext in
//            layer.render(in: rendererContext.cgContext)
//        }
//    }
//}
