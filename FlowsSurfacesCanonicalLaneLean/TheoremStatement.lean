import HautevilleHouse.FlowsSurfacesCanonicalLaneLean.ReviewerBridge

namespace HautevilleHouse
namespace FlowsSurfacesCanonicalLaneLean

structure TheoremStatement where
  sourceKey : String
  theoremName : String
  theoremObject : String
  classicalBoundary : String
  flowsConstraint : String
  certificateLane : String
  carriedRemainder : String
deriving Repr, DecidableEq

def sourceTheoremStatement : TheoremStatement := {
  sourceKey := sourceRepository,
  theoremName := sourceRepository,
  theoremObject := sourceDescription,
  classicalBoundary := sourceTheoremBoundary.claimBoundary,
  flowsConstraint := "flows on surfaces: constraint surfaces admissibility",
  certificateLane := baselineCertificateLane,
  carriedRemainder := "classical source boundary carried by formalizationCertificate.theoremBoundaryOpen and sourceTheoremBoundary"
}

end FlowsSurfacesCanonicalLaneLean
end HautevilleHouse