// This world names its court. The manifest is not a Swift target source.
// FormsFile reads declarations with where and any declared PredicateReading with count.
// WorldFile is reserved for the company fragment (T-0023 rule 1b).
public protocol Role {}
public enum WorldFile: Role {}
public protocol Mine {}

public enum TheCompany: Mine {
    public typealias Kind = WorldFile

    public typealias Language = WorldLanguage
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

public enum TheCompanyPart001: Mine {
    public typealias Kind = WorldFile

    public typealias Language = WorldLanguage
}
extension TheCompanyPart001 {
    public static var typeName: String { "CompanyPart001.swift" }
}

public enum TheCompanyPart002: Mine {
    public typealias Kind = WorldFile

    public typealias Language = WorldLanguage
}
extension TheCompanyPart002 {
    public static var typeName: String { "CompanyPart002.swift" }
}

public enum TheCompanyPart003: Mine {
    public typealias Kind = WorldFile

    public typealias Language = WorldLanguage
}
extension TheCompanyPart003 {
    public static var typeName: String { "CompanyPart003.swift" }
}

public enum TheCompanyPart004: Mine {
    public typealias Kind = WorldFile

    public typealias Language = WorldLanguage
}
extension TheCompanyPart004 {
    public static var typeName: String { "CompanyPart004.swift" }
}

public enum TheCompanyPart005: Mine {
    public typealias Kind = WorldFile

    public typealias Language = WorldLanguage
}
extension TheCompanyPart005 {
    public static var typeName: String { "CompanyPart005.swift" }
}

public enum TheCompanyPart006: Mine {
    public typealias Kind = WorldFile

    public typealias Language = WorldLanguage
}
extension TheCompanyPart006 {
    public static var typeName: String { "CompanyPart006.swift" }
}

public enum TheCompanyPart007: Mine {
    public typealias Kind = WorldFile

    public typealias Language = WorldLanguage
}
extension TheCompanyPart007 {
    public static var typeName: String { "CompanyPart007.swift" }
}

public enum TheCompanyPart008: Mine {
    public typealias Kind = WorldFile

    public typealias Language = WorldLanguage
}
extension TheCompanyPart008 {
    public static var typeName: String { "CompanyPart008.swift" }
}

public enum TheCompanyPart009: Mine {
    public typealias Kind = WorldFile

    public typealias Language = WorldLanguage
}
extension TheCompanyPart009 {
    public static var typeName: String { "CompanyPart009.swift" }
}

public enum TheCompanyPart010: Mine {
    public typealias Kind = WorldFile

    public typealias Language = WorldLanguage
}
extension TheCompanyPart010 {
    public static var typeName: String { "CompanyPart010.swift" }
}

public enum TheCompanyPart011: Mine {
    public typealias Kind = WorldFile

    public typealias Language = WorldLanguage
}
extension TheCompanyPart011 {
    public static var typeName: String { "CompanyPart011.swift" }
}

public enum TheCompanyPart012: Mine {
    public typealias Kind = WorldFile

    public typealias Language = WorldLanguage
}
extension TheCompanyPart012 {
    public static var typeName: String { "CompanyPart012.swift" }
}

public enum TheCompanyPart013: Mine {
    public typealias Kind = WorldFile

    public typealias Language = WorldLanguage
}
extension TheCompanyPart013 {
    public static var typeName: String { "CompanyPart013.swift" }
}

public enum TheCompanyPart014: Mine {
    public typealias Kind = WorldFile

    public typealias Language = WorldLanguage
}
extension TheCompanyPart014 {
    public static var typeName: String { "CompanyPart014.swift" }
}

public enum TheCompanyPart015: Mine {
    public typealias Kind = WorldFile

    public typealias Language = WorldLanguage
}
extension TheCompanyPart015 {
    public static var typeName: String { "CompanyPart015.swift" }
}

public enum TheCompanyPart016: Mine {
    public typealias Kind = WorldFile

    public typealias Language = WorldLanguage
}
extension TheCompanyPart016 {
    public static var typeName: String { "CompanyPart016.swift" }
}

public enum TheCompanyPart017: Mine {
    public typealias Kind = WorldFile

    public typealias Language = WorldLanguage
}
extension TheCompanyPart017 {
    public static var typeName: String { "CompanyPart017.swift" }
}

public enum TheCompanyPart018: Mine {
    public typealias Kind = WorldFile

    public typealias Language = WorldLanguage
}
extension TheCompanyPart018 {
    public static var typeName: String { "CompanyPart018.swift" }
}

public enum TheCompanyPart019: Mine {
    public typealias Kind = WorldFile

