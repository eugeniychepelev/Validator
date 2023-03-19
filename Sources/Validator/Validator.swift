import Foundation

open class Validator {
    
    public var type: ValidationTypeProtocol?
    public var validatorError: ValidatorError
    
    public init(validationType: ValidationTypeProtocol?, validatorError: ValidatorError) {
        self.type = validationType
        self.validatorError = validatorError
    }
    
    private func validateRange(_ text: String, type: ValidationTypeProtocol) throws {
        guard type.range.contains(text.count) else {
            throw validatorError.notValidLength(value: type.lengthMessageError)
        }
    }
    
    private func matches(_ text: String, type: ValidationTypeProtocol) throws {
        if !type.matches(text) {
            throw validatorError.notValidPattern(value: type.patternMessageError)
        }
    }
    
    private func validateIsRequired(_ text: String, type: ValidationTypeProtocol) throws {
        if text.isEmpty {
            throw validatorError.valueRequered(value: type.typeName)
        }
    }
    
    private func validateIsContainSpaceOnly(_ text: String) throws {
        if text.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
            throw BaseValidatorError.containSpaceOnly
        }
    }
    
    public func validate(_ text: String, using rules: ValidationRules) -> Result<Void, Error> {
        guard let type = type else { return .success(()) }
        
        do {
            if rules.contains(.required) { try validateIsRequired(text, type: type) }
            if rules.contains(.spaceOnly) { try validateIsContainSpaceOnly(text) }
            if rules.contains(.range) { try validateRange(text, type: type) }
            if rules.contains(.regex) { try matches(text, type: type) }
            return .success(())
        } catch {
            return .failure(error)
        }
    }
    
    public func validate(_ text: String,
                  using rules: ValidationRules,
                  then validator: (String) -> Result<Void, Error>) -> Result<Void, Error> {
        validate(text, using: rules).flatMap { validator(text) }
    }
}

