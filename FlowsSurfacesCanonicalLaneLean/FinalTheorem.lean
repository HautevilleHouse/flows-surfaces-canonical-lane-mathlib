import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FlowsSurfacesCanonicalLaneLean

def FlowSurfaceClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem flow_surface_closure (A : AdmissibleClass) :
    FlowSurfaceClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end FlowsSurfacesCanonicalLaneLean
end HautevilleHouse