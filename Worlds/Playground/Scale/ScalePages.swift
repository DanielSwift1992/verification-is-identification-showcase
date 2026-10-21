import VerificationIsIdentification
import DocumentKit
import Organization

// A generated company of 12800 people. Every field is computed from the
// person's index, so no person depends on another. The cards above count
// this list live: edit anyone, and the judge re-checks the file as you type.

// ── the display strings: every text on the page is a type carrying typeName ──


public enum OrganizationTitle: Close {}
extension OrganizationTitle {
    public static var typeName: String { "The Organization, N = 12 800" }
}
public enum OrgWhyOne: Close {}
extension OrgWhyOne {
    public static var typeName: String { "This file is the same organization, written out for 12 800 people." }
}
public enum OrgWhyTwo: Close {}
extension OrgWhyTwo {
    public static var typeName: String { "The editor shows a portion of this file; Full keeps the complete source." }
}
public enum OrgWhyThree: Close {}
extension OrgWhyThree {
    public static var typeName: String { "The company court reads the declared department and share claims." }
}
public enum OrgWhyFour: Close {}
extension OrgWhyFour {
    public static var typeName: String { "The court reads the complete company fragment, 136 139 lines." }
}
public enum OrgWhyFive: Close {}
extension OrgWhyFive {
    public static var typeName: String { "Change a Home alias in Full; the court names a broken share claim at its line." }
}
public enum PeopleWord: Close {}
extension PeopleWord {
    public static var typeName: String { "people" }
}
public enum AccessWord: Close {}
extension AccessWord {
    public static var typeName: String { "claims read" }
}
public enum FinanceWord: Close {}
extension FinanceWord {
    public static var typeName: String { "in finance" }
}
public enum EngineeringWord: Close {}
extension EngineeringWord {
    public static var typeName: String { "in engineering" }
}
public enum WalkWord: Close {}
extension WalkWord {
    public static var typeName: String { "walk the real company →" }
}
public enum FootWord: Close {}
extension FootWord {
    public static var typeName: String { "The editor shows this file in pages. The judge reads all pages at once." }
}
public enum OrganizationAlt: Close {}
extension OrganizationAlt {
    public static var typeName: String { "The organization's page: counted cards and a live link." }
}
public enum SitePage: Close {}
extension SitePage {
    public static var typeName: String { "https://danielswift1992.github.io/verification-is-identification/documentation/organization" }
}

// ── the heights, stated once as counts. Baselines derive from a pad and a text
// size (Under), midpoints from the counts (Halfway): no pixel coordinate is anywhere
// in this file. Banded<Tall, Content> is one page band: air above a fixed slot. ──

public typealias Banded<Tall: Structure, Content: Spanning> =
    Paired<Air<Breath>, Fixed<Tall, Content>>

public typealias HeaderTall = Plus<U32, U8>
public typealias KpiTall = Plus<U64, U32>
public typealias ChipTall = U64
public typealias FootTall = Plus<U16, U8>

// ── the header: a breathing status, the name, the claim ──

