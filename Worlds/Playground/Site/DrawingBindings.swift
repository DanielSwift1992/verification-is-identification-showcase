import VerificationIsIdentification
import DocumentKit

// The drawing consumer is bound explicitly; these are not naming conventions.
public protocol DrawingBinding: Close {}
public protocol DrawingLuminance: Close {}
public protocol DrawingLegible: Close {}
public enum DrawingLight: Close {}
extension DrawingLight {
    public static var typeName: String { "light" }
}

public enum DrawingDark: Close {}
extension DrawingDark {
    public static var typeName: String { "dark" }
}

public enum DrawingRole0: Close {}
extension DrawingRole0 {
    public static var typeName: String { "on-action" }
}

public enum YPaperLight: DrawingLuminance {
    public typealias Value = PaperLitY
    public typealias Colour = PaperColour.Lit
    public typealias Projection = XYZRatioWrite<Never, PaperLitY, Never, CoordinateScale>
}

public enum BindPaperLight: DrawingBinding {
    public typealias Role = DrawingRole0
    public typealias Theme = DrawingLight
    public typealias Colour = PaperColour.Lit
    public typealias Luminance = YPaperLight
}

public enum YPaperDark: DrawingLuminance {
    public typealias Value = PaperDimY
    public typealias Colour = PaperColour.Dim
    public typealias Projection = XYZRatioWrite<Never, PaperDimY, Never, CoordinateScale>
}

public enum BindPaperDark: DrawingBinding {
    public typealias Role = DrawingRole0
    public typealias Theme = DrawingDark
    public typealias Colour = PaperColour.Dim
    public typealias Luminance = YPaperDark
}

public enum DrawingRole1: Close {}
extension DrawingRole1 {
    public static var typeName: String { "mist" }
}

public enum YMistLight: DrawingLuminance {
    public typealias Value = MistLitY
    public typealias Colour = MistColour.Lit
    public typealias Projection = XYZRatioWrite<Never, MistLitY, Never, CoordinateScale>
}

public enum BindMistLight: DrawingBinding {
    public typealias Role = DrawingRole1
    public typealias Theme = DrawingLight
    public typealias Colour = MistColour.Lit
    public typealias Luminance = YMistLight
}

public enum YMistDark: DrawingLuminance {
    public typealias Value = MistLitY
    public typealias Colour = MistColour.Lit
    public typealias Projection = XYZRatioWrite<Never, MistLitY, Never, CoordinateScale>
}

public enum BindMistDark: DrawingBinding {
    public typealias Role = DrawingRole1
    public typealias Theme = DrawingDark
    public typealias Colour = MistColour.Lit
    public typealias Luminance = YMistDark
}

public enum DrawingRole2: Close {}
extension DrawingRole2 {
    public static var typeName: String { "on-accent" }
}

public enum YInkLight: DrawingLuminance {
    public typealias Value = InkLitY
    public typealias Colour = InkColour.Lit
    public typealias Projection = XYZRatioWrite<Never, InkLitY, Never, CoordinateScale>
}

public enum BindInkLight: DrawingBinding {
    public typealias Role = DrawingRole2
    public typealias Theme = DrawingLight
    public typealias Colour = InkColour.Lit
    public typealias Luminance = YInkLight
}

public enum YInkDark: DrawingLuminance {
    public typealias Value = InkDimY
    public typealias Colour = InkColour.Dim
    public typealias Projection = XYZRatioWrite<Never, InkDimY, Never, CoordinateScale>
}

public enum BindInkDark: DrawingBinding {
    public typealias Role = DrawingRole2
    public typealias Theme = DrawingDark
    public typealias Colour = InkColour.Dim
    public typealias Luminance = YInkDark
}

public enum DrawingRole3: Close {}
extension DrawingRole3 {
    public static var typeName: String { "text-primary" }
}

public enum YTextLight: DrawingLuminance {
    public typealias Value = TextLitY
    public typealias Colour = TextColour.Lit
    public typealias Projection = XYZRatioWrite<Never, TextLitY, Never, CoordinateScale>
}

