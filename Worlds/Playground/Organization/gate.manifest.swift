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

// Taken inputs have local views; their source is the v2 input record.
public protocol Theirs {}
public enum DrawingProfileFile: Role {}
public enum DrawingSource: Role {}
extension DrawingSource {
    public static var typeName: String { "https://github.com/DanielSwift1992/verification-is-identification-showcase@29ee6ee257dbe3ba930c5c164ba47cb0a678a46c" }
}
public enum FontSource: Role {}
extension FontSource {
    public static var typeName: String { "https://github.com/DanielSwift1992/verification-is-identification-showcase@7bc13e157a29a6cab4b2a7cf43b6e913267e520a" }
}
public enum TheorySource: Role {}
extension TheorySource {
    public static var typeName: String { "https://github.com/DanielSwift1992/verification-is-identification@b61433abffaca19f5fd6bcdce00f27b47b49d40f" }
}
public enum TheDrawing: Theirs {
    public typealias Kind = DrawingProfileFile
    public typealias At = DrawingSource
}
extension TheDrawing {
    public static var typeName: String { ".gate/inputs/DrawingProfile.swift" }
}
public enum ThePalette: Theirs {
    public typealias Kind = CarriedFile
    public typealias At = DrawingSource
}
extension ThePalette {
    public static var typeName: String { ".gate/inputs/Palette.swift" }
}
public enum TheFont: Theirs {
    public typealias Kind = CarriedFile
    public typealias At = FontSource
}
extension TheFont {
    public static var typeName: String { ".gate/inputs/font.ttf" }
}
public enum TheMetrics: Theirs {
    public typealias Kind = CarriedFile
    public typealias At = FontSource
}
extension TheMetrics {
    public static var typeName: String { ".gate/inputs/metrics.swift" }
}
public enum TheLicense: Theirs {
    public typealias Kind = CarriedFile
    public typealias At = FontSource
}
extension TheLicense {
    public static var typeName: String { ".gate/inputs/license.txt" }
}
public enum ThePrimitive: Theirs {
    public typealias Kind = CarriedFile
    public typealias At = TheorySource
}
extension ThePrimitive {
    public static var typeName: String { ".gate/inputs/Primitive.swift" }
}
public enum TheSpectrum: Theirs {
    public typealias Kind = CarriedFile
    public typealias At = FontSource
}
extension TheSpectrum {
    public static var typeName: String { ".gate/inputs/Spectrum.swift" }
}
