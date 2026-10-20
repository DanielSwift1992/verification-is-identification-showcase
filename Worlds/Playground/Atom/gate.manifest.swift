// Declarations are read by where/count; page bodies are compiled by SwiftPM.
// CarriedFile accounts for our page source without sending it to the company court.
public protocol Role {}
public enum FormsFile: Role {}
public enum CarriedFile: Role {}
public protocol Mine {}

public enum TheDeclarations: Mine {
    public typealias Kind = FormsFile
}
extension TheDeclarations {
    public static var typeName: String { "Dictionary/Atom.swift" }
}

public enum ThePages: Mine {
    public typealias Kind = CarriedFile
}
extension ThePages {
    public static var typeName: String { "AtomPages.swift" }
}

// Taken inputs have local views; their source is the v2 input record.
public protocol Theirs {}
public enum DrawingProfileFile: Role {}
public enum DrawingSource: Role {}
extension DrawingSource {
    public static var typeName: String { "https://github.com/DanielSwift1992/verification-is-identification-showcase@3feb541b592461db977f941c48e98a4f3ea485a4" }
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

public enum TheBindings: Theirs {
    public typealias Kind = CarriedFile
    public typealias At = DrawingSource
}
extension TheBindings {
    public static var typeName: String { ".gate/inputs/DrawingBindings.swift" }
}