public enum BindTextLight: DrawingBinding {
    public typealias Role = DrawingRole3
    public typealias Theme = DrawingLight
    public typealias Colour = TextColour.Lit
    public typealias Luminance = YTextLight
}

public enum YTextDark: DrawingLuminance {
    public typealias Value = TextDimY
    public typealias Colour = TextColour.Dim
    public typealias Projection = XYZRatioWrite<Never, TextDimY, Never, CoordinateScale>
}

public enum BindTextDark: DrawingBinding {
    public typealias Role = DrawingRole3
    public typealias Theme = DrawingDark
    public typealias Colour = TextColour.Dim
    public typealias Luminance = YTextDark
}

public enum DrawingRole4: Close {}
extension DrawingRole4 {
    public static var typeName: String { "text-secondary" }
}

public enum YMutedLight: DrawingLuminance {
    public typealias Value = MutedLitY
    public typealias Colour = MutedColour.Lit
    public typealias Projection = XYZRatioWrite<Never, MutedLitY, Never, CoordinateScale>
}

public enum BindMutedLight: DrawingBinding {
    public typealias Role = DrawingRole4
    public typealias Theme = DrawingLight
    public typealias Colour = MutedColour.Lit
    public typealias Luminance = YMutedLight
}

public enum YMutedDark: DrawingLuminance {
    public typealias Value = MutedDimY
    public typealias Colour = MutedColour.Dim
    public typealias Projection = XYZRatioWrite<Never, MutedDimY, Never, CoordinateScale>
}

public enum BindMutedDark: DrawingBinding {
    public typealias Role = DrawingRole4
    public typealias Theme = DrawingDark
    public typealias Colour = MutedColour.Dim
    public typealias Luminance = YMutedDark
}

public enum DrawingRole5: Close {}
extension DrawingRole5 {
    public static var typeName: String { "line" }
}

public enum YLineLight: DrawingLuminance {
    public typealias Value = LineLitY
    public typealias Colour = LineColour.Lit
    public typealias Projection = XYZRatioWrite<Never, LineLitY, Never, CoordinateScale>
}

public enum BindLineLight: DrawingBinding {
    public typealias Role = DrawingRole5
    public typealias Theme = DrawingLight
    public typealias Colour = LineColour.Lit
    public typealias Luminance = YLineLight
}

public enum YLineDark: DrawingLuminance {
    public typealias Value = LineDimY
    public typealias Colour = LineColour.Dim
    public typealias Projection = XYZRatioWrite<Never, LineDimY, Never, CoordinateScale>
}

public enum BindLineDark: DrawingBinding {
    public typealias Role = DrawingRole5
    public typealias Theme = DrawingDark
    public typealias Colour = LineColour.Dim
    public typealias Luminance = YLineDark
}

public enum DrawingRole6: Close {}
extension DrawingRole6 {
    public static var typeName: String { "accent" }
}

public enum YAccentLight: DrawingLuminance {
    public typealias Value = AccentLitY
    public typealias Colour = AccentColour.Lit
    public typealias Projection = XYZRatioWrite<Never, AccentLitY, Never, CoordinateScale>
}

public enum BindAccentLight: DrawingBinding {
    public typealias Role = DrawingRole6
    public typealias Theme = DrawingLight
    public typealias Colour = AccentColour.Lit
    public typealias Luminance = YAccentLight
}

public enum YAccentDark: DrawingLuminance {
    public typealias Value = AccentDimY
    public typealias Colour = AccentColour.Dim
    public typealias Projection = XYZRatioWrite<Never, AccentDimY, Never, CoordinateScale>
}

public enum BindAccentDark: DrawingBinding {
    public typealias Role = DrawingRole6
    public typealias Theme = DrawingDark
    public typealias Colour = AccentColour.Dim
    public typealias Luminance = YAccentDark
}

public enum DrawingRole7: Close {}
extension DrawingRole7 {
    public static var typeName: String { "action" }
}

public enum YActionLight: DrawingLuminance {
    public typealias Value = ActionLitY
    public typealias Colour = ActionColour.Lit
    public typealias Projection = XYZRatioWrite<Never, ActionLitY, Never, CoordinateScale>
}

