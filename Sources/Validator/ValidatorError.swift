import Foundation

public protocol ValidatorError: Error {
    
    func valueRequered(value: String) -> Error
    
    func notValidPattern(value: String) -> Error
    
    func passwordNotEqual(value: String) -> Error
    
    func equal(value: String) -> Error
    
    func alreadyExist(value: String) -> Error
    
    func notRegister(value: String) -> Error
    
    func notValidLength(value: String) -> Error
    
    func containSpaceOnly() -> Error
    
    func defaultError(value: String) -> Error
    
    func dateError(value: String) -> Error
}

extension ValidatorError {
    
    public func valueRequered(value: String) -> Error {
        BaseValidatorError.required(value)
    }
    
    public func notValidPattern(value: String) -> Error {
        BaseValidatorError.notValidPattern(value)
    }
    
    public func passwordNotEqual(value: String) -> Error {
        BaseValidatorError.passwordNotEqual(value)
    }
    
    public func equal(value: String) -> Error {
        BaseValidatorError.equal(value)
    }
    
    public func alreadyExist(value: String) -> Error {
        BaseValidatorError.alreadyExist(value)
    }
    
    public func notRegister(value: String) -> Error {
        BaseValidatorError.notRegister(value)
    }
    
    public func notValidLength(value: String) -> Error {
        BaseValidatorError.notValidLength(value)
    }
    
    public func containSpaceOnly() -> Error {
        BaseValidatorError.containSpaceOnly
    }
    
    public func defaultError(value: String) -> Error {
        BaseValidatorError.defaultError(value)
    }
    
    public func dateError(value: String) -> Error {
        BaseValidatorError.dateError(value)
    }
}
