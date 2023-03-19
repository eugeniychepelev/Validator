import Foundation

extension Validator {
    open class ValidationRules: OptionSet {
        public let rawValue: Int
        
        required public init(rawValue: Int) {
            self.rawValue = rawValue
        }
        
        public static let required = ValidationRules(rawValue: 1 << 0)
        public static let regex = ValidationRules(rawValue: 1 << 1)
        public static let range = ValidationRules(rawValue: 1 << 2)
        public static let spaceOnly = ValidationRules(rawValue: 1 << 3)
        
        public static let emailRules: ValidationRules = [.required]
        public static let passwordRules: ValidationRules = [.spaceOnly, .required, .range, .regex]
        public static let phoneRules: ValidationRules = [.spaceOnly]
        public static let mainRules: ValidationRules = [.required, .regex, .range, .spaceOnly]
    }
}
