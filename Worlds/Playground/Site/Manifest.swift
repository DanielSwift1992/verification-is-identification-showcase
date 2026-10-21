import VerificationIsIdentification
import DocumentKit

// Each world reads this pinned file in THEIRS. Its records name the other worlds.
// File names the world directory; SwiftPM and gate.manifest.swift name its paths.
// Swift compiles dictionaries and bodies. Browser courts read the declared roles.
// Reads names each materialized world; copy changes are recorded in
// Checks/Playground/copy-r3.json, beside the original source hashes.

public enum ReadMeWorld: Close {
    public typealias File = ReadMeFileWord
    public typealias Name = IntroNameWord
}
public enum ReadMeFileWord: Close {}
extension ReadMeFileWord {
    public static var typeName: String { "ReadMe" }
}
public enum IntroNameWord: Close {}
extension IntroNameWord {
    public static var typeName: String { "introFile" }
}

public enum OrganizationWorld: Close {
    public typealias File = OrganizationFileWord
    public typealias Name = OrganizationNameWord
}
public enum OrganizationFileWord: Close {}
extension OrganizationFileWord {
    public static var typeName: String { "Organization" }
}
public enum OrganizationNameWord: Close {}
extension OrganizationNameWord {
    public static var typeName: String { "organizationFile" }
}

// The four-person company has its own door; Scale has its own materialized files.
public enum CompanyWorld: Close {
    public typealias File = CompanyFileWord
    public typealias Name = CompanyNameWord
}
public enum CompanyFileWord: Close {}
extension CompanyFileWord {
    public static var typeName: String { "Company" }
}
public enum CompanyNameWord: Close {}
extension CompanyNameWord {
    public static var typeName: String { "companyFile" }
}

public enum ScaleWorld: Close {
    public typealias File = ScaleFileWord
    public typealias Name = ScaleNameWord
}
public enum ScaleFileWord: Close {}
extension ScaleFileWord {
    public static var typeName: String { "Scale" }
}
public enum ScaleNameWord: Close {}
extension ScaleNameWord {
    public static var typeName: String { "scaleFile" }
}

public enum BasicsWorld: Close {
    public typealias File = BasicsFileWord
    public typealias Name = BasicsNameWord
}
public enum BasicsFileWord: Close {}
extension BasicsFileWord {
    public static var typeName: String { "Basics" }
}
public enum BasicsNameWord: Close {}
extension BasicsNameWord {
    public static var typeName: String { "basicsFile" }
}

public enum TypewriterWorld: Close {
    public typealias File = TypewriterFileWord
    public typealias Name = TypewriterNameWord
}
public enum TypewriterFileWord: Close {}
extension TypewriterFileWord {
    public static var typeName: String { "Typewriter" }
}
public enum TypewriterNameWord: Close {}
extension TypewriterNameWord {
    public static var typeName: String { "typewriterFile" }
}

public enum ButtonsWorld: Close {
    public typealias File = ButtonsFileWord
    public typealias Name = ButtonsNameWord
}
public enum ButtonsFileWord: Close {}
extension ButtonsFileWord {
    public static var typeName: String { "World" }
}
public enum ButtonsNameWord: Close {}
extension ButtonsNameWord {
    public static var typeName: String { "worldFile" }
}

public enum LightWorld: Close {
    public typealias File = LightFileWord
    public typealias Name = LightNameWord
    public typealias Pages = LightPagesWord
}
public enum LightPagesWord: Close {}
extension LightPagesWord {
    public static var typeName: String { "LightPages" }
}
public enum LightFileWord: Close {}
extension LightFileWord {
    public static var typeName: String { "Light" }
}
public enum LightNameWord: Close {}
extension LightNameWord {
    public static var typeName: String { "lightFile" }
}

public enum AtomWorld: Close {
    public typealias File = AtomFileWord
    public typealias Name = AtomNameWord
    public typealias Pages = AtomPagesWord
    public typealias Predicate = AtomPredicateWord
    public typealias Encoding = AtomEncodingWord
    public typealias Sigma = AtomSigmaWord
}
public enum AtomPagesWord: Close {}
extension AtomPagesWord {
    public static var typeName: String { "AtomPages" }
}
public enum AtomPredicateWord: Close {}
extension AtomPredicateWord {
    public static var typeName: String { "TickCountQuestion" }
}
public enum AtomEncodingWord: Close {}
extension AtomEncodingWord {
    public static var typeName: String { "UnaryArithmeticEncoding" }
}
public enum AtomSigmaWord: Close {}
extension AtomSigmaWord {
    public static var typeName: String { "AtomLevels" }
}
public enum AtomFileWord: Close {}
extension AtomFileWord {
    public static var typeName: String { "Atom" }
}
public enum AtomNameWord: Close {}
extension AtomNameWord {
    public static var typeName: String { "atomFile" }
}

