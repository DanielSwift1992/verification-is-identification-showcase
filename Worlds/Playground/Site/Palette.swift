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
// full light, five halvings of a unit, and the depth is stated once below.
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

public typealias Step = Half<Half<Half<Half<Half<Unit>>>>>

public typealias ScreenLight<R: Structure, G: Structure, B: Structure> = XYZWrite<
    PouredCoordinate<Times<R, Step>, SRGBRedPrimary.XShare, Times<G, Step>, SRGBGreenPrimary.XShare, Times<B, Step>, SRGBBluePrimary.XShare>,
    PouredCoordinate<Times<R, Step>, SRGBRedPrimary.YShare, Times<G, Step>, SRGBGreenPrimary.YShare, Times<B, Step>, SRGBBluePrimary.YShare>,
    PouredCoordinate<Times<R, Step>, SRGBRedPrimary.ZShare, Times<G, Step>, SRGBGreenPrimary.ZShare, Times<B, Step>, SRGBBluePrimary.ZShare>>

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

public typealias SurfaceTrackLitRed = Plus<U128, Plus<U64, Plus<U32, Plus<U8, Plus<U4, U2>>>>>
public typealias SurfaceTrackLitGreen = Plus<U128, Plus<U64, Plus<U32, Plus<U8, Plus<U4, U2>>>>>
public typealias SurfaceTrackLitBlue = Plus<U128, Plus<U64, Plus<U32, Plus<U8, Plus<U4, U2>>>>>
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
    public typealias Projection = Step
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
    public typealias Projection = Step
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
    public typealias Projection = Step
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
    public typealias Projection = Step
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
    public typealias Projection = Step
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
    public typealias Projection = Step
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
    public typealias Projection = Step
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
    public typealias Projection = Step
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
    public typealias Projection = Step
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
    public typealias Projection = Step
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
    public typealias Projection = Step
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
    public typealias Projection = Step
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
    public typealias Projection = Step
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
    public typealias Projection = Step
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
    public typealias Projection = Step
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
    public typealias Projection = Step
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
    public typealias Projection = Step
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
    public typealias Projection = Step
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
    public typealias Projection = Step
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
    public typealias Projection = Step
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
    public typealias Projection = Step
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
    public typealias Projection = Step
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
    public typealias Projection = Step
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
    public typealias Projection = Step
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
    public typealias Projection = Step
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
    public typealias Projection = Step
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
    public typealias Projection = Step
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
    public typealias Projection = Step
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
    public typealias Projection = Step
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
    public typealias Projection = Step
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
    public typealias Projection = Step
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
    public typealias Projection = Step
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
    public typealias Projection = Step
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
    public typealias Projection = Step
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
    public typealias Projection = Step
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
    public typealias Projection = Step
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
    public typealias Projection = Step
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
    public typealias Projection = Step
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