    public typealias Language = WorldLanguage
}
extension TheCompanyPart019 {
    public static var typeName: String { "CompanyPart019.swift" }
}

public enum TheCompanyPart020: Mine {
    public typealias Kind = WorldFile

    public typealias Language = WorldLanguage
}
extension TheCompanyPart020 {
    public static var typeName: String { "CompanyPart020.swift" }
}

public enum TheCompanyPart021: Mine {
    public typealias Kind = WorldFile

    public typealias Language = WorldLanguage
}
extension TheCompanyPart021 {
    public static var typeName: String { "CompanyPart021.swift" }
}

public enum TheCompanyPart022: Mine {
    public typealias Kind = WorldFile

    public typealias Language = WorldLanguage
}
extension TheCompanyPart022 {
    public static var typeName: String { "CompanyPart022.swift" }
}

public enum TheCompanyPart023: Mine {
    public typealias Kind = WorldFile

    public typealias Language = WorldLanguage
}
extension TheCompanyPart023 {
    public static var typeName: String { "CompanyPart023.swift" }
}

public enum TheCompanyPart024: Mine {
    public typealias Kind = WorldFile

    public typealias Language = WorldLanguage
}
extension TheCompanyPart024 {
    public static var typeName: String { "CompanyPart024.swift" }
}

public enum TheCompanyPart025: Mine {
    public typealias Kind = WorldFile

    public typealias Language = WorldLanguage
}
extension TheCompanyPart025 {
    public static var typeName: String { "CompanyPart025.swift" }
}

public enum TheCompanyPart026: Mine {
    public typealias Kind = WorldFile

    public typealias Language = WorldLanguage
}
extension TheCompanyPart026 {
    public static var typeName: String { "CompanyPart026.swift" }
}

public enum TheCompanyPart027: Mine {
    public typealias Kind = WorldFile

    public typealias Language = WorldLanguage
}
extension TheCompanyPart027 {
    public static var typeName: String { "CompanyPart027.swift" }
}

public enum TheCompanyPart028: Mine {
    public typealias Kind = WorldFile

    public typealias Language = WorldLanguage
}
extension TheCompanyPart028 {
    public static var typeName: String { "CompanyPart028.swift" }
}

public enum TheCompanyPart029: Mine {
    public typealias Kind = WorldFile

    public typealias Language = WorldLanguage
}
extension TheCompanyPart029 {
    public static var typeName: String { "CompanyPart029.swift" }
}

public enum TheCompanyPart030: Mine {
    public typealias Kind = WorldFile

    public typealias Language = WorldLanguage
}
extension TheCompanyPart030 {
    public static var typeName: String { "CompanyPart030.swift" }
}

public enum TheCompanyPart031: Mine {
    public typealias Kind = WorldFile

    public typealias Language = WorldLanguage
}
extension TheCompanyPart031 {
    public static var typeName: String { "CompanyPart031.swift" }
}

public enum TheCompanyPart032: Mine {
    public typealias Kind = WorldFile

    public typealias Language = WorldLanguage
}
extension TheCompanyPart032 {
    public static var typeName: String { "CompanyPart032.swift" }
}

public enum TheCompanyPart033: Mine {
    public typealias Kind = WorldFile

    public typealias Language = WorldLanguage
}
extension TheCompanyPart033 {
    public static var typeName: String { "CompanyPart033.swift" }
}

public enum TheCompanyPart034: Mine {
    public typealias Kind = WorldFile

    public typealias Language = WorldLanguage
}
extension TheCompanyPart034 {
    public static var typeName: String { "CompanyPart034.swift" }
}

public enum TheCompanyPart035: Mine {
    public typealias Kind = WorldFile

    public typealias Language = WorldLanguage
}
extension TheCompanyPart035 {
    public static var typeName: String { "CompanyPart035.swift" }
}

public enum TheCompanyPart036: Mine {
    public typealias Kind = WorldFile

    public typealias Language = WorldLanguage
}
extension TheCompanyPart036 {
    public static var typeName: String { "CompanyPart036.swift" }
}

public enum TheCompanyPart037: Mine {
    public typealias Kind = WorldFile

    public typealias Language = WorldLanguage
}
extension TheCompanyPart037 {
    public static var typeName: String { "CompanyPart037.swift" }
}

public enum TheCompanyPart038: Mine {
    public typealias Kind = WorldFile

    public typealias Language = WorldLanguage
}
extension TheCompanyPart038 {
    public static var typeName: String { "CompanyPart038.swift" }
}

public enum TheCompanyPart039: Mine {
    public typealias Kind = WorldFile

