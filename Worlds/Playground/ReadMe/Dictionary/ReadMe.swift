import VerificationIsIdentification
import DocumentKit

// The introduction is a Swift file like every other tab: the page draws its own
// manual. Edit any string below: the preview follows on the keystroke.

// ── the display strings ──

public enum IntroTitle: Close {}
extension IntroTitle {
    public static var typeName: String { "The playground" }
}
public enum CurveHeadWord: Close {}
extension CurveHeadWord {
    public static var typeName: String { "One company, two checkers" }
}
public enum BuildLegend: Close {}
extension BuildLegend {
    public static var typeName: String { "swift build, the full package" }
}
public enum JudgeLegend: Close {}
extension JudgeLegend {
    public static var typeName: String { "the judge, the same company file" }
}
public enum N3200Word: Close {}
extension N3200Word {
    public static var typeName: String { "N = 3 200" }
}
public enum N6400Word: Close {}
extension N6400Word {
    public static var typeName: String { "N = 6 400" }
}
public enum N12800Word: Close {}
extension N12800Word {
    public static var typeName: String { "N = 12 800" }
}
public enum Build3200Word: Close {}
extension Build3200Word {
    public static var typeName: String { "34 s" }
}
public enum Build6400Word: Close {}
extension Build6400Word {
    public static var typeName: String { "82 s" }
}
public enum Build12800Word: Close {}
extension Build12800Word {
    public static var typeName: String { "199 s" }
}
public enum Judge3200Word: Close {}
extension Judge3200Word {
    public static var typeName: String { "0.28 s" }
}
public enum Judge6400Word: Close {}
extension Judge6400Word {
    public static var typeName: String { "0.55 s" }
}
public enum Judge12800Word: Close {}
extension Judge12800Word {
    public static var typeName: String { "1.10 s" }
}
public enum CurveMoral: Close {}
extension CurveMoral {
    public static var typeName: String { "Each doubling of N doubles the judge’s time. The build grows near N^1.3." }
}
public enum CurveNoteOne: Close {}
extension CurveNoteOne {
    public static var typeName: String { "A bar's width is its seconds. N is the number of people, and the page builds them on the At scale tab." }
}
public enum CurveNoteTwo: Close {}
extension CurveNoteTwo {
    public static var typeName: String { "A test checks one run. The judge checks every claim, on every edit." }
}
public enum ExplainHeadWord: Close {}
extension ExplainHeadWord {
    public static var typeName: String { "What is happening" }
}
public enum ExplainOneWord: Close {}
extension ExplainOneWord {
    public static var typeName: String { "A program has two times: build time and run time." }
}
public enum BuildTimeHead: Close {}
extension BuildTimeHead {
    public static var typeName: String { "Build time" }
}
public enum BuildLineOne: Close {}
extension BuildLineOne {
    public static var typeName: String { "the judge reads the text" }
}
public enum BuildLineTwo: Close {}
extension BuildLineTwo {
    public static var typeName: String { "nothing has run yet" }
}
public enum BuildLineThree: Close {}
extension BuildLineThree {
    public static var typeName: String { "this page is here" }
}
public enum RunTimeHead: Close {}
extension RunTimeHead {
    public static var typeName: String { "Run time" }
}
public enum RunLineOne: Close {}
extension RunLineOne {
    public static var typeName: String { "the program executes" }
}
public enum RunLineTwo: Close {}
extension RunLineTwo {
    public static var typeName: String { "effects happen" }
}
public enum RunLineThree: Close {}
extension RunLineThree {
    public static var typeName: String { "none of this page" }
}
public enum ReadingsHeadWord: Close {}
extension ReadingsHeadWord {
    public static var typeName: String { "One file, two readings" }
}
public enum ReadingsIntroWord: Close {}
extension ReadingsIntroWord {
    public static var typeName: String { "The Code · Table switch under the preview swaps the editor for a table." }
}
public enum CodeHeadWord: Close {}
extension CodeHeadWord {
    public static var typeName: String { "Code" }
}
public enum TableHeadWord: Close {}
extension TableHeadWord {
    public static var typeName: String { "Table" }
}
public enum CodeLineOne: Close {}
extension CodeLineOne {
    public static var typeName: String { "public enum Emp01: Employee, Person {" }
}
public enum CodeLineTwo: Close {}
extension CodeLineTwo {
    public static var typeName: String { "public typealias Home = Finance" }
}
public enum CodeLineThree: Close {}
extension CodeLineThree {
    public static var typeName: String { "}" }
}
public enum TableColName: Close {}
extension TableColName {
    public static var typeName: String { "name" }
}
public enum TableColRank: Close {}
extension TableColRank {
    public static var typeName: String { "Rank" }
}
public enum TableColHome: Close {}
extension TableColHome {
    public static var typeName: String { "Home" }
}
public enum RowOneName: Close {}
extension RowOneName {
    public static var typeName: String { "Emp01" }
}
public enum RowOneRank: Close {}
extension RowOneRank {
    public static var typeName: String { "Manager" }
}
public enum RowOneHome: Close {}
extension RowOneHome {
    public static var typeName: String { "Finance" }
}
public enum RowTwoName: Close {}
extension RowTwoName {
    public static var typeName: String { "Emp02" }
}
public enum RowTwoRank: Close {}
extension RowTwoRank {
    public static var typeName: String { "Lead" }
}
public enum RowTwoHome: Close {}
extension RowTwoHome {
    public static var typeName: String { "Finance" }
}
public enum ReadingsBreakWord: Close {}
extension ReadingsBreakWord {
    public static var typeName: String { "Break it: press Table, click a name: the editor opens its declaration." }
}
public enum TryTwoWord: Close {}
extension TryTwoWord {
    public static var typeName: String { "Break it here: type func or var on any line: the linter refuses it, types only." }
}
public enum IntroAlt: Close {}
extension IntroAlt {
    public static var typeName: String { "The page's own manual: what it is, the measured curve, what to try." }
}

