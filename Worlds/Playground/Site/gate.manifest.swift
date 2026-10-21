// This world names its court. The manifest is not a Swift target source.
// FormsFile reads declarations with where and any declared PredicateReading with count.
// WorldFile is reserved for the company fragment (T-0023 rule 1b).
public protocol Role {}
public enum FormsFile: Role {}
public enum DocumentFile: Role {}
public protocol Mine {}

// Site/Manifest.swift is a shared pinned input in THEIRS, not a reader draft.
public enum ThePalette: Mine {
    public typealias Kind = DocumentFile
}
extension ThePalette {
    public static var typeName: String { "Palette.swift" }
}

// Taken inputs have local views; their source is the v2 input record.
public protocol Theirs {}
public enum DrawingProfileFile: Role {}
public enum CarriedFile: Role {}
public enum DrawingSource: Role {}
extension DrawingSource {
    public static var typeName: String { "https://github.com/DanielSwift1992/verification-is-identification-showcase@ecca861cf8696cc246b93d436ede2f56b76b1b4e" }
}
public enum FontSource: Role {}
extension FontSource {
    public static var typeName: String { "https://github.com/DanielSwift1992/verification-is-identification-showcase@ecca861cf8696cc246b93d436ede2f56b76b1b4e" }
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
    public static var typeName: String { "DrawingProfile.swift" }
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
    public static var typeName: String { "DrawingBindings.swift" }
}

public enum TheContract: Theirs {
    public typealias Kind = CarriedFile
    public typealias At = DrawingSource
}
extension TheContract {
    public static var typeName: String { ".gate/inputs/DrawingContract.json" }
}

// The catalog is a pinned input, not an editable second table of doors.
public enum CatalogSource: Role {}
extension CatalogSource {
    public static var typeName: String { "https://github.com/DanielSwift1992/verification-is-identification-showcase@ecca861cf8696cc246b93d436ede2f56b76b1b4e" }
}
public enum TheCatalog: Theirs {
    public typealias Kind = CarriedFile
    public typealias At = CatalogSource
}
extension TheCatalog {
    public static var typeName: String { "Manifest.swift" }
}