public enum RulesWorld: Close {
    public typealias File = RulesFileWord
    public typealias Name = RulesNameWord
}
public enum RulesFileWord: Close {}
extension RulesFileWord {
    public static var typeName: String { "Rules" }
}
public enum RulesNameWord: Close {}
extension RulesNameWord {
    public static var typeName: String { "rulesFile" }
}

public enum FAQWorld: Close {
    public typealias File = FAQFileWord
    public typealias Name = FAQNameWord
}
public enum FAQFileWord: Close {}
extension FAQFileWord {
    public static var typeName: String { "FAQ" }
}
public enum FAQNameWord: Close {}
extension FAQNameWord {
    public static var typeName: String { "faqFile" }
}

// ── the groups the tab bar separates by: a thin rule stands where the group
//    changes, so the order below is the order the bar shows ──

public enum IntroGroup: Close {
    public typealias Name = IntroGroupWord
}
public enum IntroGroupWord: Close {}
extension IntroGroupWord {
    public static var typeName: String { "intro" }
}
public enum CompanyGroup: Close {
    public typealias Name = CompanyGroupWord
}
public enum CompanyGroupWord: Close {}
extension CompanyGroupWord {
    public static var typeName: String { "company" }
}
public enum MechanicsGroup: Close {
    public typealias Name = MechanicsGroupWord
}
public enum MechanicsGroupWord: Close {}
extension MechanicsGroupWord {
    public static var typeName: String { "mechanics" }
}
public enum PhysicsGroup: Close {
    public typealias Name = PhysicsGroupWord
}
public enum PhysicsGroupWord: Close {}
extension PhysicsGroupWord {
    public static var typeName: String { "physics" }
}
public enum ReferenceGroup: Close {
    public typealias Name = ReferenceGroupWord
}
public enum ReferenceGroupWord: Close {}
extension ReferenceGroupWord {
    public static var typeName: String { "reference" }
}

// ── the catalog, in declaration order. A record reads a world declared
//    above, or GeneratedText when the page writes its own text; the file it
//    shows is the file a reader downloads. ──

public enum GeneratedText: Close {}

public enum ReadMeTab: Close {
    public typealias Id = ReadMeIdWord
    public typealias Group = IntroGroup
    public typealias Title = ReadMeTitleWord
    public typealias Shown = ReadMeShownWord
    public typealias Reads = ReadMeWorld
    public typealias Caption = ReadMeCaptionWord
}
public enum ReadMeIdWord: Close {}
extension ReadMeIdWord {
    public static var typeName: String { "readme" }
}
public enum ReadMeTitleWord: Close {}
extension ReadMeTitleWord {
    public static var typeName: String { "Read me" }
}
public enum ReadMeShownWord: Close {}
extension ReadMeShownWord {
    public static var typeName: String { "ReadMe.swift" }
}
public enum ReadMeCaptionWord: Close {}
extension ReadMeCaptionWord {
    public static var typeName: String { "ReadMe.swift introduces the worlds. Open Drawing for the page, or Full for its source." }
}

public enum OrganizationTab: Close {
    public typealias Id = OrganizationIdWord
    public typealias Group = CompanyGroup
    public typealias Title = OrganizationTitleWord
    public typealias Shown = OrganizationShownWord
    public typealias Reads = OrganizationWorld
    public typealias Caption = OrganizationCaptionWord
}
public enum OrganizationIdWord: Close {}
extension OrganizationIdWord {
    public static var typeName: String { "organization" }
}
public enum OrganizationTitleWord: Close {}
extension OrganizationTitleWord {
    public static var typeName: String { "The organization" }
}
public enum OrganizationShownWord: Close {}
extension OrganizationShownWord {
    public static var typeName: String { "Organization.swift" }
}
public enum OrganizationCaptionWord: Close {}
extension OrganizationCaptionWord {
    public static var typeName: String { "Organization.swift declares four people and their department shares. Edit a Home alias in Full; the company court reports its line." }
}

