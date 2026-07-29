import canonicalLaneMathlib.AdmissibleClass
import FlowsSurfacesCanonicalLaneLean.WillmoreFlow

namespace HautevilleHouse
namespace FlowsSurfacesCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  NativeBridgeClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) : bridgeClosed A :=
  And.intro A.object.sourceKeyChecked A.object.theoremObjectChecked

def gateClosed (A : AdmissibleClass) : Prop :=
  A.endpointSatisfied ∨ A.remainderRecorded

theorem gate_from_admissible_class (A : AdmissibleClass) : gateClosed A :=
  A.gateWitness

def ConstrainedWillmoreClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_willmore_endgame (A : AdmissibleClass) : ConstrainedWillmoreClosure A :=
  And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end FlowsSurfacesCanonicalLaneLean
end HautevilleHouse