// ── the cascade: every band enters on a Beat, an eighth of a second ──

// ── the geometry, stated as counts. A bar's width is its seconds: 34, 82, 199.
// The judge's bars share one width, a hair: the exact seconds are in the label. ──

public typealias Beat = Half<Half<Half<U1>>>
public typealias HeadTall = Plus<U32, U8>
public typealias LineTall = Plus<U16, U4>
public typealias CompareTall = Plus<U64, Plus<U32, U16>>
public typealias InnerMargin = Plus<U16, U16>
public typealias FarColumn = Plus<U256, Plus<U16, U8>>
public typealias BarTall = Plus<U16, U8>
public typealias RowTall = Plus<U16, U8>
public typealias LegendTall = U16
public typealias NColumn = Plus<U64, U32>
public typealias Build3200W = Plus<U32, U2>
public typealias Build6400W = Plus<U64, Plus<U16, U2>>
public typealias Build12800W = Plus<U128, Plus<U64, Plus<U4, Plus<U2, U1>>>>

public enum BuildBar: SpanTrack {
    public typealias H = Tally<BarTall>
    public typealias Radius = R12
    public typealias Fill = AccentRole
}
public enum JudgeBar: SpanTrack {
    public typealias H = Tally<BarTall>
    public typealias Radius = Tally<U1>
    public typealias Fill = ActionRole
}
public enum BuildDot: SpanDot {
    public typealias CY = Halfway<LegendTall, Never>
    public typealias R = Tally<U4>
    public typealias Fill = AccentRole
}
public enum JudgeDot: SpanDot {
    public typealias CY = Halfway<LegendTall, Never>
    public typealias R = Tally<U4>
    public typealias Fill = ActionRole
}

