import VerificationIsIdentification
import DocumentKit

// Six questions, each a card: the question in bold, the answer wraps below.
// The card band is a Group of rows sharing one slot, like the Rules tab.
// Edit any answer string below: the page redraws it on the keystroke.

// ── the display strings ──

public enum FaqTitle: Close {}
extension FaqTitle {
    public static var typeName: String { "FAQ" }
}
public enum FaqSub: Close {}
extension FaqSub {
    public static var typeName: String { "six questions from this very file: edit any answer in the editor" }
}
public enum QOneWord: Close {}
extension QOneWord {
    public static var typeName: String { "Is this real Swift?" }
}
public enum QTwoWord: Close {}
extension QTwoWord {
    public static var typeName: String { "What runs when I type?" }
}
public enum QThreeWord: Close {}
extension QThreeWord {
    public static var typeName: String { "Why is it fast?" }
}
public enum QFourWord: Close {}
extension QFourWord {
    public static var typeName: String { "Who checks this checker?" }
}
public enum QFiveWord: Close {}
extension QFiveWord {
    public static var typeName: String { "What is the law?" }
}
public enum QSixWord: Close {}
extension QSixWord {
    public static var typeName: String { "What does the Table switch show?" }
}
public enum FaqAlt: Close {}
extension FaqAlt {
    public static var typeName: String { "Six question cards, answered from this same file." }
}

// ── the geometry ──

public typealias HeadTall = U64
public typealias InnerMargin = Plus<U16, U16>


public enum TitleLabel: SpanLabel {
    public typealias Y = Under<U8, TitleT>
    public typealias FillColor = TextPrimary
    public typealias Size = TitleT
    public typealias Weight = WeightBold
    public typealias Content = FaqTitle
}
public enum SubLabel: SpanLabel {
    public typealias Y = Under<Plus<U32, U8>, TextXS>
    public typealias FillColor = TextSecondary
    public typealias Size = TextXS
    public typealias Weight = WeightRegular
    public typealias Content = FaqSub
}
public enum QOneLabel: SpanLabel {
    public typealias Y = Under<Plus<U8, U2>, TextS>
    public typealias FillColor = TextPrimary
    public typealias Size = TextS
    public typealias Weight = WeightBold
    public typealias Content = QOneWord
}
public enum QTwoLabel: SpanLabel {
    public typealias Y = Under<Plus<U8, U2>, TextS>
    public typealias FillColor = TextPrimary
    public typealias Size = TextS
    public typealias Weight = WeightBold
    public typealias Content = QTwoWord
}
public enum QThreeLabel: SpanLabel {
    public typealias Y = Under<Plus<U8, U2>, TextS>
    public typealias FillColor = TextPrimary
    public typealias Size = TextS
    public typealias Weight = WeightBold
    public typealias Content = QThreeWord
}
public enum QFourLabel: SpanLabel {
    public typealias Y = Under<Plus<U8, U2>, TextS>
    public typealias FillColor = TextPrimary
    public typealias Size = TextS
    public typealias Weight = WeightBold
    public typealias Content = QFourWord
}
public enum QFiveLabel: SpanLabel {
    public typealias Y = Under<Plus<U8, U2>, TextS>
    public typealias FillColor = TextPrimary
    public typealias Size = TextS
    public typealias Weight = WeightBold
    public typealias Content = QFiveWord
}

// ── the rows: a shared card face, then each entry's inset text ──

public enum QSixLabel: SpanLabel {
    public typealias Y = Under<Plus<U8, U2>, TextS>
    public typealias FillColor = TextPrimary
    public typealias Size = TextS
    public typealias Weight = WeightBold
    public typealias Content = QSixWord
}

// ── the rows: a shared card face, then each entry's inset text ──

