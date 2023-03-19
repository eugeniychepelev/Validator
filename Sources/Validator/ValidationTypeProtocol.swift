import Foundation

public protocol ValidationTypeProtocol {
    
    var typeName: String { get }
    
    var regexExpression: String { get }
    
    var patternMessageError: String { get }
    
    var range: ClosedRange<Int> { get }
    
    var lengthMessageError: String { get }
    
    func matches(_ text: String) -> Bool
}

extension ValidationTypeProtocol {
    
    public func matches(_ text: String) -> Bool {
        guard let regex = try? NSRegularExpression(pattern: regexExpression, options: []) else { return false }
        let matches = regex.matches(in: text,
                                    options: [],
                                    range: NSRange(location: 0, length: text.count))
        var length = 0
        matches.forEach { res in
            length += res.range.length
        }
        
        return length == text.count ? true : false
    }
}
