import VerificationIsIdentification
import DocumentKit

// THE SITE'S PALETTE, derived from light and held to a stated bound.
//
// The three signal colours stand on one rung of light: a refusal, a law and a
// success differ in hue and in nothing else, so none of them shouts louder than
// the others. The editor's tokens keep their own rungs, because a theme reads by
// weight as well as by hue, and a dark violet lifted to one rung leaves the
// screen's cone and comes back clipped: that limit is the monitor's, not this
// file's.
//
// A neutral is equal parts of the three lights, which is the screen's own
// white by construction, so every surface and every text on this page stands on
// one direction and no grey drifts warm while another drifts cool. Its rung is
// how much of that light stands there. A chromatic role is its own direction: a
// colour of the same hue but a different purity is not a scaling of another.
//
// A role is a mix of the screen's own three lights, and the levels of that mix
// are what this file states. The coordinates the browser reads fall out of the
// levels through the kit's own weights, so no colour here is copied from a
// device's spelling of it. A level is stated in thirty-seconds of a primary's
// full light. The output door divides by the stated coordinate scale.
// A level is never negative, so every colour here is one the screen can make.
//
// Two mounts, not two palettes: Lit is the theme the page wears, Dim the one
// the dark canvas wears, and a role that never dims states Lit alone.
//
// The contrast bound is the stated rational 4.5 to 1. Clearing its
// denominators on this page's scale gives 40 bright = 180 dark + 57344 + slack.
// Slack is a nonnegative count. Each Legible carries its count reading in R1,
// derived from that pair's own bright level, dark level and slack. The fixed
// coefficients are sums of doublings. The count court checks that equality
// and names a changed pair. Nominal equality and Swift conformance are separate.
// Checks/Playground/palette-count.py compares the numbers with the pinned page.

public typealias CoordinateScale = U32

public typealias ScreenLight<R: Structure, G: Structure, B: Structure> = XYZRatioWrite<
    PouredCoordinate<R, SRGBRedPrimary.XShare, G, SRGBGreenPrimary.XShare, B, SRGBBluePrimary.XShare>,
    PouredCoordinate<R, SRGBRedPrimary.YShare, G, SRGBGreenPrimary.YShare, B, SRGBBluePrimary.YShare>,
    PouredCoordinate<R, SRGBRedPrimary.ZShare, G, SRGBGreenPrimary.ZShare, B, SRGBBluePrimary.ZShare>, CoordinateScale>

// what the eye takes from a mix: the Y weights of the three primaries, in the
// same thirty-seconds the levels are stated in
public typealias Luminance<R: Structure, G: Structure, B: Structure> = Plus<Scale7<R>, Plus<Scale23<G>, Twice<B>>>

// Bright is the level itself. The reading presents the factor forty once here.
public enum Legible<Bright: Structure, Dark: Structure, Slack: Structure>: Close {
    public typealias R1 = ContrastCount<Scale40<Bright>, Dark, Slack>
}

public typealias Scale7<S: Structure> = Plus<S, Plus<Twice<S>, Twice<Twice<S>>>>
public typealias Scale16<S: Structure> = Twice<Twice<Twice<Twice<S>>>>
public typealias Scale23<S: Structure> = Plus<S, Plus<Twice<S>, Plus<Twice<Twice<S>>, Twice<Twice<Twice<Twice<S>>>>>>>
public typealias Scale40<S: Structure> = Plus<Twice<Twice<Twice<S>>>, Twice<Twice<Twice<Twice<Twice<S>>>>>>
public typealias Scale180<S: Structure> = Plus<Twice<Twice<S>>, Plus<Twice<Twice<Twice<Twice<S>>>>, Plus<Twice<Twice<Twice<Twice<Twice<S>>>>>, Twice<Twice<Twice<Twice<Twice<Twice<Twice<S>>>>>>>>>>
public typealias Scale512<S: Structure> = Twice<Twice<Twice<Twice<Twice<Twice<Twice<Twice<Twice<S>>>>>>>>>

public enum PaletteLight: Close {}
public enum PaletteContrastQuestion: Close {}
public enum UnaryArithmeticEncoding: Close {}
public enum ContrastCount<Bright: Structure, Dark: Structure, Slack: Structure>: PredicateReading {
    public typealias Left = Bright
    public typealias Right = Plus<Scale180<Dark>, Plus<Scale7<Scale16<U512>>, Slack>>
    public typealias Answer = Right
    public typealias Sigma = PaletteLight
    public typealias Encoding = UnaryArithmeticEncoding
    public typealias Predicate = PaletteContrastQuestion
}

