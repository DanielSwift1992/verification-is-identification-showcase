// DrawingProfileReaderV1 metadata, like gate.manifest.swift; not a Swift target.
public protocol DrawingProfile {}
public protocol DrawingFont {}
public protocol DrawingMetrics {}
public protocol Word {}
public enum Port: Word {}
extension Port {
    public static var typeName: String { "gate/documentkit-drawing" }
}
public enum FaceFamily: Word {}
extension FaceFamily {
    public static var typeName: String { "Inter" }
}
public enum DefaultFace: Word {}
extension DefaultFace {
    public static var typeName: String { "default" }
}
public enum TableProfile: Word {}
extension TableProfile {
    public static var typeName: String { "gate/font-table-v1" }
}
public enum FontHash: Word {}
extension FontHash {
    public static var typeName: String { "4989b125924991b90d05b2d16e0e388c48f7d5bb8b30539bbf9c755278d0ccaf" }
}
public enum MissingGlyph: Word {}
extension MissingGlyph {
    public static var typeName: String { "advance-of-U+006D" }
}
public enum MeasuredFace: DrawingFont {
    public typealias Asset = TheFont
    public typealias Family = FaceFamily
    public typealias Face = DefaultFace
}
public enum MeasuredTable: DrawingMetrics {
    public typealias Input = TheMetrics
    public typealias Profile = TableProfile
    public typealias Font = MeasuredFace
    public typealias SourceFontSHA256 = FontHash
    public typealias UnitsPerEm = FontUnitsPerEm
    public typealias CapHeight = FontCapHeight
    public typealias Advances = FontAdvanceTable
    public typealias MissingGlyph = MissingGlyph
}
public enum TheDrawingProfile: DrawingProfile {
    public typealias Reader = Port
    public typealias Contract = TheContract
    public typealias Palette = ThePalette
    public typealias Bindings = (BindingReference0, BindingReference1, BindingReference2, BindingReference3, BindingReference4, BindingReference5, BindingReference6, BindingReference7, BindingReference8, BindingReference9, BindingReference10, BindingReference11, BindingReference12, BindingReference13, BindingReference14, BindingReference15, BindingReference16, BindingReference17, BindingReference18, BindingReference19, BindingReference20, BindingReference21, BindingReference22, BindingReference23, BindingReference24, BindingReference25, BindingReference26, BindingReference27, BindingReference28, BindingReference29, BindingReference30, BindingReference31, BindingReference32, BindingReference33, BindingReference34, BindingReference35, BindingReference36, BindingReference37)
    public typealias Font = MeasuredFace
    public typealias Metrics = MeasuredTable
    public typealias License = TheLicense
    public typealias Legible = (LegibleReference0, LegibleReference1, LegibleReference2, LegibleReference3, LegibleReference4, LegibleReference5, LegibleReference6, LegibleReference7, LegibleReference8, LegibleReference9, LegibleReference10, LegibleReference11, LegibleReference12, LegibleReference13, LegibleReference14, LegibleReference15, LegibleReference16)
}

public enum BindingReference0: Word {}
extension BindingReference0 {
    public static var typeName: String { "TheBindings::BindPaperLight" }
}

public enum BindingReference1: Word {}
extension BindingReference1 {
    public static var typeName: String { "TheBindings::BindPaperDark" }
}

public enum BindingReference2: Word {}
extension BindingReference2 {
    public static var typeName: String { "TheBindings::BindMistLight" }
}

public enum BindingReference3: Word {}
extension BindingReference3 {
    public static var typeName: String { "TheBindings::BindMistDark" }
}

public enum BindingReference4: Word {}
extension BindingReference4 {
    public static var typeName: String { "TheBindings::BindInkLight" }
}

public enum BindingReference5: Word {}
extension BindingReference5 {
    public static var typeName: String { "TheBindings::BindInkDark" }
}

public enum BindingReference6: Word {}
extension BindingReference6 {
    public static var typeName: String { "TheBindings::BindTextLight" }
}

public enum BindingReference7: Word {}
extension BindingReference7 {
    public static var typeName: String { "TheBindings::BindTextDark" }
}

public enum BindingReference8: Word {}
extension BindingReference8 {
    public static var typeName: String { "TheBindings::BindMutedLight" }
}

public enum BindingReference9: Word {}
extension BindingReference9 {
    public static var typeName: String { "TheBindings::BindMutedDark" }
}

public enum BindingReference10: Word {}
extension BindingReference10 {
    public static var typeName: String { "TheBindings::BindLineLight" }
}

public enum BindingReference11: Word {}
extension BindingReference11 {
    public static var typeName: String { "TheBindings::BindLineDark" }
}

public enum BindingReference12: Word {}
extension BindingReference12 {
    public static var typeName: String { "TheBindings::BindAccentLight" }
}

public enum BindingReference13: Word {}
extension BindingReference13 {
    public static var typeName: String { "TheBindings::BindAccentDark" }
}

public enum BindingReference14: Word {}
extension BindingReference14 {
    public static var typeName: String { "TheBindings::BindActionLight" }
}

public enum BindingReference15: Word {}
extension BindingReference15 {
    public static var typeName: String { "TheBindings::BindActionDark" }
}

public enum BindingReference16: Word {}
extension BindingReference16 {
    public static var typeName: String { "TheBindings::BindRefusalLight" }
}

public enum BindingReference17: Word {}
extension BindingReference17 {
    public static var typeName: String { "TheBindings::BindRefusalDark" }
}