public enum TitleLabel: SpanLabel {
    public typealias Y = Under<U8, TitleT>
    public typealias FillColor = TextPrimary
    public typealias Size = TitleT
    public typealias Weight = WeightBold
    public typealias Content = IntroTitle
}
public enum CurveHeadLabel: SpanLabel {
    public typealias Y = Under<U4, TextM>
    public typealias FillColor = TextPrimary
    public typealias Size = TextM
    public typealias Weight = WeightBold
    public typealias Content = CurveHeadWord
}
public enum BuildLegendLabel: SpanLabel {
    public typealias Y = Under<U2, TextXS>
    public typealias FillColor = TextSecondary
    public typealias Size = TextXS
    public typealias Weight = WeightRegular
    public typealias Content = BuildLegend
}
public enum JudgeLegendLabel: SpanLabel {
    public typealias Y = Under<U2, TextXS>
    public typealias FillColor = TextSecondary
    public typealias Size = TextXS
    public typealias Weight = WeightRegular
    public typealias Content = JudgeLegend
}
public enum N3200Label: SpanLabel {
    public typealias Y = Under<U4, TextS>
    public typealias FillColor = TextSecondary
    public typealias Size = TextS
    public typealias Weight = WeightRegular
    public typealias Content = N3200Word
}
public enum N6400Label: SpanLabel {
    public typealias Y = Under<U4, TextS>
    public typealias FillColor = TextSecondary
    public typealias Size = TextS
    public typealias Weight = WeightRegular
    public typealias Content = N6400Word
}
public enum N12800Label: SpanLabel {
    public typealias Y = Under<U4, TextS>
    public typealias FillColor = TextSecondary
    public typealias Size = TextS
    public typealias Weight = WeightRegular
    public typealias Content = N12800Word
}
public enum Build3200Label: SpanLabel {
    public typealias Y = Under<U4, TextS>
    public typealias FillColor = TextPrimary
    public typealias Size = TextS
    public typealias Weight = WeightBold
    public typealias Content = Build3200Word
}
public enum Build6400Label: SpanLabel {
    public typealias Y = Under<U4, TextS>
    public typealias FillColor = TextPrimary
    public typealias Size = TextS
    public typealias Weight = WeightBold
    public typealias Content = Build6400Word
}
public enum Build12800Label: SpanLabel {
    public typealias Y = Under<U4, TextS>
    public typealias FillColor = TextPrimary
    public typealias Size = TextS
    public typealias Weight = WeightBold
    public typealias Content = Build12800Word
}
public enum Judge3200Label: SpanLabel {
    public typealias Y = Under<U4, TextS>
    public typealias FillColor = TextPrimary
    public typealias Size = TextS
    public typealias Weight = WeightBold
    public typealias Content = Judge3200Word
}
public enum Judge6400Label: SpanLabel {
    public typealias Y = Under<U4, TextS>
    public typealias FillColor = TextPrimary
    public typealias Size = TextS
    public typealias Weight = WeightBold
    public typealias Content = Judge6400Word
}
public enum Judge12800Label: SpanLabel {
    public typealias Y = Under<U4, TextS>
    public typealias FillColor = TextPrimary
    public typealias Size = TextS
    public typealias Weight = WeightBold
    public typealias Content = Judge12800Word
}
public enum MoralLabel: SpanLabelWrapped {
    public typealias Y = Tally<U16>
    public typealias LinePitch = Tally<Plus<U16, U4>>
    public typealias FillColor = TextSecondary
    public typealias Size = TextXS
    public typealias Weight = WeightRegular
    public typealias Content = CurveMoral
}
public enum CurveNoteOneLabel: SpanLabelWrapped {
    public typealias Y = Tally<U16>
    public typealias LinePitch = Tally<Plus<U16, U4>>
    public typealias FillColor = TextSecondary
    public typealias Size = TextXS
    public typealias Weight = WeightRegular
    public typealias Content = CurveNoteOne
}
public enum CurveNoteTwoLabel: SpanLabelWrapped {
    public typealias Y = Tally<U16>
    public typealias LinePitch = Tally<Plus<U16, U4>>
    public typealias FillColor = TextPrimary
    public typealias Size = TextXS
    public typealias Weight = WeightRegular
    public typealias Content = CurveNoteTwo
}
public enum ExplainHeadLabel: SpanLabel {
    public typealias Y = Under<U4, TextM>
    public typealias FillColor = TextPrimary
    public typealias Size = TextM
    public typealias Weight = WeightBold
    public typealias Content = ExplainHeadWord
}
public enum ExplainOneLabel: SpanLabelWrapped {
    public typealias Y = Tally<U16>
    public typealias LinePitch = Tally<Plus<U16, U4>>
    public typealias FillColor = TextSecondary
    public typealias Size = TextS
    public typealias Weight = WeightRegular
    public typealias Content = ExplainOneWord
}
public enum BuildZone: SpanTrack {
    public typealias H = Tally<CompareTall>
    public typealias Radius = Tally<Never>
    public typealias Fill = AccentRole
}
public enum RunZone: SpanTrackOutlined {
    public typealias H = Tally<CompareTall>
    public typealias Radius = Tally<Never>
    public typealias Fill = SurfaceCard
    public typealias Stroke = LineRole
}
public enum BuildHeadLabel: SpanLabel {
    public typealias Y = Under<Plus<U8, U4>, TextS>
    public typealias FillColor = OnAccent
    public typealias Size = TextS
    public typealias Weight = WeightBold
    public typealias Content = BuildTimeHead
}
public enum BuildOneLabel: SpanLabel {
    public typealias Y = Under<Plus<U32, U8>, TextXS>
    public typealias FillColor = OnAccent
    public typealias Size = TextXS
    public typealias Weight = WeightRegular
    public typealias Content = BuildLineOne
}
public enum BuildTwoLabel: SpanLabel {
    public typealias Y = Under<Plus<U64, U2>, TextXS>
    public typealias FillColor = OnAccent
    public typealias Size = TextXS
    public typealias Weight = WeightRegular
    public typealias Content = BuildLineTwo
}
public enum BuildThreeLabel: SpanLabel {
    public typealias Y = Under<Plus<U64, Plus<U16, U8>>, TextXS>
    public typealias FillColor = OnAccent
    public typealias Size = TextXS
    public typealias Weight = WeightBold
    public typealias Content = BuildLineThree
}
public enum RunHeadLabel: SpanLabel {
    public typealias Y = Under<Plus<U8, U4>, TextS>
    public typealias FillColor = TextPrimary
    public typealias Size = TextS
    public typealias Weight = WeightBold
    public typealias Content = RunTimeHead
}
public enum RunOneLabel: SpanLabel {
    public typealias Y = Under<Plus<U32, U8>, TextXS>
    public typealias FillColor = TextSecondary
    public typealias Size = TextXS
    public typealias Weight = WeightRegular
    public typealias Content = RunLineOne
}
public enum RunTwoLabel: SpanLabel {
    public typealias Y = Under<Plus<U64, U2>, TextXS>
    public typealias FillColor = TextSecondary
    public typealias Size = TextXS
    public typealias Weight = WeightRegular
    public typealias Content = RunLineTwo
}
public enum RunThreeLabel: SpanLabel {
    public typealias Y = Under<Plus<U64, Plus<U16, U8>>, TextXS>
    public typealias FillColor = TextSecondary
    public typealias Size = TextXS
    public typealias Weight = WeightBold
    public typealias Content = RunLineThree
}
public typealias CodeCol = Plus<U128, Plus<U64, Plus<U16, U8>>>
public typealias PanelGap = U32
public typealias ColGap = U8
public typealias ColName = Plus<U32, U8>
public typealias ColRank = U64
public typealias ColHome = U64
public typealias LineChipW = Plus<U128, Plus<U64, Plus<U32, U8>>>
public typealias CellPad = Plus<U16, U8>