public typealias PaperLitRed = U256
public typealias PaperLitGreen = U256
public typealias PaperLitBlue = U256
public typealias PaperLitY = Luminance<PaperLitRed, PaperLitGreen, PaperLitBlue>
public typealias PaperDimRed = U256
public typealias PaperDimGreen = U256
public typealias PaperDimBlue = U256
public typealias PaperDimY = Luminance<PaperDimRed, PaperDimGreen, PaperDimBlue>
public enum PaperColour: Close {
    public typealias Names = PaperNamesWord
    public typealias Lit = ScreenLight<PaperLitRed, PaperLitGreen, PaperLitBlue>
    public typealias Dim = ScreenLight<PaperDimRed, PaperDimGreen, PaperDimBlue>
}
public enum PaperNamesWord: Close {}
extension PaperNamesWord {
    public static var typeName: String { "paper vi-on-action" }
}

public typealias MistLitRed = Plus<U128, Plus<U64, Plus<U32, Plus<U8, Plus<U4, U2>>>>>
public typealias MistLitGreen = Plus<U128, Plus<U64, Plus<U32, Plus<U8, Plus<U4, U2>>>>>
public typealias MistLitBlue = Plus<U128, Plus<U64, Plus<U32, Plus<U8, Plus<U4, U2>>>>>
public typealias MistLitY = Luminance<MistLitRed, MistLitGreen, MistLitBlue>
public enum MistColour: Close {
    public typealias Names = MistNamesWord
    public typealias Lit = ScreenLight<MistLitRed, MistLitGreen, MistLitBlue>
}
public enum MistNamesWord: Close {}
extension MistNamesWord {
    public static var typeName: String { "mist" }
}

public typealias InkLitRed = Plus<U2, U1>
public typealias InkLitGreen = Plus<U2, U1>
public typealias InkLitBlue = Plus<U2, U1>
public typealias InkLitY = Luminance<InkLitRed, InkLitGreen, InkLitBlue>
public typealias InkDimRed = Plus<U2, U1>
public typealias InkDimGreen = Plus<U2, U1>
public typealias InkDimBlue = Plus<U2, U1>
public typealias InkDimY = Luminance<InkDimRed, InkDimGreen, InkDimBlue>
public enum InkColour: Close {
    public typealias Names = InkNamesWord
    public typealias Lit = ScreenLight<InkLitRed, InkLitGreen, InkLitBlue>
    public typealias Dim = ScreenLight<InkDimRed, InkDimGreen, InkDimBlue>
}
public enum InkNamesWord: Close {}
extension InkNamesWord {
    public static var typeName: String { "ink vi-on-accent" }
}

public typealias TextLitRed = U8
public typealias TextLitGreen = U8
public typealias TextLitBlue = U8
public typealias TextLitY = Luminance<TextLitRed, TextLitGreen, TextLitBlue>
public typealias TextDimRed = Plus<U128, Plus<U64, U4>>
public typealias TextDimGreen = Plus<U128, Plus<U64, U4>>
public typealias TextDimBlue = Plus<U128, Plus<U64, U4>>
public typealias TextDimY = Luminance<TextDimRed, TextDimGreen, TextDimBlue>
public enum TextColour: Close {
    public typealias Names = TextNamesWord
    public typealias Lit = ScreenLight<TextLitRed, TextLitGreen, TextLitBlue>
    public typealias Dim = ScreenLight<TextDimRed, TextDimGreen, TextDimBlue>
}
public enum TextNamesWord: Close {}
extension TextNamesWord {
    public static var typeName: String { "text vi-text-primary" }
}

public typealias MutedLitRed = Plus<U32, Plus<U8, U2>>
public typealias MutedLitGreen = Plus<U32, Plus<U8, U2>>
public typealias MutedLitBlue = Plus<U32, Plus<U8, U2>>
public typealias MutedLitY = Luminance<MutedLitRed, MutedLitGreen, MutedLitBlue>
public typealias MutedDimRed = Plus<U64, Plus<U32, Plus<U4, Plus<U2, U1>>>>
public typealias MutedDimGreen = Plus<U64, Plus<U32, Plus<U4, Plus<U2, U1>>>>
public typealias MutedDimBlue = Plus<U64, Plus<U32, Plus<U4, Plus<U2, U1>>>>
public typealias MutedDimY = Luminance<MutedDimRed, MutedDimGreen, MutedDimBlue>
public enum MutedColour: Close {
    public typealias Names = MutedNamesWord
    public typealias Lit = ScreenLight<MutedLitRed, MutedLitGreen, MutedLitBlue>
    public typealias Dim = ScreenLight<MutedDimRed, MutedDimGreen, MutedDimBlue>
}
public enum MutedNamesWord: Close {}
extension MutedNamesWord {
    public static var typeName: String { "muted vi-text-secondary" }
}