public enum StatusDot: SpanBreathingDot {
    public typealias CY = Halfway<HeaderTall, Never>
    public typealias R = Tally<Plus<U4, U1>>
    public typealias Fill = AccentRole
}
public enum TitleFace: SpanLabel {
    public typealias Y = Under<U8, TitleT>
    public typealias FillColor = TextPrimary
    public typealias Size = TitleT
    public typealias Weight = WeightBold
    public typealias Content = OrganizationTitle
}
public enum OrgWhyOneLabel: SpanLabelWrapped {
    public typealias Y = Tally<U16>
    public typealias LinePitch = Tally<Plus<U16, U4>>
    public typealias FillColor = TextPrimary
    public typealias Size = TextL
    public typealias Weight = WeightRegular
    public typealias Content = OrgWhyOne
}
public enum OrgWhyOneRow: HFlow {
    public typealias Given = WideSurface
    @StructureBuilder
    public static var body: some Structure & Divides {
        Air<Plus<U32, U16>>.self
        Fixed<OrganizationParaWide, OrgWhyOneLabel>.self
        Flexible<SpanNothing>.self
        Air<Plus<U32, U16>>.self
    }
}
public enum OrgWhyTwoLabel: SpanLabelWrapped {
    public typealias Y = Tally<U16>
    public typealias LinePitch = Tally<Plus<U16, U4>>
    public typealias FillColor = TextSecondary
    public typealias Size = TextL
    public typealias Weight = WeightRegular
    public typealias Content = OrgWhyTwo
}
public enum OrgWhyTwoRow: HFlow {
    public typealias Given = WideSurface
    @StructureBuilder
    public static var body: some Structure & Divides {
        Air<Plus<U32, U16>>.self
        Fixed<OrganizationParaWide, OrgWhyTwoLabel>.self
        Flexible<SpanNothing>.self
        Air<Plus<U32, U16>>.self
    }
}
public enum OrgWhyThreeLabel: SpanLabelWrapped {
    public typealias Y = Tally<U16>
    public typealias LinePitch = Tally<Plus<U16, U4>>
    public typealias FillColor = TextSecondary
    public typealias Size = TextL
    public typealias Weight = WeightRegular
    public typealias Content = OrgWhyThree
}
public enum OrgWhyThreeRow: HFlow {
    public typealias Given = WideSurface
    @StructureBuilder
    public static var body: some Structure & Divides {
        Air<Plus<U32, U16>>.self
        Fixed<OrganizationParaWide, OrgWhyThreeLabel>.self
        Flexible<SpanNothing>.self
        Air<Plus<U32, U16>>.self
    }
}
public enum OrgWhyFourLabel: SpanLabelWrapped {
    public typealias Y = Tally<U16>
    public typealias LinePitch = Tally<Plus<U16, U4>>
    public typealias FillColor = TextSecondary
    public typealias Size = TextL
    public typealias Weight = WeightRegular
    public typealias Content = OrgWhyFour
}
public enum OrgWhyFourRow: HFlow {
    public typealias Given = WideSurface
    @StructureBuilder
    public static var body: some Structure & Divides {
        Air<Plus<U32, U16>>.self
        Fixed<OrganizationParaWide, OrgWhyFourLabel>.self
        Flexible<SpanNothing>.self
        Air<Plus<U32, U16>>.self
    }
}
public enum OrgWhyFiveLabel: SpanLabelWrapped {
    public typealias Y = Tally<U16>
    public typealias LinePitch = Tally<Plus<U16, U4>>
    public typealias FillColor = TextPrimary
    public typealias Size = TextL
    public typealias Weight = WeightRegular
    public typealias Content = OrgWhyFive
}
public enum OrgWhyFiveRow: HFlow {
    public typealias Given = WideSurface
    @StructureBuilder
    public static var body: some Structure & Divides {
        Air<Plus<U32, U16>>.self
        Fixed<OrganizationParaWide, OrgWhyFiveLabel>.self
        Flexible<SpanNothing>.self
        Air<Plus<U32, U16>>.self
    }
}
public enum HeaderRow: HFlow {
    public typealias Given = WideSurface
    @StructureBuilder
    public static var body: some Structure & Divides {
        Air<EdgeMargin>.self
        Fixed<U16, StatusDot>.self
        Air<U8>.self
        Flexible<TitleFace>.self
        Air<EdgeMargin>.self
    }
}

// ── the cards: every number is a Tally, counted off the company below ──

public enum HeroFace: SpanHeroFace {
    public typealias H = Tally<KpiTall>
    public typealias Radius = R12
    public typealias Fill = AccentRole
}
public enum QuietFace: SpanTrackOutlined {
    public typealias H = Tally<KpiTall>
    public typealias Radius = R12
    public typealias Fill = SurfaceCard
    public typealias Stroke = LineRole
}
public enum PeopleNumber: SpanLabel {
    public typealias Y = Under<Plus<U32, U8>, DisplayS>
    public typealias FillColor = OnAccent
    public typealias Size = DisplayS
    public typealias Weight = WeightBold
    public typealias Content = Tally<Company>
}
public enum PeopleCaption: SpanLabel {
    public typealias Y = Under<Plus<U8, U4>, TextXS>
    public typealias FillColor = OnAccent
    public typealias Size = TextXS
    public typealias Weight = WeightRegular
    public typealias Content = PeopleWord
}
public enum AccessNumber: SpanLabel {
    public typealias Y = Under<Plus<U32, U8>, DisplayS>
    public typealias FillColor = TextPrimary
    public typealias Size = DisplayS
    public typealias Weight = WeightBold
    public typealias Content = Tally<AllAccesses>
}
public enum AccessCaption: SpanLabel {
    public typealias Y = Under<Plus<U8, U4>, TextXS>
    public typealias FillColor = TextSecondary
    public typealias Size = TextXS
    public typealias Weight = WeightRegular
    public typealias Content = AccessWord
}
public enum EngineeringNumber: SpanLabel {
    public typealias Y = Under<Plus<U32, U8>, DisplayS>
    public typealias FillColor = TextPrimary
    public typealias Size = DisplayS
    public typealias Weight = WeightBold
    public typealias Content = Tally<EngineeringTeam>
}
public enum EngineeringCaption: SpanLabel {
    public typealias Y = Under<Plus<U8, U4>, TextXS>
    public typealias FillColor = TextSecondary
    public typealias Size = TextXS
    public typealias Weight = WeightRegular
    public typealias Content = EngineeringWord
}
public enum KpiCardsRow: HFlow {
    public typealias Given = WideSurface
    @StructureBuilder
    public static var body: some Structure & Divides {
        Air<EdgeMargin>.self
        Fixed<OrganizationCardWide, HeroFace>.self
        Air<U16>.self
        Fixed<OrganizationCardWide, QuietFace>.self
        Air<U16>.self
        Fixed<OrganizationCardWide, QuietFace>.self
        RestAir.self
    }
}
public enum PeopleTextRow: HFlow {
    public typealias Given = WideSurface
    @StructureBuilder
    public static var body: some Structure & Divides {
        Air<Plus<U16, U16>>.self
        Fixed<Plus<U128, U64>, Layered<PeopleCaption, PeopleNumber>>.self
        RestAir.self
    }
}
public enum AccessTextRow: HFlow {
    public typealias Given = WideSurface
    @StructureBuilder
    public static var body: some Structure & Divides {
        Air<OrganizationMiddleOffset>.self
        Fixed<Plus<U128, U64>, Layered<AccessCaption, AccessNumber>>.self
        RestAir.self
    }
}
public enum EngineeringTextRow: HFlow {
    public typealias Given = WideSurface
    @StructureBuilder
    public static var body: some Structure & Divides {
        Air<OrganizationWalkOffset>.self
        Fixed<Plus<U128, U64>, Layered<EngineeringCaption, EngineeringNumber>>.self
        RestAir.self
    }
}
public enum KpiBand: Group {
    @StructureBuilder
    public static var body: some Structure {
        KpiCardsRow.self
        PeopleTextRow.self
        AccessTextRow.self
        EngineeringTextRow.self
    }
}