public enum HighlightChip: SpanTrack {
    public typealias H = Tally<LineTall>
    public typealias Radius = Tally<U4>
    public typealias Fill = AccentRole
}
public enum CodeHeadLabel: SpanLabel {
    public typealias Y = Under<U2, TextS>
    public typealias FillColor = TextPrimary
    public typealias Size = TextS
    public typealias Weight = WeightBold
    public typealias Content = CodeHeadWord
}
public enum TableHeadLabel: SpanLabel {
    public typealias Y = Under<U2, TextS>
    public typealias FillColor = TextPrimary
    public typealias Size = TextS
    public typealias Weight = WeightBold
    public typealias Content = TableHeadWord
}
public enum CodeOneLabel: SpanLabel {
    public typealias Y = Under<U4, TextXS>
    public typealias FillColor = TextPrimary
    public typealias Size = TextXS
    public typealias Weight = WeightRegular
    public typealias Content = CodeLineOne
}
public enum CodeTwoLabel: SpanLabel {
    public typealias Y = Under<U4, TextXS>
    public typealias FillColor = OnAccent
    public typealias Size = TextXS
    public typealias Weight = WeightRegular
    public typealias Content = CodeLineTwo
}
public enum CodeThreeLabel: SpanLabel {
    public typealias Y = Under<U4, TextXS>
    public typealias FillColor = TextPrimary
    public typealias Size = TextXS
    public typealias Weight = WeightRegular
    public typealias Content = CodeLineThree
}
public enum TableColNameLabel: SpanLabel {
    public typealias Y = Under<U4, TextXS>
    public typealias FillColor = TextSecondary
    public typealias Size = TextXS
    public typealias Weight = WeightRegular
    public typealias Content = TableColName
}
public enum TableColRankLabel: SpanLabel {
    public typealias Y = Under<U4, TextXS>
    public typealias FillColor = TextSecondary
    public typealias Size = TextXS
    public typealias Weight = WeightRegular
    public typealias Content = TableColRank
}
public enum TableColHomeLabel: SpanLabel {
    public typealias Y = Under<U4, TextXS>
    public typealias FillColor = TextSecondary
    public typealias Size = TextXS
    public typealias Weight = WeightRegular
    public typealias Content = TableColHome
}
public enum RowOneNameLabel: SpanLabel {
    public typealias Y = Under<U4, TextXS>
    public typealias FillColor = TextPrimary
    public typealias Size = TextXS
    public typealias Weight = WeightRegular
    public typealias Content = RowOneName
}
public enum RowOneRankLabel: SpanLabel {
    public typealias Y = Under<U4, TextXS>
    public typealias FillColor = TextPrimary
    public typealias Size = TextXS
    public typealias Weight = WeightRegular
    public typealias Content = RowOneRank
}
public enum RowOneHomeLabel: SpanLabel {
    public typealias Y = Under<U4, TextXS>
    public typealias FillColor = OnAccent
    public typealias Size = TextXS
    public typealias Weight = WeightRegular
    public typealias Content = RowOneHome
}
public enum RowTwoNameLabel: SpanLabel {
    public typealias Y = Under<U4, TextXS>
    public typealias FillColor = TextPrimary
    public typealias Size = TextXS
    public typealias Weight = WeightRegular
    public typealias Content = RowTwoName
}
public enum RowTwoRankLabel: SpanLabel {
    public typealias Y = Under<U4, TextXS>
    public typealias FillColor = TextPrimary
    public typealias Size = TextXS
    public typealias Weight = WeightRegular
    public typealias Content = RowTwoRank
}
public enum RowTwoHomeLabel: SpanLabel {
    public typealias Y = Under<U4, TextXS>
    public typealias FillColor = TextPrimary
    public typealias Size = TextXS
    public typealias Weight = WeightRegular
    public typealias Content = RowTwoHome
}
public enum ReadingsHeadLabel: SpanLabel {
    public typealias Y = Under<U4, TextM>
    public typealias FillColor = TextPrimary
    public typealias Size = TextM
    public typealias Weight = WeightBold
    public typealias Content = ReadingsHeadWord
}
public enum ReadingsIntroLabel: SpanLabelWrapped {
    public typealias Y = Tally<U16>
    public typealias LinePitch = Tally<Plus<U16, U4>>
    public typealias FillColor = TextSecondary
    public typealias Size = TextS
    public typealias Weight = WeightRegular
    public typealias Content = ReadingsIntroWord
}
public enum ReadingsBreakLabel: SpanLabelWrapped {
    public typealias Y = Tally<U16>
    public typealias LinePitch = Tally<Plus<U16, U4>>
    public typealias FillColor = TextSecondary
    public typealias Size = TextS
    public typealias Weight = WeightRegular
    public typealias Content = ReadingsBreakWord
}
public enum TryTwoLabel: SpanLabelWrapped {
    public typealias Y = Tally<U16>
    public typealias LinePitch = Tally<Plus<U16, U4>>
    public typealias FillColor = TextPrimary
    public typealias Size = TextS
    public typealias Weight = WeightRegular
    public typealias Content = TryTwoWord
}