public enum BindActionLight: DrawingBinding {
    public typealias Role = DrawingRole7
    public typealias Theme = DrawingLight
    public typealias Colour = ActionColour.Lit
    public typealias Luminance = YActionLight
}

public enum YActionDark: DrawingLuminance {
    public typealias Value = ActionDimY
    public typealias Colour = ActionColour.Dim
    public typealias Projection = XYZRatioWrite<Never, ActionDimY, Never, CoordinateScale>
}

public enum BindActionDark: DrawingBinding {
    public typealias Role = DrawingRole7
    public typealias Theme = DrawingDark
    public typealias Colour = ActionColour.Dim
    public typealias Luminance = YActionDark
}

public enum DrawingRole8: Close {}
extension DrawingRole8 {
    public static var typeName: String { "refusal" }
}

public enum YRefusalLight: DrawingLuminance {
    public typealias Value = RefusalLitY
    public typealias Colour = RefusalColour.Lit
    public typealias Projection = XYZRatioWrite<Never, RefusalLitY, Never, CoordinateScale>
}

public enum BindRefusalLight: DrawingBinding {
    public typealias Role = DrawingRole8
    public typealias Theme = DrawingLight
    public typealias Colour = RefusalColour.Lit
    public typealias Luminance = YRefusalLight
}

public enum YRefusalDark: DrawingLuminance {
    public typealias Value = RefusalLitY
    public typealias Colour = RefusalColour.Lit
    public typealias Projection = XYZRatioWrite<Never, RefusalLitY, Never, CoordinateScale>
}

public enum BindRefusalDark: DrawingBinding {
    public typealias Role = DrawingRole8
    public typealias Theme = DrawingDark
    public typealias Colour = RefusalColour.Lit
    public typealias Luminance = YRefusalDark
}

public enum DrawingRole9: Close {}
extension DrawingRole9 {
    public static var typeName: String { "law" }
}

public enum YLawLight: DrawingLuminance {
    public typealias Value = LawLitY
    public typealias Colour = LawColour.Lit
    public typealias Projection = XYZRatioWrite<Never, LawLitY, Never, CoordinateScale>
}

public enum BindLawLight: DrawingBinding {
    public typealias Role = DrawingRole9
    public typealias Theme = DrawingLight
    public typealias Colour = LawColour.Lit
    public typealias Luminance = YLawLight
}

public enum YLawDark: DrawingLuminance {
    public typealias Value = LawLitY
    public typealias Colour = LawColour.Lit
    public typealias Projection = XYZRatioWrite<Never, LawLitY, Never, CoordinateScale>
}

public enum BindLawDark: DrawingBinding {
    public typealias Role = DrawingRole9
    public typealias Theme = DrawingDark
    public typealias Colour = LawColour.Lit
    public typealias Luminance = YLawDark
}

public enum DrawingRole10: Close {}
extension DrawingRole10 {
    public static var typeName: String { "ok" }
}

public enum YOkLight: DrawingLuminance {
    public typealias Value = OkLitY
    public typealias Colour = OkColour.Lit
    public typealias Projection = XYZRatioWrite<Never, OkLitY, Never, CoordinateScale>
}

public enum BindOkLight: DrawingBinding {
    public typealias Role = DrawingRole10
    public typealias Theme = DrawingLight
    public typealias Colour = OkColour.Lit
    public typealias Luminance = YOkLight
}

public enum YOkDark: DrawingLuminance {
    public typealias Value = OkLitY
    public typealias Colour = OkColour.Lit
    public typealias Projection = XYZRatioWrite<Never, OkLitY, Never, CoordinateScale>
}

public enum BindOkDark: DrawingBinding {
    public typealias Role = DrawingRole10
    public typealias Theme = DrawingDark
    public typealias Colour = OkColour.Lit
    public typealias Luminance = YOkDark
}

public enum DrawingRole11: Close {}
extension DrawingRole11 {
    public static var typeName: String { "keyword" }
}

