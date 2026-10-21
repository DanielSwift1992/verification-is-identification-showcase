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
    public typealias At = ResolvedDrawingSource
}
extension TheDrawing {
    public static var typeName: String { ".gate/inputs/resolved-profile.json" }
}
public enum TheProfileSource: Theirs {
    public typealias Kind = CarriedFile
    public typealias At = DrawingSource
}
extension TheProfileSource {
    public static var typeName: String { ".gate/inputs/DrawingProfile.swift" }
}
public enum TheDrawingCSS: Theirs {
    public typealias Kind = CarriedFile
    public typealias At = ResolvedDrawingSource
}
extension TheDrawingCSS {
    public static var typeName: String { ".gate/inputs/drawing.css" }
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

public enum DrawingContractSource: Role {}
extension DrawingContractSource {
    public static var typeName: String { "https://github.com/DanielSwift1992/verification-is-identification-showcase@1cb65d4113011131fa1afcdf54ea2ee94deecda4" }
}
public enum TheContract: Theirs {
    public typealias Kind = CarriedFile
    public typealias At = DrawingContractSource
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
    public static var typeName: String { ".gate/inputs/Catalog.swift" }
}

public enum ResolvedDrawingSource: Role {}
extension ResolvedDrawingSource {
    public static var typeName: String { "https://github.com/DanielSwift1992/verification-is-identification-showcase@1ee05563938902c6d27d6390fe322dcd48f32327" }
}
