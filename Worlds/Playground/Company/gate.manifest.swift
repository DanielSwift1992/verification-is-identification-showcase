// This world names its court. The manifest is not a Swift target source.
// FormsFile reads declarations with where and any declared PredicateReading with count.
// WorldFile is reserved for the company fragment (T-0023 rule 1b).
public protocol Role {}
public enum WorldFile: Role {}
public protocol Mine {}

public enum TheCompany: Mine {
    public typealias Kind = WorldFile
}
extension TheCompany { public static var typeName: String { "Company.swift" } }
