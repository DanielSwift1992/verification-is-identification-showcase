import VerificationIsIdentification
import DocumentKit

// The company page speaks geometry names without duplicating their readings.
public typealias OrganizationParaWide = Plus<U256, Plus<U128, Plus<U64, U32>>>
public typealias OrganizationCardWide = Plus<U256, U16>
public typealias OrganizationMiddleOffset = Plus<U256, U64>
public typealias OrganizationWalkOffset = Plus<U512, Plus<U64, U32>>
public typealias OrgWhyOneTall = Times<LineTally<OrgWhyOne, OrganizationParaWide, TextL>, Plus<U16, U4>>
public typealias OrgWhyTwoTall = Times<LineTally<OrgWhyTwo, OrganizationParaWide, TextL>, Plus<U16, U4>>
public typealias OrgWhyThreeTall = Times<LineTally<OrgWhyThree, OrganizationParaWide, TextL>, Plus<U16, U4>>
public typealias OrgWhyFourTall = Times<LineTally<OrgWhyFour, OrganizationParaWide, TextL>, Plus<U16, U4>>
public typealias OrgWhyFiveTall = Times<LineTally<OrgWhyFive, OrganizationParaWide, TextL>, Plus<U16, U4>>
public typealias OrganizationFootTextTall = Times<LineTally<FootWord, OrganizationParaWide, TextXS>, Plus<U16, U4>>
