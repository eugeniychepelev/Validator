import Foundation

public enum BaseValidatorError: Error {
    case `required`(String)
    case notValidPattern(String)
    case passwordNotEqual(String)
    case equal(String)
    case alreadyExist(String)
    case notRegister(String)
    case notValidLength(String)
    case containSpaceOnly
    case defaultError(String)
    case dateError(String)
    
    var errorDescription: String {
        switch self {
        case .required(let value):
            return "\(value) is required"
        case .notValidPattern(let value):
            return "\(value) is not valid format"
        case .alreadyExist(let value):
            return "\(value) is already exist"
        case .notRegister(let value):
            return "\(value) is not register"
        case .notValidLength(let value):
            return value
        case .containSpaceOnly:
            return "Can’t contain spaces only"
        case .defaultError(let error):
            return error
        case .dateError(let error):
            return error
        case .passwordNotEqual(let type):
            return "Does not match \(type)"
        case .equal(let type):
            return "New and current \(type) is equal"
        }
    }
    
    public init(_ rawValue: String) {
        self = .defaultError(rawValue)
    }
}