public typealias LineLitRed = Plus<U128, Plus<U64, Plus<U16, Plus<U4, U2>>>>
public typealias LineLitGreen = Plus<U128, Plus<U64, Plus<U16, Plus<U4, U2>>>>
public typealias LineLitBlue = Plus<U128, Plus<U64, Plus<U16, Plus<U4, U2>>>>
public typealias LineLitY = Luminance<LineLitRed, LineLitGreen, LineLitBlue>
public typealias LineDimRed = Plus<U8, Plus<U2, U1>>
public typealias LineDimGreen = Plus<U8, Plus<U2, U1>>
public typealias LineDimBlue = Plus<U8, Plus<U2, U1>>
public typealias LineDimY = Luminance<LineDimRed, LineDimGreen, LineDimBlue>
public enum LineColour: Close {
    public typealias Names = LineNamesWord
    public typealias Lit = ScreenLight<LineLitRed, LineLitGreen, LineLitBlue>
    public typealias Dim = ScreenLight<LineDimRed, LineDimGreen, LineDimBlue>
}
public enum LineNamesWord: Close {}
extension LineNamesWord {
    public static var typeName: String { "line vi-line" }
}

public typealias AccentLitRed = Plus<U256, Plus<U16, Plus<U2, U1>>>
public typealias AccentLitGreen = Plus<U128, Plus<U32, Plus<U16, U1>>>
public typealias AccentLitBlue = Plus<U2, U1>
public typealias AccentLitY = Luminance<AccentLitRed, AccentLitGreen, AccentLitBlue>
public typealias AccentDimRed = Plus<U256, Plus<U16, Plus<U2, U1>>>
public typealias AccentDimGreen = Plus<U128, Plus<U32, Plus<U16, U1>>>
public typealias AccentDimBlue = Plus<U2, U1>
public typealias AccentDimY = Luminance<AccentDimRed, AccentDimGreen, AccentDimBlue>
public enum AccentColour: Close {
    public typealias Names = AccentNamesWord
    public typealias Lit = ScreenLight<AccentLitRed, AccentLitGreen, AccentLitBlue>
    public typealias Dim = ScreenLight<AccentDimRed, AccentDimGreen, AccentDimBlue>
}
public enum AccentNamesWord: Close {}
extension AccentNamesWord {
    public static var typeName: String { "vi-accent" }
}

public typealias ActionLitRed = Never
public typealias ActionLitGreen = Plus<U32, Plus<U8, Plus<U4, U2>>>
public typealias ActionLitBlue = Plus<U128, Plus<U64, Plus<U16, Plus<U8, Plus<U2, U1>>>>>
public typealias ActionLitY = Luminance<ActionLitRed, ActionLitGreen, ActionLitBlue>
public typealias ActionDimRed = Plus<U8, Plus<U4, U1>>
public typealias ActionDimGreen = Plus<U32, Plus<U8, Plus<U4, U2>>>
public typealias ActionDimBlue = Plus<U128, Plus<U32, U1>>
public typealias ActionDimY = Luminance<ActionDimRed, ActionDimGreen, ActionDimBlue>
public enum ActionColour: Close {
    public typealias Names = ActionNamesWord
    public typealias Lit = ScreenLight<ActionLitRed, ActionLitGreen, ActionLitBlue>
    public typealias Dim = ScreenLight<ActionDimRed, ActionDimGreen, ActionDimBlue>
}
public enum ActionNamesWord: Close {}
extension ActionNamesWord {
    public static var typeName: String { "action vi-action" }
}

public typealias RefusalLitRed = Plus<U128, Plus<U16, Plus<U8, U2>>>
public typealias RefusalLitGreen = Plus<U8, Plus<U4, U2>>
public typealias RefusalLitBlue = Plus<U8, U2>
public typealias RefusalLitY = Luminance<RefusalLitRed, RefusalLitGreen, RefusalLitBlue>
public enum RefusalColour: Close {
    public typealias Names = RefusalNamesWord
    public typealias Lit = ScreenLight<RefusalLitRed, RefusalLitGreen, RefusalLitBlue>
}
public enum RefusalNamesWord: Close {}
extension RefusalNamesWord {
    public static var typeName: String { "refusal" }
}