// ── the door: one live link into the real company's site ──

public enum DoorFace: SpanTrack {
    public typealias H = Tally<ChipTall>
    public typealias Radius = R12
    public typealias Fill = ActionRole
}
public enum DoorWord: SpanLabelMid {
    public typealias Y = Under<Plus<U16, U8>, TextS>
    public typealias FillColor = OnActionRole
    public typealias Size = TextS
    public typealias Weight = WeightBold
    public typealias Content = WalkWord
}
public enum ChipCardsRow: HFlow {
    public typealias Given = WideSurface
    @StructureBuilder
    public static var body: some Structure & Divides {
        Air<EdgeMargin>.self
        Fixed<Plus<U128, U64>, SpanLink<SitePage, Layered<DoorFace, DoorWord>>>.self
        RestAir.self
    }
}
public enum ChipsBand: Group {
    @StructureBuilder
    public static var body: some Structure {
        ChipCardsRow.self
    }
}

// ── the footer ──

public enum FootFace: SpanLabelWrapped {
    public typealias Y = Tally<U16>
    public typealias LinePitch = Tally<Plus<U16, U4>>
    public typealias FillColor = TextSecondary
    public typealias Size = TextXS
    public typealias Weight = WeightRegular
    public typealias Content = FootWord
}
public enum FootRow: HFlow {
    public typealias Given = WideSurface
    @StructureBuilder
    public static var body: some Structure & Divides {
        Air<EdgeMargin>.self
        Fixed<OrganizationParaWide, FootFace>.self
        Flexible<SpanNothing>.self
        Air<EdgeMargin>.self
    }
}

// ── the page: the bands stack down one axis, and the height is their sum ──

public enum OrganizationArt: GrownDiagram {
    public typealias Across = WideSurface
    public typealias AriaLabel = OrganizationAlt
    public typealias Defs = SoftShadow
    @StructureBuilder
    public static var body: some Structure & DividesY {
        Air<EdgeMargin>.self
        Fixed<HeaderTall, SpanHosted<HeaderRow>>.self
        Air<Plus<U8, U4>>.self
        Fixed<OrgWhyOneTall, SpanHosted<OrgWhyOneRow>>.self
        Fixed<OrgWhyTwoTall, SpanHosted<OrgWhyTwoRow>>.self
        Fixed<OrgWhyThreeTall, SpanHosted<OrgWhyThreeRow>>.self
        Fixed<OrgWhyFourTall, SpanHosted<OrgWhyFourRow>>.self
        Air<U8>.self
        Fixed<OrgWhyFiveTall, SpanHosted<OrgWhyFiveRow>>.self
        Air<U16>.self
        Banded<KpiTall, SpanHosted<KpiBand>>.self
        Banded<ChipTall, SpanHosted<ChipsBand>>.self
        Banded<OrganizationFootTextTall, SpanHosted<FootRow>>.self
        Air<EdgeMargin>.self
    }
}