public enum BindingReference18: Word {}
extension BindingReference18 {
    public static var typeName: String { "TheBindings::BindLawLight" }
}

public enum BindingReference19: Word {}
extension BindingReference19 {
    public static var typeName: String { "TheBindings::BindLawDark" }
}

public enum BindingReference20: Word {}
extension BindingReference20 {
    public static var typeName: String { "TheBindings::BindOkLight" }
}

public enum BindingReference21: Word {}
extension BindingReference21 {
    public static var typeName: String { "TheBindings::BindOkDark" }
}

public enum BindingReference22: Word {}
extension BindingReference22 {
    public static var typeName: String { "TheBindings::BindKeywordLight" }
}

public enum BindingReference23: Word {}
extension BindingReference23 {
    public static var typeName: String { "TheBindings::BindKeywordDark" }
}

public enum BindingReference24: Word {}
extension BindingReference24 {
    public static var typeName: String { "TheBindings::BindLiteralLight" }
}

public enum BindingReference25: Word {}
extension BindingReference25 {
    public static var typeName: String { "TheBindings::BindLiteralDark" }
}

public enum BindingReference26: Word {}
extension BindingReference26 {
    public static var typeName: String { "TheBindings::BindCommentLight" }
}

public enum BindingReference27: Word {}
extension BindingReference27 {
    public static var typeName: String { "TheBindings::BindCommentDark" }
}

public enum BindingReference28: Word {}
extension BindingReference28 {
    public static var typeName: String { "TheBindings::BindAttributeLight" }
}

public enum BindingReference29: Word {}
extension BindingReference29 {
    public static var typeName: String { "TheBindings::BindAttributeDark" }
}

public enum BindingReference30: Word {}
extension BindingReference30 {
    public static var typeName: String { "TheBindings::BindLocalTypeLight" }
}

public enum BindingReference31: Word {}
extension BindingReference31 {
    public static var typeName: String { "TheBindings::BindLocalTypeDark" }
}

public enum BindingReference32: Word {}
extension BindingReference32 {
    public static var typeName: String { "TheBindings::BindKnownNameLight" }
}

public enum BindingReference33: Word {}
extension BindingReference33 {
    public static var typeName: String { "TheBindings::BindKnownNameDark" }
}

public enum BindingReference34: Word {}
extension BindingReference34 {
    public static var typeName: String { "TheBindings::BindSurfaceCardLight" }
}

public enum BindingReference35: Word {}
extension BindingReference35 {
    public static var typeName: String { "TheBindings::BindSurfaceCardDark" }
}

public enum BindingReference36: Word {}
extension BindingReference36 {
    public static var typeName: String { "TheBindings::BindSurfaceTrackLight" }
}

public enum BindingReference37: Word {}
extension BindingReference37 {
    public static var typeName: String { "TheBindings::BindSurfaceTrackDark" }
}

public enum LegibleReference0: Word {}
extension LegibleReference0 {
    public static var typeName: String { "TheBindings::ReadTextOnPaper" }
}

public enum LegibleReference1: Word {}
extension LegibleReference1 {
    public static var typeName: String { "TheBindings::ReadTextOnMist" }
}

public enum LegibleReference2: Word {}
extension LegibleReference2 {
    public static var typeName: String { "TheBindings::ReadMutedOnPaper" }
}

public enum LegibleReference3: Word {}
extension LegibleReference3 {
    public static var typeName: String { "TheBindings::ReadMutedOnMist" }
}

public enum LegibleReference4: Word {}
extension LegibleReference4 {
    public static var typeName: String { "TheBindings::ReadInkOnAccent" }
}

public enum LegibleReference5: Word {}
extension LegibleReference5 {
    public static var typeName: String { "TheBindings::ReadActionOnPaper" }
}

public enum LegibleReference6: Word {}
extension LegibleReference6 {
    public static var typeName: String { "TheBindings::ReadRefusalOnPaper" }
}

public enum LegibleReference7: Word {}
extension LegibleReference7 {
    public static var typeName: String { "TheBindings::ReadLawOnPaper" }
}

public enum LegibleReference8: Word {}
extension LegibleReference8 {
    public static var typeName: String { "TheBindings::ReadOkOnPaper" }
}

public enum LegibleReference9: Word {}
extension LegibleReference9 {
    public static var typeName: String { "TheBindings::ReadKeywordOnPaper" }
}

public enum LegibleReference10: Word {}
extension LegibleReference10 {
    public static var typeName: String { "TheBindings::ReadLiteralOnPaper" }
}

public enum LegibleReference11: Word {}
extension LegibleReference11 {
    public static var typeName: String { "TheBindings::ReadCommentOnPaper" }
}

public enum LegibleReference12: Word {}
extension LegibleReference12 {
    public static var typeName: String { "TheBindings::ReadAttributeOnPaper" }
}

public enum LegibleReference13: Word {}
extension LegibleReference13 {
    public static var typeName: String { "TheBindings::ReadLocalTypeOnPaper" }
}

public enum LegibleReference14: Word {}
extension LegibleReference14 {
    public static var typeName: String { "TheBindings::ReadKnownNameOnPaper" }
}

public enum LegibleReference15: Word {}
extension LegibleReference15 {
    public static var typeName: String { "TheBindings::ReadTextOnSurfaceCardDim" }
}

public enum LegibleReference16: Word {}
extension LegibleReference16 {
    public static var typeName: String { "TheBindings::ReadMutedOnSurfaceCardDim" }
}