public enum YKeywordLight: DrawingLuminance {
    public typealias Value = KeywordLitY
    public typealias Colour = KeywordColour.Lit
    public typealias Projection = XYZRatioWrite<Never, KeywordLitY, Never, CoordinateScale>
}

public enum BindKeywordLight: DrawingBinding {
    public typealias Role = DrawingRole11
    public typealias Theme = DrawingLight
    public typealias Colour = KeywordColour.Lit
    public typealias Luminance = YKeywordLight
}

public enum YKeywordDark: DrawingLuminance {
    public typealias Value = KeywordLitY
    public typealias Colour = KeywordColour.Lit
    public typealias Projection = XYZRatioWrite<Never, KeywordLitY, Never, CoordinateScale>
}

public enum BindKeywordDark: DrawingBinding {
    public typealias Role = DrawingRole11
    public typealias Theme = DrawingDark
    public typealias Colour = KeywordColour.Lit
    public typealias Luminance = YKeywordDark
}

public enum DrawingRole12: Close {}
extension DrawingRole12 {
    public static var typeName: String { "literal" }
}

public enum YLiteralLight: DrawingLuminance {
    public typealias Value = LiteralLitY
    public typealias Colour = LiteralColour.Lit
    public typealias Projection = XYZRatioWrite<Never, LiteralLitY, Never, CoordinateScale>
}

public enum BindLiteralLight: DrawingBinding {
    public typealias Role = DrawingRole12
    public typealias Theme = DrawingLight
    public typealias Colour = LiteralColour.Lit
    public typealias Luminance = YLiteralLight
}

public enum YLiteralDark: DrawingLuminance {
    public typealias Value = LiteralLitY
    public typealias Colour = LiteralColour.Lit
    public typealias Projection = XYZRatioWrite<Never, LiteralLitY, Never, CoordinateScale>
}

public enum BindLiteralDark: DrawingBinding {
    public typealias Role = DrawingRole12
    public typealias Theme = DrawingDark
    public typealias Colour = LiteralColour.Lit
    public typealias Luminance = YLiteralDark
}

public enum DrawingRole13: Close {}
extension DrawingRole13 {
    public static var typeName: String { "comment" }
}

public enum YCommentLight: DrawingLuminance {
    public typealias Value = CommentLitY
    public typealias Colour = CommentColour.Lit
    public typealias Projection = XYZRatioWrite<Never, CommentLitY, Never, CoordinateScale>
}

public enum BindCommentLight: DrawingBinding {
    public typealias Role = DrawingRole13
    public typealias Theme = DrawingLight
    public typealias Colour = CommentColour.Lit
    public typealias Luminance = YCommentLight
}

public enum YCommentDark: DrawingLuminance {
    public typealias Value = CommentLitY
    public typealias Colour = CommentColour.Lit
    public typealias Projection = XYZRatioWrite<Never, CommentLitY, Never, CoordinateScale>
}

public enum BindCommentDark: DrawingBinding {
    public typealias Role = DrawingRole13
    public typealias Theme = DrawingDark
    public typealias Colour = CommentColour.Lit
    public typealias Luminance = YCommentDark
}

public enum DrawingRole14: Close {}
extension DrawingRole14 {
    public static var typeName: String { "attribute" }
}

public enum YAttributeLight: DrawingLuminance {
    public typealias Value = AttributeLitY
    public typealias Colour = AttributeColour.Lit
    public typealias Projection = XYZRatioWrite<Never, AttributeLitY, Never, CoordinateScale>
}

public enum BindAttributeLight: DrawingBinding {
    public typealias Role = DrawingRole14
    public typealias Theme = DrawingLight
    public typealias Colour = AttributeColour.Lit
    public typealias Luminance = YAttributeLight
}

public enum YAttributeDark: DrawingLuminance {
    public typealias Value = AttributeLitY
    public typealias Colour = AttributeColour.Lit
    public typealias Projection = XYZRatioWrite<Never, AttributeLitY, Never, CoordinateScale>
}

public enum BindAttributeDark: DrawingBinding {
    public typealias Role = DrawingRole14
    public typealias Theme = DrawingDark
    public typealias Colour = AttributeColour.Lit
    public typealias Luminance = YAttributeDark
}

