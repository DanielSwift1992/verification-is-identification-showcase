// DocumentFile names the complete source input read by DocumentKit.
// WorldFile, when also declared, keeps the independent company reading.
public protocol Role {}
public enum FormsFile: Role {}
public enum CarriedFile: Role {}
public enum DocumentFile: Role {}
public protocol Mine {}

public enum TheDeclarations: Mine {
    public typealias Kind = DocumentFile

    public typealias Language = WorldLanguage
}
extension TheDeclarations {
    public static var typeName: String { "Dictionary/ReadMe.swift" }
}

public enum ThePages: Mine {
    public typealias Kind = DocumentFile

    public typealias Language = WorldLanguage
}
extension ThePages {
    public static var typeName: String { "ReadMePages.swift" }
}

// Taken inputs have local views; their source is the v2 input record.
public protocol Theirs {}
public enum DrawingProfileFile: Role {}
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

    public typealias Language = DrawingPalette
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
    public static var typeName: String { "https://github.com/DanielSwift1992/verification-is-identification-showcase@965da471124a051b7989cd4880375df3a4eb2aa1" }
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
    public static var typeName: String { "https://github.com/DanielSwift1992/verification-is-identification-showcase@965da471124a051b7989cd4880375df3a4eb2aa1" }
}

// Owner-declared Language inputs (Tools/Playground/prepare-contexts.py).
public enum WorldLanguage: Role {}
public enum DrawingPalette: Role {}
public enum ContextScopesOrigin: Role {}
extension ContextScopesOrigin {
    public static var typeName: String { "https://github.com/DanielSwift1992/verification-is-identification-showcase@243e2b53ef91814f8f28762ddab4601bf226059b" }
}
public enum ContextScopes: Theirs {
    public typealias Kind = CarriedFile
    public typealias At = ContextScopesOrigin
}
extension ContextScopes {
    public static var typeName: String { ".gate/inputs/language/Checks/Grammar/scopes.swift" }
}
public enum ContextAlphabetOrigin: Role {}
extension ContextAlphabetOrigin {
    public static var typeName: String { "https://github.com/DanielSwift1992/verification-is-identification@1966abc0464081a3dbe1e31414f3bc683b2c41dc" }
}
public enum ContextAlphabet: Theirs {
    public typealias Kind = CarriedFile
    public typealias At = ContextAlphabetOrigin
}
extension ContextAlphabet {
    public static var typeName: String { ".gate/inputs/language/Sources/Alphabet/Alphabet.swift" }
}
public enum ContextKitVectorOrigin: Role {}
extension ContextKitVectorOrigin {
    public static var typeName: String { "https://github.com/DanielSwift1992/verification-is-identification-showcase@243e2b53ef91814f8f28762ddab4601bf226059b" }
}
public enum ContextKitVector: Theirs {
    public typealias Kind = CarriedFile
    public typealias At = ContextKitVectorOrigin
}
extension ContextKitVector {
    public static var typeName: String { ".gate/inputs/language/Sources/DocumentKit/Vector.swift" }
}
public enum ContextKitDesignOrigin: Role {}
extension ContextKitDesignOrigin {
    public static var typeName: String { "https://github.com/DanielSwift1992/verification-is-identification-showcase@243e2b53ef91814f8f28762ddab4601bf226059b" }
}
public enum ContextKitDesign: Theirs {
    public typealias Kind = CarriedFile
    public typealias At = ContextKitDesignOrigin
}
extension ContextKitDesign {
    public static var typeName: String { ".gate/inputs/language/Sources/DocumentKit/Design.swift" }
}
public enum ContextKitDynamicsOrigin: Role {}
extension ContextKitDynamicsOrigin {
    public static var typeName: String { "https://github.com/DanielSwift1992/verification-is-identification-showcase@243e2b53ef91814f8f28762ddab4601bf226059b" }
}
public enum ContextKitDynamics: Theirs {
    public typealias Kind = CarriedFile
    public typealias At = ContextKitDynamicsOrigin
}
extension ContextKitDynamics {
    public static var typeName: String { ".gate/inputs/language/Sources/DocumentKit/Dynamics.swift" }
}
public enum ContextCoreOrigin: Role {}
extension ContextCoreOrigin {
    public static var typeName: String { "https://github.com/DanielSwift1992/verification-is-identification@1966abc0464081a3dbe1e31414f3bc683b2c41dc" }
}
public enum ContextCore: Theirs {
    public typealias Kind = CarriedFile
    public typealias At = ContextCoreOrigin
}
extension ContextCore {
    public static var typeName: String { ".gate/inputs/language/Sources/VerificationIsIdentification/Core.swift" }
}
public enum ContextVerdictOrigin: Role {}
extension ContextVerdictOrigin {
    public static var typeName: String { "https://github.com/DanielSwift1992/verification-is-identification@1966abc0464081a3dbe1e31414f3bc683b2c41dc" }
}
public enum ContextVerdict: Theirs {
    public typealias Kind = CarriedFile
    public typealias At = ContextVerdictOrigin
}
extension ContextVerdict {
    public static var typeName: String { ".gate/inputs/language/Sources/VerificationIsIdentification/Verdict.swift" }
}
// End owner-declared Language inputs.
// Owner Court receipt inputs.
public enum CourtReceiptWorldLanguageOrigin: Role {}
extension CourtReceiptWorldLanguageOrigin { public static var typeName: String { "https://github.com/DanielSwift1992/verification-is-identification-showcase@179f5ae7caa08d0d46a3e83a30bf30cff195c659" } }
public enum CourtReceiptWorldLanguage: Theirs {
    public typealias Kind = CarriedFile
    public typealias At = CourtReceiptWorldLanguageOrigin
}
extension CourtReceiptWorldLanguage { public static var typeName: String { ".gate/receipts/WorldLanguage.json" } }
// End owner Court receipt inputs.
