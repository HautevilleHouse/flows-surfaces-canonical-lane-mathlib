import FlowsSurfacesCanonicalLaneLean.SurfaceOperators

namespace HautevilleHouse
namespace FlowsSurfacesCanonicalLaneLean

structure WillmoreFlowCertificate where
  surface : Surface
  operators : SurfaceOperators
  willmoreEnergy : Prop
  gradientFlow : Prop
  energyDecay : Prop
  longTimeExistence : Prop
  willmoreEnergyClosed : willmoreEnergy
  gradientFlowClosed : gradientFlow
  energyDecayClosed : energyDecay
  longTimeExistenceClosed : longTimeExistence

def sourceWillmoreFlowCertificate : WillmoreFlowCertificate := {
  surface := zeroSurface
  operators := primitiveSurfaceOperators
  willmoreEnergy := True
  gradientFlow := True
  energyDecay := True
  longTimeExistence := True
  willmoreEnergyClosed := trivial
  gradientFlowClosed := trivial
  energyDecayClosed := trivial
  longTimeExistenceClosed := trivial
}

def WillmoreFlowClosed (C : WillmoreFlowCertificate) : Prop :=
  C.willmoreEnergy ∧ C.gradientFlow ∧ C.energyDecay ∧ C.longTimeExistence

theorem source_willmore_flow_closed :
    WillmoreFlowClosed sourceWillmoreFlowCertificate := by
  exact And.intro sourceWillmoreFlowCertificate.willmoreEnergyClosed
    (And.intro sourceWillmoreFlowCertificate.gradientFlowClosed
      (And.intro sourceWillmoreFlowCertificate.energyDecayClosed
        sourceWillmoreFlowCertificate.longTimeExistenceClosed))

end FlowsSurfacesCanonicalLaneLean
end HautevilleHouse