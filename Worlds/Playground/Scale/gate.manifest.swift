// This world names its court. The manifest is not a Swift target source.
// FormsFile reads declarations with where and any declared PredicateReading with count.
// WorldFile is reserved for the company fragment (T-0023 rule 1b).
public protocol Role {}
public enum WorldFile: Role {}
public protocol Mine {}

public enum TheCompany: Mine {
    public typealias Kind = WorldFile
}
extension TheCompany {
    public static var typeName: String { "Company.swift" }
}

// Taken inputs have local views; their source is the v2 input record.
public protocol Theirs {}
public enum DrawingProfileFile: Role {}
public enum CarriedFile: Role {}
public enum DrawingSource: Role {}
extension DrawingSource {
    public static var typeName: String { "https://github.com/DanielSwift1992/verification-is-identification-showcase@4ab5dcda82710756cc6b596979f55fe9768c6a3d" }
}
public enum FontSource: Role {}
extension FontSource {
    public static var typeName: String { "https://github.com/DanielSwift1992/verification-is-identification-showcase@4ab5dcda82710756cc6b596979f55fe9768c6a3d" }
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

public enum TheBindings: Theirs {
    public typealias Kind = CarriedFile
    public typealias At = DrawingSource
}
extension TheBindings {
    public static var typeName: String { ".gate/inputs/DrawingBindings.swift" }
}

public enum TheContract: Theirs {
    public typealias Kind = CarriedFile
    public typealias At = DrawingSource
}
extension TheContract {
    public static var typeName: String { ".gate/inputs/DrawingContract.json" }
}

// The owner supplies the page and geometry; neither states company premises.
public enum ThePages: Mine {
    public typealias Kind = CarriedFile
}
extension ThePages {
    public static var typeName: String { "ScalePages.swift" }
}
public enum TheGeometry: Mine {
    public typealias Kind = CarriedFile
}
extension TheGeometry {
    public static var typeName: String { "Dictionary/Design.swift" }
}