public typealias FaqTextWide = Plus<U256, Plus<U128, U32>>
public enum AOneParaWord: Close {}
extension AOneParaWord {
    public static var typeName: String { "Every tab here is a Swift file, in a stated subset of the language. Download one, and the theory’s repository compiles it: the verdicts are the same." }
}
public enum AOneParaText: SpanLabelWrapped {
    public typealias Y = Tally<Plus<U32, U8>>
    public typealias LinePitch = Tally<U16>
    public typealias FillColor = TextSecondary
    public typealias Size = TextXS
    public typealias Weight = WeightRegular
    public typealias Content = AOneParaWord
}
public typealias FaqOneTall = Plus<Times<LineTally<AOneParaWord, FaqTextWide, TextXS>, U16>, Plus<U32, U16>>
public enum FaqCardOne: SpanTrackOutlined {
    public typealias H = Tally<FaqOneTall>
    public typealias Radius = R12
    public typealias Fill = SurfaceCard
    public typealias Stroke = LineRole
}
public enum ATwoParaWord: Close {}
extension ATwoParaWord {
    public static var typeName: String { "One dictionary pass over the file, then one lookup per claim. No code of yours executes: there is no evaluator, only lookups in fixed tables." }
}
public enum ATwoParaText: SpanLabelWrapped {
    public typealias Y = Tally<Plus<U32, U8>>
    public typealias LinePitch = Tally<U16>
    public typealias FillColor = TextSecondary
    public typealias Size = TextXS
    public typealias Weight = WeightRegular
    public typealias Content = ATwoParaWord
}
public typealias FaqTwoTall = Plus<Times<LineTally<ATwoParaWord, FaqTextWide, TextXS>, U16>, Plus<U32, U16>>
public enum FaqCardTwo: SpanTrackOutlined {
    public typealias H = Tally<FaqTwoTall>
    public typealias Radius = R12
    public typealias Fill = SurfaceCard
    public typealias Stroke = LineRole
}
public enum AThreeParaWord: Close {}
extension AThreeParaWord {
    public static var typeName: String { "A verdict is a lookup, not a search: the judge builds the dictionary once per keystroke, and every claim after that is one read. The chart is in Read me." }
}
public enum AThreeParaText: SpanLabelWrapped {
    public typealias Y = Tally<Plus<U32, U8>>
    public typealias LinePitch = Tally<U16>
    public typealias FillColor = TextSecondary
    public typealias Size = TextXS
    public typealias Weight = WeightRegular
    public typealias Content = AThreeParaWord
}
public typealias FaqThreeTall = Plus<Times<LineTally<AThreeParaWord, FaqTextWide, TextXS>, U16>, Plus<U32, U16>>
public enum FaqCardThree: SpanTrackOutlined {
    public typealias H = Tally<FaqThreeTall>
    public typealias Radius = R12
    public typealias Fill = SurfaceCard
    public typealias Stroke = LineRole
}
public enum AFourParaWord: Close {}
extension AFourParaWord {
    public static var typeName: String { "Four verdicts recorded from the reference judge, a Swift program, re-run on every load. The badge counts the matches: 4/4 means this page’s verdicts match the reference." }
}
public enum AFourParaText: SpanLabelWrapped {
    public typealias Y = Tally<Plus<U32, U8>>
    public typealias LinePitch = Tally<U16>
    public typealias FillColor = TextSecondary
    public typealias Size = TextXS
    public typealias Weight = WeightRegular
    public typealias Content = AFourParaWord
}
public typealias FaqFourTall = Plus<Times<LineTally<AFourParaWord, FaqTextWide, TextXS>, U16>, Plus<U32, U16>>
public enum FaqCardFour: SpanTrackOutlined {
    public typealias H = Tally<FaqFourTall>
    public typealias Radius = R12
    public typealias Fill = SurfaceCard
    public typealias Stroke = LineRole
}
public enum AFiveParaWord: Close {}
extension AFiveParaWord {
    public static var typeName: String { "Rule 0 of the linter: a file declares types and nothing that runs. func, var, let, and init are refused, each with its own line number." }
}
public enum AFiveParaText: SpanLabelWrapped {
    public typealias Y = Tally<Plus<U32, U8>>
    public typealias LinePitch = Tally<U16>
    public typealias FillColor = TextSecondary
    public typealias Size = TextXS
    public typealias Weight = WeightRegular
    public typealias Content = AFiveParaWord
}
public typealias FaqFiveTall = Plus<Times<LineTally<AFiveParaWord, FaqTextWide, TextXS>, U16>, Plus<U32, U16>>
public enum FaqCardFive: SpanTrackOutlined {
    public typealias H = Tally<FaqFiveTall>
    public typealias Radius = R12
    public typealias Fill = SurfaceCard
    public typealias Stroke = LineRole
}
public enum ASixParaWord: Close {}
extension ASixParaWord {
    public static var typeName: String { "The same file, read as rows: one row per declaration, one column per axis. Nothing is stored: the table cannot differ from the file. Click a name: the editor opens its line." }
}
public enum ASixParaText: SpanLabelWrapped {
    public typealias Y = Tally<Plus<U32, U8>>
    public typealias LinePitch = Tally<U16>
    public typealias FillColor = TextSecondary
    public typealias Size = TextXS
    public typealias Weight = WeightRegular
    public typealias Content = ASixParaWord
}
public typealias FaqSixTall = Plus<Times<LineTally<ASixParaWord, FaqTextWide, TextXS>, U16>, Plus<U32, U16>>
public enum FaqCardSix: SpanTrackOutlined {
    public typealias H = Tally<FaqSixTall>
    public typealias Radius = R12
    public typealias Fill = SurfaceCard
    public typealias Stroke = LineRole
}

// The page speaks these geometry names; each expression has one home.
public typealias FAQSurface = U512
