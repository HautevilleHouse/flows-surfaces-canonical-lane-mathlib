import FlowsSurfacesCanonicalLaneLean.RicciFlowPDE

namespace HautevilleHouse
namespace FlowsSurfacesCanonicalLaneLean

structure FlowsSurfacesAnalyticCertificate where
  operators : SurfaceOperators
  surfaceFlow : SurfaceFlow
  willmoreLayer : WillmoreFlowCertificate
  minimalLayer : MinimalSurfaceCertificate
  ricciLayer : RicciFlowCertificate
  surfaceEquationClosed : Prop
  willmoreLayerClosed : Prop
  minimalLayerClosed : Prop
  ricciLayerClosed : Prop
  allLayersClosed : Prop
  surfaceEquationClosedProof : surfaceEquationClosed
  willmoreLayerClosedProof : willmoreLayerClosed
  minimalLayerClosedProof : minimalLayerClosed
  ricciLayerClosedProof : ricciLayerClosed
  allLayersClosedProof : allLayersClosed

def sourceFlowsSurfacesAnalyticCertificate : FlowsSurfacesAnalyticCertificate := {
  operators := primitiveSurfaceOperators
  surfaceFlow := primitiveSurfaceFlow
  willmoreLayer := sourceWillmoreFlowCertificate
  minimalLayer := sourceMinimalSurfaceCertificate
  ricciLayer := sourceRicciFlowCertificate
  surfaceEquationClosed := SurfaceEquationClosed primitiveSurfaceFlow
  willmoreLayerClosed := WillmoreFlowClosed sourceWillmoreFlowCertificate
  minimalLayerClosed := MinimalSurfaceClosed sourceMinimalSurfaceCertificate
  ricciLayerClosed := RicciFlowClosed sourceRicciFlowCertificate
  allLayersClosed := SurfaceEquationClosed primitiveSurfaceFlow ∧ WillmoreFlowClosed sourceWillmoreFlowCertificate ∧ MinimalSurfaceClosed sourceMinimalSurfaceCertificate ∧ RicciFlowClosed sourceRicciFlowCertificate
  surfaceEquationClosedProof := primitive_flow_surface_equation_closed
  willmoreLayerClosedProof := source_willmore_flow_closed
  minimalLayerClosedProof := source_minimal_surface_closed
  ricciLayerClosedProof := source_ricci_flow_closed
  allLayersClosedProof := by
    exact And.intro primitive_flow_surface_equation_closed
      (And.intro source_willmore_flow_closed
        (And.intro source_minimal_surface_closed source_ricci_flow_closed))
}

def FlowsSurfacesAnalyticCertificateClosed (C : FlowsSurfacesAnalyticCertificate) : Prop :=
  C.surfaceEquationClosed ∧ C.willmoreLayerClosed ∧ C.minimalLayerClosed ∧ C.ricciLayerClosed

theorem source_flows_surfaces_analytic_certificate_closed :
    FlowsSurfacesAnalyticCertificateClosed sourceFlowsSurfacesAnalyticCertificate := by
  exact And.intro sourceFlowsSurfacesAnalyticCertificate.surfaceEquationClosedProof
    (And.intro sourceFlowsSurfacesAnalyticCertificate.willmoreLayerClosedProof
      (And.intro sourceFlowsSurfacesAnalyticCertificate.minimalLayerClosedProof
        sourceFlowsSurfacesAnalyticCertificate.ricciLayerClosedProof))

end FlowsSurfacesCanonicalLaneLean
end HautevilleHouse