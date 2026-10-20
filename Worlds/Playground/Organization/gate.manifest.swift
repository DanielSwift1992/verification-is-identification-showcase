// This world names its court. The manifest is not a Swift target source.
// FormsFile reads declarations with where and any declared PredicateReading with count.
// WorldFile is reserved for the company fragment (T-0023 rule 1b).
public protocol Role {}
public enum WorldFile: Role {}
public protocol Mine {}

public enum TheOrganization: Mine {
    public typealias Kind = WorldFile
}
extension TheOrganization {
    public static var typeName: String { "Organization.swift" }
}

// Geometry is compiled with the company page; it states no company premises.
public enum CarriedFile: Role {}
public enum TheGeometry: Mine {
    public typealias Kind = CarriedFile
}
extension TheGeometry {
    public static var typeName: String { "Dictionary/Design.swift" }
}

// The drawing profile is an input shared with the other worlds.
public protocol Theirs {}
public enum DrawingProfileFile: Role {}
public enum TheDrawing: Theirs {
    public typealias Kind = DrawingProfileFile
}
extension TheDrawing {
    public static var typeName: String { "../Site/DrawingProfile.swift" }
}