public typealias LawLitRed = Plus<U128, Plus<U4, U1>>
public typealias LawLitGreen = Plus<U16, U4>
public typealias LawLitBlue = Never
public typealias LawLitY = Luminance<LawLitRed, LawLitGreen, LawLitBlue>
public enum LawColour: Close {
    public typealias Names = LawNamesWord
    public typealias Lit = ScreenLight<LawLitRed, LawLitGreen, LawLitBlue>
}
public enum LawNamesWord: Close {}
extension LawNamesWord {
    public static var typeName: String { "law" }
}

public typealias OkLitRed = U8
public typealias OkLitGreen = Plus<U32, Plus<U16, Plus<U8, U2>>>
public typealias OkLitBlue = Plus<U8, Plus<U2, U1>>
public typealias OkLitY = Luminance<OkLitRed, OkLitGreen, OkLitBlue>
public enum OkColour: Close {
    public typealias Names = OkNamesWord
    public typealias Lit = ScreenLight<OkLitRed, OkLitGreen, OkLitBlue>
}
public enum OkNamesWord: Close {}
extension OkNamesWord {
    public static var typeName: String { "ok" }
}

public typealias KeywordLitRed = Plus<U64, Plus<U16, U4>>
public typealias KeywordLitGreen = Plus<U4, U1>
public typealias KeywordLitBlue = Plus<U64, Plus<U8, Plus<U2, U1>>>
public typealias KeywordLitY = Luminance<KeywordLitRed, KeywordLitGreen, KeywordLitBlue>
public enum KeywordColour: Close {
    public typealias Names = KeywordNamesWord
    public typealias Lit = ScreenLight<KeywordLitRed, KeywordLitGreen, KeywordLitBlue>
}
public enum KeywordNamesWord: Close {}
extension KeywordNamesWord {
    public static var typeName: String { "keyword" }
}

public typealias LiteralLitRed = Plus<U128, Plus<U16, U2>>
public typealias LiteralLitGreen = Never
public typealias LiteralLitBlue = Never
public typealias LiteralLitY = Luminance<LiteralLitRed, LiteralLitGreen, LiteralLitBlue>
public enum LiteralColour: Close {
    public typealias Names = LiteralNamesWord
    public typealias Lit = ScreenLight<LiteralLitRed, LiteralLitGreen, LiteralLitBlue>
}
public enum LiteralNamesWord: Close {}
extension LiteralNamesWord {
    public static var typeName: String { "literal" }
}

public typealias CommentLitRed = Plus<U16, Plus<U8, Plus<U4, U1>>>
public typealias CommentLitGreen = Plus<U32, Plus<U4, U2>>
public typealias CommentLitBlue = Plus<U32, Plus<U16, U1>>
public typealias CommentLitY = Luminance<CommentLitRed, CommentLitGreen, CommentLitBlue>
public enum CommentColour: Close {
    public typealias Names = CommentNamesWord
    public typealias Lit = ScreenLight<CommentLitRed, CommentLitGreen, CommentLitBlue>
}
public enum CommentNamesWord: Close {}
extension CommentNamesWord {
    public static var typeName: String { "comment" }
}

public typealias AttributeLitRed = Plus<U64, Plus<U16, U1>>
public typealias AttributeLitGreen = Plus<U32, U8>
public typealias AttributeLitBlue = Never
public typealias AttributeLitY = Luminance<AttributeLitRed, AttributeLitGreen, AttributeLitBlue>
public enum AttributeColour: Close {
    public typealias Names = AttributeNamesWord
    public typealias Lit = ScreenLight<AttributeLitRed, AttributeLitGreen, AttributeLitBlue>
}
public enum AttributeNamesWord: Close {}
extension AttributeNamesWord {
    public static var typeName: String { "attribute" }
}

public typealias LocalTypeLitRed = Never
public typealias LocalTypeLitGreen = Plus<U16, Plus<U4, U1>>
public typealias LocalTypeLitBlue = Plus<U32, Plus<U16, U1>>
public typealias LocalTypeLitY = Luminance<LocalTypeLitRed, LocalTypeLitGreen, LocalTypeLitBlue>
public enum LocalTypeColour: Close {
    public typealias Names = LocalTypeNamesWord
    public typealias Lit = ScreenLight<LocalTypeLitRed, LocalTypeLitGreen, LocalTypeLitBlue>
}
public enum LocalTypeNamesWord: Close {}
extension LocalTypeNamesWord {
    public static var typeName: String { "localtype" }
}