// ── the rows ──

public typealias IntroParaWide = Plus<U256, Plus<U128, Plus<U64, U32>>>
public enum ValueParaWord: Close {}
extension ValueParaWord {
    public static var typeName: String { "Everything software does, it does by running: drawing a page, computing a colour, answering a click. To know what a program will do, you run it and watch. A check is a run too: a test is one run, one path of many. On this page nothing runs. The layout of these bands, a company of 12,800 people, the physics of light, one hydrogen atom: each is a file of declarations, and the page draws everything you see from them. Here the check is a reading, not a run, and the reader is called the judge: on every keystroke the judge re-reads the whole file, and a lie, about a salary, a colour, or an electron’s jump, is a line number on your screen. Reading is linear: the judge re-reads the largest file here, 136,000 lines, in 0.2 seconds. A compiler computes what you write out in full here, and takes 199 seconds on the same company: the chart below is both, measured. All of it is checkable right here, in this editor." }
}
public enum SwiftParaWord: Close {}
extension SwiftParaWord {
    public static var typeName: String { "Swift already works this way: the compiler builds generic types at build time, from the requirements you wrote, and they are nowhere in the source. The compiler checks a whole SwiftUI view tree the same way, before anything runs." }
}
public enum SwiftParaText: SpanLabelWrapped {
    public typealias Y = Tally<U16>
    public typealias LinePitch = Tally<Plus<U16, U4>>
    public typealias FillColor = TextSecondary
    public typealias Size = TextS
    public typealias Weight = WeightRegular
    public typealias Content = SwiftParaWord
}
public enum PageBuildParaWord: Close {}
extension PageBuildParaWord {
    public static var typeName: String { "This page is build time only: everything you write is a declaration, the judge checks it, the renderer draws it, and nothing ever steps through it." }
}
public enum PageBuildParaText: SpanLabelWrapped {
    public typealias Y = Tally<U16>
    public typealias LinePitch = Tally<Plus<U16, U4>>
    public typealias FillColor = TextSecondary
    public typealias Size = TextS
    public typealias Weight = WeightRegular
    public typealias Content = PageBuildParaWord
}
public enum ReadingsMoralParaWord: Close {}
extension ReadingsMoralParaWord {
    public static var typeName: String { "The yellow line and the yellow cell are one fact: Emp01 works in Finance. Elsewhere a table is a second copy of the data, and two copies are soon two truths. Here the page reads the table from the file and stores nothing: the table cannot differ from the file." }
}
public enum ReadingsMoralParaText: SpanLabelWrapped {
    public typealias Y = Tally<U16>
    public typealias LinePitch = Tally<Plus<U16, U4>>
    public typealias FillColor = TextPrimary
    public typealias Size = TextS
    public typealias Weight = WeightRegular
    public typealias Content = ReadingsMoralParaWord
}
public enum TryLieParaWord: Close {}
extension TryLieParaWord {
    public static var typeName: String { "Break it: press Plant a lie on The organization: the key flips one declaration, and the judge refuses the file, naming the exact line." }
}
public enum TryLieParaText: SpanLabelWrapped {
    public typealias Y = Tally<U16>
    public typealias LinePitch = Tally<Plus<U16, U4>>
    public typealias FillColor = TextSecondary
    public typealias Size = TextS
    public typealias Weight = WeightRegular
    public typealias Content = TryLieParaWord
}
public enum TabsHead: Close {}
extension TabsHead {
    public static var typeName: String { "The tabs" }
}
public enum TabOrgWord: Close {}
extension TabOrgWord {
    public static var typeName: String { "The organization: four people as types, with keys to hire and to plant a lie." }
}
public enum TabScaleWord: Close {}
extension TabScaleWord {
    public static var typeName: String { "At scale: the same company at 12,800 people, judged in 0.2 seconds per edit." }
}
public enum TabBasicsWord: Close {}
extension TabBasicsWord {
    public static var typeName: String { "Basics: the layout itself, in four steps." }
}
public enum TabWriterWord: Close {}
extension TabWriterWord {
    public static var typeName: String { "A typewriter: free text as one quoted literal." }
}
public enum TabButtonsWord: Close {}
extension TabButtonsWord {
    public static var typeName: String { "Buttons: a lamp and a passcode pad, and every key is a rewrite rule." }
}
public enum TabLightWord: Close {}
extension TabLightWord {
    public static var typeName: String { "Light: a lamp as code. You mix its lines, and the page computes the colour." }
}
public enum TabAtomWord: Close {}
extension TabAtomWord {
    public static var typeName: String { "The atom: the reason behind the lamp. One electron on a ladder of floors." }
}
public enum TabRulesWord: Close {}
extension TabRulesWord {
    public static var typeName: String { "Rules and FAQ: the grammar and six answers, and both are files too." }
}
public enum TabsHeadLabel: SpanLabel {
    public typealias Y = Under<U4, TextM>
    public typealias FillColor = TextPrimary
    public typealias Size = TextM
    public typealias Weight = WeightBold
    public typealias Content = TabsHead
}
public enum TabOrgLabel: SpanLabelWrapped {
    public typealias Y = Tally<U16>
    public typealias LinePitch = Tally<Plus<U16, U4>>
    public typealias FillColor = TextSecondary
    public typealias Size = TextS
    public typealias Weight = WeightRegular
    public typealias Content = TabOrgWord
}
public enum TabScaleLabel: SpanLabelWrapped {
    public typealias Y = Tally<U16>
    public typealias LinePitch = Tally<Plus<U16, U4>>
    public typealias FillColor = TextSecondary
    public typealias Size = TextS
    public typealias Weight = WeightRegular
    public typealias Content = TabScaleWord
}
public enum TabBasicsLabel: SpanLabelWrapped {
    public typealias Y = Tally<U16>
    public typealias LinePitch = Tally<Plus<U16, U4>>
    public typealias FillColor = TextSecondary
    public typealias Size = TextS
    public typealias Weight = WeightRegular
    public typealias Content = TabBasicsWord
}
public enum TabWriterLabel: SpanLabelWrapped {
    public typealias Y = Tally<U16>
    public typealias LinePitch = Tally<Plus<U16, U4>>
    public typealias FillColor = TextSecondary
    public typealias Size = TextS
    public typealias Weight = WeightRegular
    public typealias Content = TabWriterWord
}
public enum TabButtonsLabel: SpanLabelWrapped {
    public typealias Y = Tally<U16>
    public typealias LinePitch = Tally<Plus<U16, U4>>
    public typealias FillColor = TextSecondary
    public typealias Size = TextS
    public typealias Weight = WeightRegular
    public typealias Content = TabButtonsWord
}
public enum TabLightLabel: SpanLabelWrapped {
    public typealias Y = Tally<U16>
    public typealias LinePitch = Tally<Plus<U16, U4>>
    public typealias FillColor = TextSecondary
    public typealias Size = TextS
    public typealias Weight = WeightRegular
    public typealias Content = TabLightWord
}
public enum TabAtomLabel: SpanLabelWrapped {
    public typealias Y = Tally<U16>
    public typealias LinePitch = Tally<Plus<U16, U4>>
    public typealias FillColor = TextSecondary
    public typealias Size = TextS
    public typealias Weight = WeightRegular
    public typealias Content = TabAtomWord
}
public enum TabRulesLabel: SpanLabelWrapped {
    public typealias Y = Tally<U16>
    public typealias LinePitch = Tally<Plus<U16, U4>>
    public typealias FillColor = TextSecondary
    public typealias Size = TextS
    public typealias Weight = WeightRegular
    public typealias Content = TabRulesWord
}
public enum ValueParaText: SpanLabelWrapped {
    public typealias Y = Tally<U16>
    public typealias LinePitch = Tally<Plus<U16, U4>>
    public typealias FillColor = TextPrimary
    public typealias Size = TextS
    public typealias Weight = WeightRegular
    public typealias Content = ValueParaWord
}