public enum DrawingRole15: Close {}
extension DrawingRole15 {
    public static var typeName: String { "localtype" }
}

public enum YLocalTypeLight: DrawingLuminance {
    public typealias Value = LocalTypeLitY
    public typealias Colour = LocalTypeColour.Lit
    public typealias Projection = XYZRatioWrite<Never, LocalTypeLitY, Never, CoordinateScale>
}

public enum BindLocalTypeLight: DrawingBinding {
    public typealias Role = DrawingRole15
    public typealias Theme = DrawingLight
    public typealias Colour = LocalTypeColour.Lit
    public typealias Luminance = YLocalTypeLight
}

public enum YLocalTypeDark: DrawingLuminance {
    public typealias Value = LocalTypeLitY
    public typealias Colour = LocalTypeColour.Lit
    public typealias Projection = XYZRatioWrite<Never, LocalTypeLitY, Never, CoordinateScale>
}

public enum BindLocalTypeDark: DrawingBinding {
    public typealias Role = DrawingRole15
    public typealias Theme = DrawingDark
    public typealias Colour = LocalTypeColour.Lit
    public typealias Luminance = YLocalTypeDark
}

public enum DrawingRole16: Close {}
extension DrawingRole16 {
    public static var typeName: String { "knownname" }
}

public enum YKnownNameLight: DrawingLuminance {
    public typealias Value = KnownNameLitY
    public typealias Colour = KnownNameColour.Lit
    public typealias Projection = XYZRatioWrite<Never, KnownNameLitY, Never, CoordinateScale>
}

public enum BindKnownNameLight: DrawingBinding {
    public typealias Role = DrawingRole16
    public typealias Theme = DrawingLight
    public typealias Colour = KnownNameColour.Lit
    public typealias Luminance = YKnownNameLight
}

public enum YKnownNameDark: DrawingLuminance {
    public typealias Value = KnownNameLitY
    public typealias Colour = KnownNameColour.Lit
    public typealias Projection = XYZRatioWrite<Never, KnownNameLitY, Never, CoordinateScale>
}

public enum BindKnownNameDark: DrawingBinding {
    public typealias Role = DrawingRole16
    public typealias Theme = DrawingDark
    public typealias Colour = KnownNameColour.Lit
    public typealias Luminance = YKnownNameDark
}

public enum DrawingRole17: Close {}
extension DrawingRole17 {
    public static var typeName: String { "surface-card" }
}

public enum YSurfaceCardLight: DrawingLuminance {
    public typealias Value = SurfaceCardLitY
    public typealias Colour = SurfaceCardColour.Lit
    public typealias Projection = XYZRatioWrite<Never, SurfaceCardLitY, Never, CoordinateScale>
}

public enum BindSurfaceCardLight: DrawingBinding {
    public typealias Role = DrawingRole17
    public typealias Theme = DrawingLight
    public typealias Colour = SurfaceCardColour.Lit
    public typealias Luminance = YSurfaceCardLight
}

public enum YSurfaceCardDark: DrawingLuminance {
    public typealias Value = SurfaceCardDimY
    public typealias Colour = SurfaceCardColour.Dim
    public typealias Projection = XYZRatioWrite<Never, SurfaceCardDimY, Never, CoordinateScale>
}

public enum BindSurfaceCardDark: DrawingBinding {
    public typealias Role = DrawingRole17
    public typealias Theme = DrawingDark
    public typealias Colour = SurfaceCardColour.Dim
    public typealias Luminance = YSurfaceCardDark
}

public enum DrawingRole18: Close {}
extension DrawingRole18 {
    public static var typeName: String { "surface-track" }
}

public enum YSurfaceTrackLight: DrawingLuminance {
    public typealias Value = SurfaceTrackLitY
    public typealias Colour = SurfaceTrackColour.Lit
    public typealias Projection = XYZRatioWrite<Never, SurfaceTrackLitY, Never, CoordinateScale>
}

