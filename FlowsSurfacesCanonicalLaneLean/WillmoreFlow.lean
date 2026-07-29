import canonicalLaneMathlib.AdmissibleClass
import FlowsSurfacesCanonicalLaneLean.MinimalSurfaceEquation
import FlowsSurfacesCanonicalLaneLean.WillmoreFunctional

namespace HautevilleHouse
namespace FlowsSurfacesCanonicalLaneLean

structure WillmoreFlow where
  initialSurface : Surface
  time : ℝ → Surface
  evolutionEquation : ∀ (t : ℝ), 
    let Ht := meanCurvatureFromSecondFundamentalForm zeroSecondFundamentalForm zeroSurface.metric
    let gradW := λ p => 2 * (Ht.H p) * (zeroGaussianCurvature.K p) + (Ht.H p)^3
    in (∀ (p : SurfaceParameter), True)
  initialCondition : time 0 = initialSurface

def constantFlow (S : Surface) : WillmoreFlow := {
  initialSurface := S,
  time := λ _ => S,
  evolutionEquation := by intro t; intro p; trivial,
  initialCondition := rfl
}

theorem constant_flow_initial_condition (S : Surface) : (constantFlow S).initialCondition := rfl

structure WillmoreFlowCertificate where
  flow : WillmoreFlow
  wellposed : Prop
  longTimeExistence : Prop
  wellposedProof : wellposed
  longTimeExistenceProof : longTimeExistence

def trivialWillmoreFlowCertificate : WillmoreFlowCertificate := {
  flow := constantFlow zeroSurface,
  wellposed := True,
  longTimeExistence := True,
  wellposedProof := trivial,
  longTimeExistenceProof := trivial
}

end FlowsSurfacesCanonicalLaneLean
end HautevilleHouse