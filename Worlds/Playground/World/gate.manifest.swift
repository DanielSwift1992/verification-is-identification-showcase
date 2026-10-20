// This world names its court. The manifest is not a Swift target source.
// FormsFile reads declarations with where and any declared PredicateReading with count.
// WorldFile is reserved for the company fragment (T-0023 rule 1b).
public protocol Role {}
public enum FormsFile: Role {}
public protocol Mine {}

public enum TheWorld: Mine {
    public typealias Kind = FormsFile
}
extension TheWorld { public static var typeName: String { "World.swift" } }