// The page speaks these geometry names; each expression has one home.
public typealias ReadMeSurface = U512
public typealias ReadMePanelOffset = Plus<U256, U8>
public typealias ValueTall = Plus<Times<LineTally<ValueParaWord, IntroParaWide, TextS>, Plus<U16, U4>>, U8>
public typealias FourthBeat = Times<U4, Beat>
public typealias FifthBeat = Times<Plus<U4, U1>, Beat>
public typealias SixthBeat = Times<Plus<U4, U2>, Beat>
public typealias SeventhBeat = Times<Plus<U4, Plus<U2, U1>>, Beat>
public typealias CurveMoralTall = Times<LineTally<CurveMoral, IntroParaWide, TextXS>, Plus<U16, U4>>
public typealias CurveNoteOneTall = Times<LineTally<CurveNoteOne, IntroParaWide, TextXS>, Plus<U16, U4>>
public typealias CurveNoteTwoTall = Times<LineTally<CurveNoteTwo, IntroParaWide, TextXS>, Plus<U16, U4>>
public typealias ExplainOneTall = Times<LineTally<ExplainOneWord, IntroParaWide, TextS>, Plus<U16, U4>>
public typealias SwiftTall = Plus<Times<LineTally<SwiftParaWord, IntroParaWide, TextS>, Plus<U16, U4>>, U8>
public typealias PageBuildTall = Plus<Times<LineTally<PageBuildParaWord, IntroParaWide, TextS>, Plus<U16, U4>>, U8>
public typealias ReadingsRevealAt = Plus<U1, Times<Plus<U2, U1>, Beat>>
public typealias ReadingsIntroTall = Times<LineTally<ReadingsIntroWord, IntroParaWide, TextS>, Plus<U16, U4>>
public typealias ReadingsMoralTall = Plus<Times<LineTally<ReadingsMoralParaWord, IntroParaWide, TextS>, Plus<U16, U4>>, U8>
public typealias ReadingsBreakTall = Times<LineTally<ReadingsBreakWord, IntroParaWide, TextS>, Plus<U16, U4>>
public typealias TabsRevealAt = Plus<U1, FourthBeat>
public typealias TabOrgTall = Times<LineTally<TabOrgWord, IntroParaWide, TextS>, Plus<U16, U4>>
public typealias TabScaleTall = Times<LineTally<TabScaleWord, IntroParaWide, TextS>, Plus<U16, U4>>
public typealias TabBasicsTall = Times<LineTally<TabBasicsWord, IntroParaWide, TextS>, Plus<U16, U4>>
public typealias TabWriterTall = Times<LineTally<TabWriterWord, IntroParaWide, TextS>, Plus<U16, U4>>
public typealias TabButtonsTall = Times<LineTally<TabButtonsWord, IntroParaWide, TextS>, Plus<U16, U4>>
public typealias TabLightTall = Times<LineTally<TabLightWord, IntroParaWide, TextS>, Plus<U16, U4>>
public typealias TabAtomTall = Times<LineTally<TabAtomWord, IntroParaWide, TextS>, Plus<U16, U4>>
public typealias TabRulesTall = Times<LineTally<TabRulesWord, IntroParaWide, TextS>, Plus<U16, U4>>
public typealias TryLieTall = Plus<Times<LineTally<TryLieParaWord, IntroParaWide, TextS>, Plus<U16, U4>>, U8>
public typealias TryTwoTall = Times<LineTally<TryTwoWord, IntroParaWide, TextS>, Plus<U16, U4>>