public enum BindSurfaceTrackLight: DrawingBinding {
    public typealias Role = DrawingRole18
    public typealias Theme = DrawingLight
    public typealias Colour = SurfaceTrackColour.Lit
    public typealias Luminance = YSurfaceTrackLight
}

public enum YSurfaceTrackDark: DrawingLuminance {
    public typealias Value = SurfaceTrackDimY
    public typealias Colour = SurfaceTrackColour.Dim
    public typealias Projection = XYZRatioWrite<Never, SurfaceTrackDimY, Never, CoordinateScale>
}

public enum BindSurfaceTrackDark: DrawingBinding {
    public typealias Role = DrawingRole18
    public typealias Theme = DrawingDark
    public typealias Colour = SurfaceTrackColour.Dim
    public typealias Luminance = YSurfaceTrackDark
}

public enum ReadTextOnPaper: DrawingLegible {
    public typealias Theme = DrawingLight
    public typealias Foreground = BindTextLight
    public typealias Background = BindPaperLight
    public typealias Witness = ReferenceTextOnPaper
}

public enum ReadTextOnMist: DrawingLegible {
    public typealias Theme = DrawingLight
    public typealias Foreground = BindTextLight
    public typealias Background = BindMistLight
    public typealias Witness = ReferenceTextOnMist
}

public enum ReadMutedOnPaper: DrawingLegible {
    public typealias Theme = DrawingLight
    public typealias Foreground = BindMutedLight
    public typealias Background = BindPaperLight
    public typealias Witness = ReferenceMutedOnPaper
}

public enum ReadMutedOnMist: DrawingLegible {
    public typealias Theme = DrawingLight
    public typealias Foreground = BindMutedLight
    public typealias Background = BindMistLight
    public typealias Witness = ReferenceMutedOnMist
}

public enum ReadInkOnAccent: DrawingLegible {
    public typealias Theme = DrawingLight
    public typealias Foreground = BindInkLight
    public typealias Background = BindAccentLight
    public typealias Witness = ReferenceInkOnAccent
}

public enum ReadActionOnPaper: DrawingLegible {
    public typealias Theme = DrawingLight
    public typealias Foreground = BindActionLight
    public typealias Background = BindPaperLight
    public typealias Witness = ReferenceActionOnPaper
}

public enum ReadRefusalOnPaper: DrawingLegible {
    public typealias Theme = DrawingLight
    public typealias Foreground = BindRefusalLight
    public typealias Background = BindPaperLight
    public typealias Witness = ReferenceRefusalOnPaper
}

public enum ReadLawOnPaper: DrawingLegible {
    public typealias Theme = DrawingLight
    public typealias Foreground = BindLawLight
    public typealias Background = BindPaperLight
    public typealias Witness = ReferenceLawOnPaper
}

public enum ReadOkOnPaper: DrawingLegible {
    public typealias Theme = DrawingLight
    public typealias Foreground = BindOkLight
    public typealias Background = BindPaperLight
    public typealias Witness = ReferenceOkOnPaper
}

public enum ReadKeywordOnPaper: DrawingLegible {
    public typealias Theme = DrawingLight
    public typealias Foreground = BindKeywordLight
    public typealias Background = BindPaperLight
    public typealias Witness = ReferenceKeywordOnPaper
}

public enum ReadLiteralOnPaper: DrawingLegible {
    public typealias Theme = DrawingLight
    public typealias Foreground = BindLiteralLight
    public typealias Background = BindPaperLight
    public typealias Witness = ReferenceLiteralOnPaper
}

public enum ReadCommentOnPaper: DrawingLegible {
    public typealias Theme = DrawingLight
    public typealias Foreground = BindCommentLight
    public typealias Background = BindPaperLight
    public typealias Witness = ReferenceCommentOnPaper
}

public enum ReadAttributeOnPaper: DrawingLegible {
    public typealias Theme = DrawingLight
    public typealias Foreground = BindAttributeLight
    public typealias Background = BindPaperLight
    public typealias Witness = ReferenceAttributeOnPaper
}