public typealias KnownNameLitRed = Plus<U4, Plus<U2, U1>>
public typealias KnownNameLitGreen = U2
public typealias KnownNameLitBlue = Plus<U64, Plus<U16, Plus<U8, Plus<U2, U1>>>>
public typealias KnownNameLitY = Luminance<KnownNameLitRed, KnownNameLitGreen, KnownNameLitBlue>
public enum KnownNameColour: Close {
    public typealias Names = KnownNameNamesWord
    public typealias Lit = ScreenLight<KnownNameLitRed, KnownNameLitGreen, KnownNameLitBlue>
}
public enum KnownNameNamesWord: Close {}
extension KnownNameNamesWord {
    public static var typeName: String { "knownname" }
}

public typealias BackdropLitRed = U1
public typealias BackdropLitGreen = U1
public typealias BackdropLitBlue = U1
public typealias BackdropLitY = Luminance<BackdropLitRed, BackdropLitGreen, BackdropLitBlue>
public enum BackdropColour: Close {
    public typealias Names = BackdropNamesWord
    public typealias Lit = ScreenLight<BackdropLitRed, BackdropLitGreen, BackdropLitBlue>
}
public enum BackdropNamesWord: Close {}
extension BackdropNamesWord {
    public static var typeName: String { "backdrop" }
}

public typealias SurfaceCardLitRed = U256
public typealias SurfaceCardLitGreen = U256
public typealias SurfaceCardLitBlue = U256
public typealias SurfaceCardLitY = Luminance<SurfaceCardLitRed, SurfaceCardLitGreen, SurfaceCardLitBlue>
public typealias SurfaceCardDimRed = Plus<U2, U1>
public typealias SurfaceCardDimGreen = Plus<U2, U1>
public typealias SurfaceCardDimBlue = Plus<U2, U1>
public typealias SurfaceCardDimY = Luminance<SurfaceCardDimRed, SurfaceCardDimGreen, SurfaceCardDimBlue>
public enum SurfaceCardColour: Close {
    public typealias Names = SurfaceCardNamesWord
    public typealias Lit = ScreenLight<SurfaceCardLitRed, SurfaceCardLitGreen, SurfaceCardLitBlue>
    public typealias Dim = ScreenLight<SurfaceCardDimRed, SurfaceCardDimGreen, SurfaceCardDimBlue>
}
public enum SurfaceCardNamesWord: Close {}
extension SurfaceCardNamesWord {
    public static var typeName: String { "vi-surface-card" }
}

public typealias SurfaceTrackLitRed = U1
public typealias SurfaceTrackLitGreen = U1
public typealias SurfaceTrackLitBlue = U1
public typealias SurfaceTrackLitY = Luminance<SurfaceTrackLitRed, SurfaceTrackLitGreen, SurfaceTrackLitBlue>
public typealias SurfaceTrackDimRed = Plus<U8, Plus<U2, U1>>
public typealias SurfaceTrackDimGreen = Plus<U8, Plus<U2, U1>>
public typealias SurfaceTrackDimBlue = Plus<U8, Plus<U2, U1>>
public typealias SurfaceTrackDimY = Luminance<SurfaceTrackDimRed, SurfaceTrackDimGreen, SurfaceTrackDimBlue>
public enum SurfaceTrackColour: Close {
    public typealias Names = SurfaceTrackNamesWord
    public typealias Lit = ScreenLight<SurfaceTrackLitRed, SurfaceTrackLitGreen, SurfaceTrackLitBlue>
    public typealias Dim = ScreenLight<SurfaceTrackDimRed, SurfaceTrackDimGreen, SurfaceTrackDimBlue>
}
public enum SurfaceTrackNamesWord: Close {}
extension SurfaceTrackNamesWord {
    public static var typeName: String { "vi-surface-track" }
}