public enum ScaleTab: Close {
    public typealias Id = ScaleIdWord
    public typealias Group = CompanyGroup
    public typealias Title = ScaleTitleWord
    public typealias Shown = ScaleShownWord
    public typealias Reads = ScaleWorld
    public typealias Caption = ScaleCaptionWord
}
public enum ScaleIdWord: Close {}
extension ScaleIdWord {
    public static var typeName: String { "scale" }
}
public enum ScaleTitleWord: Close {}
extension ScaleTitleWord {
    public static var typeName: String { "At scale" }
}
public enum ScaleShownWord: Close {}
extension ScaleShownWord {
    public static var typeName: String { "Company.swift" }
}
public enum ScaleCaptionWord: Close {}
extension ScaleCaptionWord {
    public static var typeName: String { "Company.swift contains the generated company. The editor shows a portion; the court reads the complete company fragment." }
}

public enum BasicsTab: Close {
    public typealias Id = BasicsIdWord
    public typealias Group = MechanicsGroup
    public typealias Title = BasicsTitleWord
    public typealias Shown = BasicsShownWord
    public typealias Reads = BasicsWorld
    public typealias Caption = BasicsCaptionWord
}
public enum BasicsIdWord: Close {}
extension BasicsIdWord {
    public static var typeName: String { "basics" }
}
public enum BasicsTitleWord: Close {}
extension BasicsTitleWord {
    public static var typeName: String { "Basics" }
}
public enum BasicsShownWord: Close {}
extension BasicsShownWord {
    public static var typeName: String { "Basics.swift" }
}
public enum BasicsCaptionWord: Close {}
extension BasicsCaptionWord {
    public static var typeName: String { "Basics.swift declares the shapes that BasicsPages.swift draws. Open Drawing; edited page bodies are not compiled here." }
}

public enum WriterTab: Close {
    public typealias Id = WriterIdWord
    public typealias Group = MechanicsGroup
    public typealias Title = WriterTitleWord
    public typealias Shown = WriterShownWord
    public typealias Reads = TypewriterWorld
    public typealias Caption = WriterCaptionWord
}
public enum WriterIdWord: Close {}
extension WriterIdWord {
    public static var typeName: String { "writer" }
}
public enum WriterTitleWord: Close {}
extension WriterTitleWord {
    public static var typeName: String { "A typewriter" }
}
public enum WriterShownWord: Close {}
extension WriterShownWord {
    public static var typeName: String { "Typewriter.swift" }
}
public enum WriterCaptionWord: Close {}
extension WriterCaptionWord {
    public static var typeName: String { "Typewriter.swift declares a note and its keys. This bench draws them. Edit the Note literal in Full; keyboard typing into the drawing is not available." }
}

public enum ButtonsTab: Close {
    public typealias Id = ButtonsIdWord
    public typealias Group = MechanicsGroup
    public typealias Title = ButtonsTitleWord
    public typealias Shown = ButtonsShownWord
    public typealias Reads = ButtonsWorld
    public typealias Caption = ButtonsCaptionWord
}
public enum ButtonsIdWord: Close {}
extension ButtonsIdWord {
    public static var typeName: String { "buttons" }
}
public enum ButtonsTitleWord: Close {}
extension ButtonsTitleWord {
    public static var typeName: String { "Buttons" }
}
public enum ButtonsShownWord: Close {}
extension ButtonsShownWord {
    public static var typeName: String { "World.swift" }
}
public enum ButtonsCaptionWord: Close {}
extension ButtonsCaptionWord {
    public static var typeName: String { "World.swift declares the keys and their rules. A matching key changes an alias in the open file. Open Drawing." }
}

public enum LightTab: Close {
    public typealias Id = LightIdWord
    public typealias Group = PhysicsGroup
    public typealias Title = LightTitleWord
    public typealias Shown = LightShownWord
    public typealias Reads = LightWorld
    public typealias Caption = LightCaptionWord
}
public enum LightIdWord: Close {}
extension LightIdWord {
    public static var typeName: String { "light" }
}
public enum LightTitleWord: Close {}
extension LightTitleWord {
    public static var typeName: String { "Light" }
}
public enum LightShownWord: Close {}
extension LightShownWord {
    public static var typeName: String { "Light.swift" }
}
public enum LightCaptionWord: Close {}
extension LightCaptionWord {
    public static var typeName: String { "Light.swift declares the lamp and its supported equalities. Open Drawing; the where court reads the declarations." }
}