public enum ReadLocalTypeOnPaper: DrawingLegible {
    public typealias Theme = DrawingLight
    public typealias Foreground = BindLocalTypeLight
    public typealias Background = BindPaperLight
    public typealias Witness = ReferenceLocalTypeOnPaper
}

public enum ReadKnownNameOnPaper: DrawingLegible {
    public typealias Theme = DrawingLight
    public typealias Foreground = BindKnownNameLight
    public typealias Background = BindPaperLight
    public typealias Witness = ReferenceKnownNameOnPaper
}

public enum ReadTextOnSurfaceCardDim: DrawingLegible {
    public typealias Theme = DrawingDark
    public typealias Foreground = BindTextDark
    public typealias Background = BindSurfaceCardDark
    public typealias Witness = ReferenceTextOnSurfaceCardDim
}

public enum ReadMutedOnSurfaceCardDim: DrawingLegible {
    public typealias Theme = DrawingDark
    public typealias Foreground = BindMutedDark
    public typealias Background = BindSurfaceCardDark
    public typealias Witness = ReferenceMutedOnSurfaceCardDim
}

// A reference names the original reading; it does not instantiate it again.
public enum ReferenceTextOnPaper: Close {}
extension ReferenceTextOnPaper {
    public static var typeName: String { "ThePalette::TextOnPaper" }
}
public enum ReferenceTextOnMist: Close {}
extension ReferenceTextOnMist {
    public static var typeName: String { "ThePalette::TextOnMist" }
}
public enum ReferenceMutedOnPaper: Close {}
extension ReferenceMutedOnPaper {
    public static var typeName: String { "ThePalette::MutedOnPaper" }
}
public enum ReferenceMutedOnMist: Close {}
extension ReferenceMutedOnMist {
    public static var typeName: String { "ThePalette::MutedOnMist" }
}
public enum ReferenceInkOnAccent: Close {}
extension ReferenceInkOnAccent {
    public static var typeName: String { "ThePalette::InkOnAccent" }
}
public enum ReferenceActionOnPaper: Close {}
extension ReferenceActionOnPaper {
    public static var typeName: String { "ThePalette::ActionOnPaper" }
}
public enum ReferenceRefusalOnPaper: Close {}
extension ReferenceRefusalOnPaper {
    public static var typeName: String { "ThePalette::RefusalOnPaper" }
}
public enum ReferenceLawOnPaper: Close {}
extension ReferenceLawOnPaper {
    public static var typeName: String { "ThePalette::LawOnPaper" }
}
public enum ReferenceOkOnPaper: Close {}
extension ReferenceOkOnPaper {
    public static var typeName: String { "ThePalette::OkOnPaper" }
}
public enum ReferenceKeywordOnPaper: Close {}
extension ReferenceKeywordOnPaper {
    public static var typeName: String { "ThePalette::KeywordOnPaper" }
}
public enum ReferenceLiteralOnPaper: Close {}
extension ReferenceLiteralOnPaper {
    public static var typeName: String { "ThePalette::LiteralOnPaper" }
}
public enum ReferenceCommentOnPaper: Close {}
extension ReferenceCommentOnPaper {
    public static var typeName: String { "ThePalette::CommentOnPaper" }
}
public enum ReferenceAttributeOnPaper: Close {}
extension ReferenceAttributeOnPaper {
    public static var typeName: String { "ThePalette::AttributeOnPaper" }
}
public enum ReferenceLocalTypeOnPaper: Close {}
extension ReferenceLocalTypeOnPaper {
    public static var typeName: String { "ThePalette::LocalTypeOnPaper" }
}
public enum ReferenceKnownNameOnPaper: Close {}
extension ReferenceKnownNameOnPaper {
    public static var typeName: String { "ThePalette::KnownNameOnPaper" }
}
public enum ReferenceTextOnSurfaceCardDim: Close {}
extension ReferenceTextOnSurfaceCardDim {
    public static var typeName: String { "ThePalette::TextOnSurfaceCardDim" }
}
public enum ReferenceMutedOnSurfaceCardDim: Close {}
extension ReferenceMutedOnSurfaceCardDim {
    public static var typeName: String { "ThePalette::MutedOnSurfaceCardDim" }
}