    public typealias Language = WorldLanguage
}
extension TheCompanyPart039 {
    public static var typeName: String { "CompanyPart039.swift" }
}

public enum TheCompanyPart040: Mine {
    public typealias Kind = WorldFile

    public typealias Language = WorldLanguage
}
extension TheCompanyPart040 {
    public static var typeName: String { "CompanyPart040.swift" }
}

public enum TheCompanyPart041: Mine {
    public typealias Kind = WorldFile

    public typealias Language = WorldLanguage
}
extension TheCompanyPart041 {
    public static var typeName: String { "CompanyPart041.swift" }
}

public enum TheCompanyPart042: Mine {
    public typealias Kind = WorldFile

    public typealias Language = WorldLanguage
}
extension TheCompanyPart042 {
    public static var typeName: String { "CompanyPart042.swift" }
}

public enum TheCompanyPart043: Mine {
    public typealias Kind = WorldFile

    public typealias Language = WorldLanguage
}
extension TheCompanyPart043 {
    public static var typeName: String { "CompanyPart043.swift" }
}

public enum TheCompanyPart044: Mine {
    public typealias Kind = WorldFile

    public typealias Language = WorldLanguage
}
extension TheCompanyPart044 {
    public static var typeName: String { "CompanyPart044.swift" }
}

public enum TheCompanyPart045: Mine {
    public typealias Kind = WorldFile

    public typealias Language = WorldLanguage
}
extension TheCompanyPart045 {
    public static var typeName: String { "CompanyPart045.swift" }
}

public enum TheCompanyPart046: Mine {
    public typealias Kind = WorldFile

    public typealias Language = WorldLanguage
}
extension TheCompanyPart046 {
    public static var typeName: String { "CompanyPart046.swift" }
}

public enum TheCompanyPart047: Mine {
    public typealias Kind = WorldFile

    public typealias Language = WorldLanguage
}
extension TheCompanyPart047 {
    public static var typeName: String { "CompanyPart047.swift" }
}

public enum TheCompanyPart048: Mine {
    public typealias Kind = WorldFile

    public typealias Language = WorldLanguage
}
extension TheCompanyPart048 {
    public static var typeName: String { "CompanyPart048.swift" }
}

public enum TheCompanyPart049: Mine {
    public typealias Kind = WorldFile

    public typealias Language = WorldLanguage
}
extension TheCompanyPart049 {
    public static var typeName: String { "CompanyPart049.swift" }
}

public enum TheCompanyPart050: Mine {
    public typealias Kind = WorldFile

    public typealias Language = WorldLanguage
}
extension TheCompanyPart050 {
    public static var typeName: String { "CompanyPart050.swift" }
}

public enum TheCompanyPart051: Mine {
    public typealias Kind = WorldFile

    public typealias Language = WorldLanguage
}
extension TheCompanyPart051 {
    public static var typeName: String { "CompanyPart051.swift" }
}

public enum TheCompanyPart052: Mine {
    public typealias Kind = WorldFile

    public typealias Language = WorldLanguage
}
extension TheCompanyPart052 {
    public static var typeName: String { "CompanyPart052.swift" }
}

public enum TheCompanyPart053: Mine {
    public typealias Kind = WorldFile

    public typealias Language = WorldLanguage
}
extension TheCompanyPart053 {
    public static var typeName: String { "CompanyPart053.swift" }
}

public enum TheCompanyPart054: Mine {
    public typealias Kind = WorldFile

    public typealias Language = WorldLanguage
}
extension TheCompanyPart054 {
    public static var typeName: String { "CompanyPart054.swift" }
}

public enum TheCompanyPart055: Mine {
    public typealias Kind = WorldFile

    public typealias Language = WorldLanguage
}
extension TheCompanyPart055 {
    public static var typeName: String { "CompanyPart055.swift" }
}

public enum TheCompanyPart056: Mine {
    public typealias Kind = WorldFile

    public typealias Language = WorldLanguage
}
extension TheCompanyPart056 {
    public static var typeName: String { "CompanyPart056.swift" }
}

public enum TheCompanyPart057: Mine {
    public typealias Kind = WorldFile

    public typealias Language = WorldLanguage
}
extension TheCompanyPart057 {
    public static var typeName: String { "CompanyPart057.swift" }
}

public enum TheCompanyPart058: Mine {
    public typealias Kind = WorldFile

    public typealias Language = WorldLanguage
}
extension TheCompanyPart058 {
    public static var typeName: String { "CompanyPart058.swift" }
}

public enum TheCompanyPart059: Mine {
    public typealias Kind = WorldFile