// every pair a reader actually meets, each with the slack that proves it
public typealias TextOnPaperSlack = Plus<Scale512<Plus<U256, Plus<U128, Plus<U32, Plus<U16, Plus<U4, U2>>>>>>, Never>
public typealias TextOnPaper = Legible<PaperLitY, TextLitY, TextOnPaperSlack>
public typealias TextOnMistSlack = Plus<Scale512<Plus<U256, Plus<U128, Plus<U8, U1>>>>, Never>
public typealias TextOnMist = Legible<MistLitY, TextLitY, TextOnMistSlack>
public typealias MutedOnPaperSlack = Plus<Scale512<Plus<U32, Plus<U16, Plus<U4, Plus<U2, U1>>>>>, U256>
public typealias MutedOnPaper = Legible<PaperLitY, MutedLitY, MutedOnPaperSlack>
public typealias MutedOnMistSlack = Plus<Scale512<Plus<U8, U2>>, U256>
public typealias MutedOnMist = Legible<MistLitY, MutedLitY, MutedOnMistSlack>
public typealias InkOnAccentSlack = Plus<Scale512<Plus<U256, Plus<U64, Plus<U2, U1>>>>, Plus<U64, U16>>
public typealias InkOnAccent = Legible<AccentLitY, InkLitY, InkOnAccentSlack>
public typealias ActionOnPaperSlack = Plus<Scale512<U2>, U32>
public typealias ActionOnPaper = Legible<PaperLitY, ActionLitY, ActionOnPaperSlack>
public typealias RefusalOnPaperSlack = Plus<Scale512<Plus<U16, Plus<U8, U4>>>, Plus<U256, Plus<U128, U16>>>
public typealias RefusalOnPaper = Legible<PaperLitY, RefusalLitY, RefusalOnPaperSlack>
public typealias LawOnPaperSlack = Plus<Scale512<Plus<U32, Plus<U4, U2>>>, Plus<U256, Plus<U128, Plus<U64, Plus<U32, Plus<U16, U4>>>>>>
public typealias LawOnPaper = Legible<PaperLitY, LawLitY, LawOnPaperSlack>
public typealias OkOnPaperSlack = Plus<Scale512<Plus<U16, Plus<U8, Plus<U4, Plus<U2, U1>>>>>, Plus<U256, Plus<U32, U16>>>
public typealias OkOnPaper = Legible<PaperLitY, OkLitY, OkOnPaperSlack>
public typealias KeywordOnPaperSlack = Plus<Scale512<Plus<U128, Plus<U64, Plus<U32, U4>>>>, Plus<U32, Plus<U16, Plus<U8, U4>>>>
public typealias KeywordOnPaper = Legible<PaperLitY, KeywordLitY, KeywordOnPaperSlack>
public typealias LiteralOnPaperSlack = Plus<Scale512<Plus<U128, Plus<U32, U8>>>, Plus<U256, Plus<U64, Plus<U32, U8>>>>
public typealias LiteralOnPaper = Legible<PaperLitY, LiteralLitY, LiteralOnPaperSlack>
public typealias CommentOnPaperSlack = Plus<Scale512<Plus<U64, Plus<U32, Plus<U16, U2>>>>, Plus<U256, Plus<U128, Plus<U64, Plus<U16, U4>>>>>
public typealias CommentOnPaper = Legible<PaperLitY, CommentLitY, CommentOnPaperSlack>
public typealias AttributeOnPaperSlack = Plus<Scale512<Plus<U4, U1>>, Plus<U64, Plus<U32, Plus<U16, U4>>>>
public typealias AttributeOnPaper = Legible<PaperLitY, AttributeLitY, AttributeOnPaperSlack>
public typealias LocalTypeOnPaperSlack = Plus<Scale512<Plus<U256, Plus<U64, Plus<U2, U1>>>>, Plus<U256, Plus<U64, Plus<U32, Plus<U16, Plus<U8, U4>>>>>>
public typealias LocalTypeOnPaper = Legible<PaperLitY, LocalTypeLitY, LocalTypeOnPaperSlack>
public typealias KnownNameOnPaperSlack = Plus<Scale512<Plus<U256, Plus<U128, Plus<U32, Plus<U8, Plus<U4, U2>>>>>>, Plus<U256, Plus<U32, Plus<U16, Plus<U8, U4>>>>>
public typealias KnownNameOnPaper = Legible<PaperLitY, KnownNameLitY, KnownNameOnPaperSlack>
public typealias TextOnSurfaceCardDimSlack = Plus<Scale512<Plus<U256, Plus<U64, Plus<U16, U8>>>>, U128>
public typealias TextOnSurfaceCardDim = Legible<TextDimY, SurfaceCardDimY, TextOnSurfaceCardDimSlack>
public typealias MutedOnSurfaceCardDimSlack = Plus<Scale512<Plus<U64, Plus<U32, Plus<U8, Plus<U4, Plus<U2, U1>>>>>>, Plus<U256, U128>>
public typealias MutedOnSurfaceCardDim = Legible<MutedDimY, SurfaceCardDimY, MutedOnSurfaceCardDimSlack>
