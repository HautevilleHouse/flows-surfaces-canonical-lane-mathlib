import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FlowsSurfacesCanonicalLaneLean

structure FlowSurfaceCert (A : AdmissibleClass) where
  surfaceObject : AdmittedObject
  flowDefined : A.endpointSatisfied → Prop
  carriedSurfacedata : A.remainderRecorded → Prop

def flowSurfaceAdmitted (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

end FlowsSurfacesCanonicalLaneLean
end HautevilleHouse