    public typealias Language = WorldLanguage
}
extension TheCompanyPart059 {
    public static var typeName: String { "CompanyPart059.swift" }
}

public enum TheCompanyPart060: Mine {
    public typealias Kind = WorldFile

    public typealias Language = WorldLanguage
}
extension TheCompanyPart060 {
    public static var typeName: String { "CompanyPart060.swift" }
}

public enum TheCompanyPart061: Mine {
    public typealias Kind = WorldFile

    public typealias Language = WorldLanguage
}
extension TheCompanyPart061 {
    public static var typeName: String { "CompanyPart061.swift" }
}

public enum TheCompanyPart062: Mine {
    public typealias Kind = WorldFile

    public typealias Language = WorldLanguage
}
extension TheCompanyPart062 {
    public static var typeName: String { "CompanyPart062.swift" }
}

public enum TheCompanyPart063: Mine {
    public typealias Kind = WorldFile

    public typealias Language = WorldLanguage
}
extension TheCompanyPart063 {
    public static var typeName: String { "CompanyPart063.swift" }
}

public enum TheCompanyPart064: Mine {
    public typealias Kind = WorldFile

    public typealias Language = WorldLanguage
}
extension TheCompanyPart064 {
    public static var typeName: String { "CompanyPart064.swift" }
}

public enum TheCompanyPart065: Mine {
    public typealias Kind = WorldFile

    public typealias Language = WorldLanguage
}
extension TheCompanyPart065 {
    public static var typeName: String { "CompanyPart065.swift" }
}

public enum TheCompanyPart066: Mine {
    public typealias Kind = WorldFile

    public typealias Language = WorldLanguage
}
extension TheCompanyPart066 {
    public static var typeName: String { "CompanyPart066.swift" }
}

public enum TheCompanyPart067: Mine {
    public typealias Kind = WorldFile

    public typealias Language = WorldLanguage
}
extension TheCompanyPart067 {
    public static var typeName: String { "CompanyPart067.swift" }
}

public enum DocumentFile: Role {}

// The owner supplies the page and geometry; neither states company premises.
public enum ThePages: Mine {
    public typealias Kind = DocumentFile
    public typealias DrawingInputs = (TheCompany, TheCompanyPart001, TheCompanyPart002, TheCompanyPart003, TheCompanyPart004, TheCompanyPart005, TheCompanyPart006, TheCompanyPart007, TheCompanyPart008, TheCompanyPart009, TheCompanyPart010, TheCompanyPart011, TheCompanyPart012, TheCompanyPart013, TheCompanyPart014, TheCompanyPart015, TheCompanyPart016, TheCompanyPart017, TheCompanyPart018, TheCompanyPart019, TheCompanyPart020, TheCompanyPart021, TheCompanyPart022, TheCompanyPart023, TheCompanyPart024, TheCompanyPart025, TheCompanyPart026, TheCompanyPart027, TheCompanyPart028, TheCompanyPart029, TheCompanyPart030, TheCompanyPart031, TheCompanyPart032, TheCompanyPart033, TheCompanyPart034, TheCompanyPart035, TheCompanyPart036, TheCompanyPart037, TheCompanyPart038, TheCompanyPart039, TheCompanyPart040, TheCompanyPart041, TheCompanyPart042, TheCompanyPart043, TheCompanyPart044, TheCompanyPart045, TheCompanyPart046, TheCompanyPart047, TheCompanyPart048, TheCompanyPart049, TheCompanyPart050, TheCompanyPart051, TheCompanyPart052, TheCompanyPart053, TheCompanyPart054, TheCompanyPart055, TheCompanyPart056, TheCompanyPart057, TheCompanyPart058, TheCompanyPart059, TheCompanyPart060, TheCompanyPart061, TheCompanyPart062, TheCompanyPart063, TheCompanyPart064, TheCompanyPart065, TheCompanyPart066, TheCompanyPart067)

    public typealias Language = WorldLanguage
}
extension ThePages {
    public static var typeName: String { "ScalePages.swift" }
}
public enum TheGeometry: Mine {
    public typealias Kind = DocumentFile

    public typealias Language = WorldLanguage
}
extension TheGeometry {
    public static var typeName: String { "Dictionary/Design.swift" }
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
public enum ContextRosterOrigin: Role {}
extension ContextRosterOrigin {
    public static var typeName: String { "https://github.com/DanielSwift1992/verification-is-identification-showcase@243e2b53ef91814f8f28762ddab4601bf226059b" }
}
public enum ContextRoster: Theirs {
    public typealias Kind = CarriedFile
    public typealias At = ContextRosterOrigin
}
extension ContextRoster {
    public static var typeName: String { ".gate/inputs/language/Sources/Organization/System/Roster.swift" }
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
