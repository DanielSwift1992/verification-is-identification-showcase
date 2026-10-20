// This world names its court. The manifest is not a Swift target source.
// FormsFile reads declarations with where and any declared PredicateReading with count.
// WorldFile is reserved for the company fragment (T-0023 rule 1b).
public protocol Role {}
public enum FormsFile: Role {}
public protocol Mine {}

public enum TheAtom: Mine {
    public typealias Kind = FormsFile
}
extension TheAtom { public static var typeName: String { "Atom.swift" } }

// The unchanged page snapshot is carried, not sent to the plain or where court.
// Its body is compiled with its declarations by this package, not by a gate role.
public enum CarriedFile: Role {}
public protocol Theirs {}
public enum Playground400b667 {}
extension Playground400b667 { public static var typeName: String { "typed-playground@400b6674d1c120bb2b86150631093f86ec4d7994" } }
public enum ThePages: Theirs {
    public typealias Kind = CarriedFile
    public typealias At = Playground400b667
}
extension ThePages { public static var typeName: String { "AtomPages.swift" } }