public enum AtomTabEntry: Close {
    public typealias Id = AtomIdWord
    public typealias Group = PhysicsGroup
    public typealias Title = AtomTitleWord
    public typealias Shown = AtomShownWord
    public typealias Reads = AtomWorld
    public typealias Caption = AtomCaptionWord
}
public enum AtomIdWord: Close {}
extension AtomIdWord {
    public static var typeName: String { "atom" }
}
public enum AtomTitleWord: Close {}
extension AtomTitleWord {
    public static var typeName: String { "The atom" }
}
public enum AtomShownWord: Close {}
extension AtomShownWord {
    public static var typeName: String { "Atom.swift" }
}
public enum AtomCaptionWord: Close {}
extension AtomCaptionWord {
    public static var typeName: String { "Atom.swift declares Electron and its readings. A matching key changes the alias. Count and where report supported readings; four nominal where refusals are expected." }
}

public enum RulesTab: Close {
    public typealias Id = RulesIdWord
    public typealias Group = ReferenceGroup
    public typealias Title = RulesTitleWord
    public typealias Shown = RulesShownWord
    public typealias Reads = RulesWorld
    public typealias Caption = RulesCaptionWord
}
public enum RulesIdWord: Close {}
extension RulesIdWord {
    public static var typeName: String { "rules" }
}
public enum RulesTitleWord: Close {}
extension RulesTitleWord {
    public static var typeName: String { "Rules" }
}
public enum RulesShownWord: Close {}
extension RulesShownWord {
    public static var typeName: String { "Rules.swift" }
}
public enum RulesCaptionWord: Close {}
extension RulesCaptionWord {
    public static var typeName: String { "Rules.swift states the forms and substitution rules. The browser runs limited guards; edited page bodies have not been checked by Swift." }
}

public enum FAQTab: Close {
    public typealias Id = FAQIdWord
    public typealias Group = ReferenceGroup
    public typealias Title = FAQTitleWord
    public typealias Shown = FAQShownWord
    public typealias Reads = FAQWorld
    public typealias Caption = FAQCaptionWord
}
public enum FAQIdWord: Close {}
extension FAQIdWord {
    public static var typeName: String { "faq" }
}
public enum FAQTitleWord: Close {}
extension FAQTitleWord {
    public static var typeName: String { "FAQ" }
}
public enum FAQShownWord: Close {}
extension FAQShownWord {
    public static var typeName: String { "FAQ.swift" }
}
public enum FAQCaptionWord: Close {}
extension FAQCaptionWord {
    public static var typeName: String { "FAQ.swift contains the questions and answers drawn by FAQPages.swift. Edit the words in Full." }
}

// The two source worlds are records here too, not a second list in the publisher.
public enum SiteWorld: Close {
    public typealias File = SiteFileWord
    public typealias Name = SiteNameWord
}
public enum SiteFileWord: Close {}
extension SiteFileWord {
    public static var typeName: String { "Site" }
}
public enum SiteNameWord: Close {}
extension SiteNameWord {
    public static var typeName: String { "siteFile" }
}

public enum CompanyTab: Close {
    public typealias Id = CompanyIdWord
    public typealias Group = ReferenceGroup
    public typealias Title = CompanyTitleWord
    public typealias Shown = CompanyShownWord
    public typealias Reads = CompanyWorld
    public typealias Caption = CompanyCaptionWord
}
public enum CompanyIdWord: Close {}
extension CompanyIdWord {
    public static var typeName: String { "company" }
}
public enum CompanyTitleWord: Close {}
extension CompanyTitleWord {
    public static var typeName: String { "Company template" }
}
public enum CompanyShownWord: Close {}
extension CompanyShownWord {
    public static var typeName: String { "Company.swift" }
}
public enum CompanyCaptionWord: Close {}
extension CompanyCaptionWord {
    public static var typeName: String { "Company.swift and the generated world manifest" }
}

public enum SiteTab: Close {
    public typealias Id = SiteIdWord
    public typealias Group = ReferenceGroup
    public typealias Title = SiteTitleWord
    public typealias Shown = SiteShownWord
    public typealias Reads = SiteWorld
    public typealias Caption = SiteCaptionWord
}
public enum SiteIdWord: Close {}
extension SiteIdWord {
    public static var typeName: String { "site" }
}
public enum SiteTitleWord: Close {}
extension SiteTitleWord {
    public static var typeName: String { "Site" }
}
public enum SiteShownWord: Close {}
extension SiteShownWord {
    public static var typeName: String { "Palette.swift" }
}
public enum SiteCaptionWord: Close {}
extension SiteCaptionWord {
    public static var typeName: String { "Palette declares seventeen contrast readings. The shared Manifest is read-only in THEIRS." }
}
