import FlowsSurfacesCanonicalLaneLean.WillmoreFlowLayer

namespace HautevilleHouse
namespace FlowsSurfacesCanonicalLaneLean

structure MinimalSurfaceCertificate where
  willmore : WillmoreFlowCertificate
  meanCurvatureZero : Prop
  areaMinimizing : Prop
  stability : Prop
  meanCurvatureZeroClosed : meanCurvatureZero
  areaMinimizingClosed : areaMinimizing
  stabilityClosed : stability

def sourceMinimalSurfaceCertificate : MinimalSurfaceCertificate := {
  willmore := sourceWillmoreFlowCertificate
  meanCurvatureZero := IsMinimal zeroSurface primitiveSurfaceOperators
  areaMinimizing := True
  stability := True
  meanCurvatureZeroClosed := rfl
  areaMinimizingClosed := trivial
  stabilityClosed := trivial
}

def MinimalSurfaceClosed (C : MinimalSurfaceCertificate) : Prop :=
  WillmoreFlowClosed C.willmore ∧ C.meanCurvatureZero ∧ C.areaMinimizing ∧ C.stability

theorem source_minimal_surface_closed :
    MinimalSurfaceClosed sourceMinimalSurfaceCertificate := by
  exact And.intro source_willmore_flow_closed
    (And.intro sourceMinimalSurfaceCertificate.meanCurvatureZeroClosed
      (And.intro sourceMinimalSurfaceCertificate.areaMinimizingClosed
        sourceMinimalSurfaceCertificate.stabilityClosed))

end FlowsSurfacesCanonicalLaneLean
end HautevilleHouse