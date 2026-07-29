import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FlowsSurfacesCanonicalLaneLean

abbrev Point := Fin 3 → ℝ
abbrev Vector := Fin 3 → ℝ
abbrev SurfaceParameter := ℝ × ℝ

structure RiemannianMetric where
  g : Point → (Fin 3 → Fin 3 → ℝ)
  symmetric : ∀ p u v, g p u v = g p v u
  positiveDefinite : ∀ p v, v ≠ (0 : Vector) → g p v v > 0

structure Surface where
  embedding : SurfaceParameter → Point
  metric : RiemannianMetric
  inducedMetric : ∀ (u : SurfaceParameter), 
    metric.g (embedding u) = metric.g (embedding u)

structure GaussianCurvature where
  K : SurfaceParameter → ℝ

structure MeanCurvature where
  H : SurfaceParameter → ℝ

def zeroSurface : Surface := {
  embedding := λ _ => (0,0,0),
  metric := {
    g := λ _ _ _ => 0,
    symmetric := by intro p u v; simp,
    positiveDefinite := by intro p v h; exfalso; exact h rfl
  },
  inducedMetric := λ _ => rfl
}

def zeroGaussianCurvature : GaussianCurvature := { K := λ _ => 0 }
def zeroMeanCurvature : MeanCurvature := { H := λ _ => 0 }

end FlowsSurfacesCanonicalLaneLean
end HautevilleHouse