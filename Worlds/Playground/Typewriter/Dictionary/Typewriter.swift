import VerificationIsIdentification
import DocumentKit

// A typewriter: the sheet is drawn from this file, and the text on it is
// right here, as the literal inside Note's typeName. Typing appends one
// character to that literal; Backspace removes one; Escape clears it. This is
// the medium's prose genre: free text is in a literal slot, and the renderer draws
// it with no reader in between, and the judge vets the FORM of the file, never
// the words. The literal's alphabet is letters, digits, space, and .,!?- :
// everything that could escape the literal (quotes, slashes, angles) is
// outside it, refused by name, so the file survives every keystroke.
// Nothing of yours runs: a keystroke edits one literal on one line.
// Any enum whose extension states a one-line typeName literal is such a
// slot: declare one, and append presses it by name. The sheet's height is
// a type too: SheetTall counts the lines of the literal at this width.

// ── the note: the whole state of this world is the string below ──

public enum Note: Close {}
extension Note {
    public static var typeName: String { "" }
}

// ── the display strings ──

public typealias TypewriterParaWide = Plus<U256, Plus<U128, Plus<U64, U32>>>


public enum SheetTitle: Close {}
extension SheetTitle {
    public static var typeName: String { "A typewriter is a literal" }
}
public enum SheetSub: Close {}
extension SheetSub {
    public static var typeName: String { "Note is a quoted literal in Typewriter.swift. Open Full to edit its text." }
}
public enum SheetSubTwo: Close {}
extension SheetSubTwo {
    public static var typeName: String { "The bench draws the note and its keys; typing into the drawing is not available." }
}
public enum SheetSubThree: Close {}
extension SheetSubThree {
    public static var typeName: String { "Change the Note literal in Full; the renderer reads the new text." }
}
public enum SheetSubFour: Close {}
extension SheetSubFour {
    public static var typeName: String { "The renderer wraps the text, and the sheet's height is its line count." }
}
public enum TrySheet: Close {}
extension TrySheet {
    public static var typeName: String { "The renderer reports text it cannot draw. This is a limited reading, not Swift compilation." }
}
public enum TrySheetTwo: Close {}
extension TrySheetTwo {
    public static var typeName: String { "A single word wider than the sheet is refused: the renderer names it." }
}
public enum SheetAlt: Close {}
extension SheetAlt {
    public static var typeName: String { "A typed sheet of paper: the text on it is the Note literal of this file." }
}

// ── the faces: the sheet grows with its lines, the height is a type ──

public typealias SheetWide = Plus<U256, Plus<U128, Plus<U64, U32>>>
public typealias SheetTextWide = Plus<U256, Plus<U128, U64>>
public typealias SheetLines = LineTally<Note, SheetTextWide, TextL>
public typealias SheetTall = Plus<Times<SheetLines, Plus<U16, U4>>, Plus<U16, U8>>
public enum SheetFace: SpanTrackOutlined {
    public typealias H = Tally<SheetTall>
    public typealias Radius = R12
    public typealias Fill = SurfaceCard
    public typealias Stroke = LineRole
}
public enum SheetText: SpanLabelWrapped {
    public typealias Y = Tally<Plus<U16, U8>>
    public typealias LinePitch = Tally<Plus<U16, U4>>
    public typealias FillColor = TextPrimary
    public typealias Size = TextL
    public typealias Weight = WeightRegular
    public typealias Content = Note
}
public enum SheetTitleLabel: SpanLabel {
    public typealias Y = Under<U8, TitleT>
    public typealias FillColor = TextPrimary
    public typealias Size = TitleT
    public typealias Weight = WeightBold
    public typealias Content = SheetTitle
}
public enum SheetSubLabel: SpanLabelWrapped {
    public typealias Y = Tally<U16>
    public typealias LinePitch = Tally<Plus<U16, U4>>
    public typealias FillColor = TextSecondary
    public typealias Size = TextS
    public typealias Weight = WeightRegular
    public typealias Content = SheetSub
}
public enum SheetSubTwoLabel: SpanLabelWrapped {
    public typealias Y = Tally<U16>
    public typealias LinePitch = Tally<Plus<U16, U4>>
    public typealias FillColor = TextSecondary
    public typealias Size = TextS
    public typealias Weight = WeightRegular
    public typealias Content = SheetSubTwo
}
public enum SheetSubThreeLabel: SpanLabelWrapped {
    public typealias Y = Tally<U16>
    public typealias LinePitch = Tally<Plus<U16, U4>>
    public typealias FillColor = TextSecondary
    public typealias Size = TextS
    public typealias Weight = WeightRegular
    public typealias Content = SheetSubThree
}
public enum SheetSubFourLabel: SpanLabelWrapped {
    public typealias Y = Tally<U16>
    public typealias LinePitch = Tally<Plus<U16, U4>>
    public typealias FillColor = TextSecondary
    public typealias Size = TextS
    public typealias Weight = WeightRegular
    public typealias Content = SheetSubFour
}
public enum TrySheetLabel: SpanLabelWrapped {
    public typealias Y = Tally<U16>
    public typealias LinePitch = Tally<Plus<U16, U4>>
    public typealias FillColor = TextSecondary
    public typealias Size = TextXS
    public typealias Weight = WeightRegular
    public typealias Content = TrySheet
}
public enum TrySheetTwoLabel: SpanLabelWrapped {
    public typealias Y = Tally<U16>
    public typealias LinePitch = Tally<Plus<U16, U4>>
    public typealias FillColor = TextSecondary
    public typealias Size = TextXS
    public typealias Weight = WeightRegular
    public typealias Content = TrySheetTwo
}

// ── the rows ──

// The page speaks these geometry names; each expression has one home.
public typealias TypewriterSurface = U512
public typealias SheetSubTall = Times<LineTally<SheetSub, TypewriterParaWide, TextS>, Plus<U16, U4>>
public typealias SheetSubTwoTall = Times<LineTally<SheetSubTwo, TypewriterParaWide, TextS>, Plus<U16, U4>>
public typealias SheetSubThreeTall = Times<LineTally<SheetSubThree, TypewriterParaWide, TextS>, Plus<U16, U4>>
public typealias SheetSubFourTall = Times<LineTally<SheetSubFour, TypewriterParaWide, TextS>, Plus<U16, U4>>
public typealias TrySheetTall = Times<LineTally<TrySheet, TypewriterParaWide, TextXS>, Plus<U16, U4>>
public typealias TrySheetTwoTall = Times<LineTally<TrySheetTwo, TypewriterParaWide, TextXS>, Plus<U16, U4>>
