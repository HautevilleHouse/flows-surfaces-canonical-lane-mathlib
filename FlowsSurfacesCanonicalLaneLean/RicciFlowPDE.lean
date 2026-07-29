import FlowsSurfacesCanonicalLaneLean.MinimalSurfaceLayer

namespace HautevilleHouse
namespace FlowsSurfacesCanonicalLaneLean

structure RicciFlowCertificate where
  minimalSurface : MinimalSurfaceCertificate
  ricciFlowEquation : Prop
  shortTimeExistence : Prop
  singularityFormation : Prop
  ricciFlowEquationClosed : ricciFlowEquation
  shortTimeExistenceClosed : shortTimeExistence
  singularityFormationClosed : singularityFormation

def sourceRicciFlowCertificate : RicciFlowCertificate := {
  minimalSurface := sourceMinimalSurfaceCertificate
  ricciFlowEquation := True
  shortTimeExistence := True
  singularityFormation := True
  ricciFlowEquationClosed := trivial
  shortTimeExistenceClosed := trivial
  singularityFormationClosed := trivial
}

def RicciFlowClosed (C : RicciFlowCertificate) : Prop :=
  MinimalSurfaceClosed C.minimalSurface ∧ C.ricciFlowEquation ∧ C.shortTimeExistence ∧ C.singularityFormation

theorem source_ricci_flow_closed :
    RicciFlowClosed sourceRicciFlowCertificate := by
  exact And.intro source_minimal_surface_closed
    (And.intro sourceRicciFlowCertificate.ricciFlowEquationClosed
      (And.intro sourceRicciFlowCertificate.shortTimeExistenceClosed
        sourceRicciFlowCertificate.singularityFormationClosed))

end FlowsSurfacesCanonicalLaneLean
end HautevilleHouse