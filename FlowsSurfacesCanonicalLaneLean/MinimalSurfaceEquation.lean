import canonicalLaneMathlib.AdmissibleClass
import FlowsSurfacesCanonicalLaneLean.SurfaceGeometry

namespace HautevilleHouse
namespace FlowsSurfacesCanonicalLaneLean

structure MinimalSurfaceCondition where
  meanCurvatureZero : MeanCurvature
  condition : ∀ (p : SurfaceParameter), meanCurvatureZero.H p = 0

structure SecondFundamentalForm where
  II : SurfaceParameter → (Fin 2 → Fin 2 → ℝ)
  symmetric : ∀ p u v, II p u v = II p v u

def zeroSecondFundamentalForm : SecondFundamentalForm := {
  II := λ _ _ _ => 0,
  symmetric := by
    intro p u v
    simp
}

def meanCurvatureFromSecondFundamentalForm (II : SecondFundamentalForm) (metric : RiemannianMetric) : MeanCurvature := {
  H := λ p => 
    let g := metric.g (zeroSurface.embedding p)
    let h := II.II p
    (h 0 0 * g 1 1 - 2 * h 0 1 * g 0 1 + h 1 1 * g 0 0) / (g 0 0 * g 1 1 - (g 0 1)^2)
}

theorem minimal_surface_condition_zero :
  (meanCurvatureFromSecondFundamentalForm zeroSecondFundamentalForm zeroSurface.metric).H 0 = 0 := by
  simp [meanCurvatureFromSecondFundamentalForm, zeroSecondFundamentalForm, zeroSurface]

end FlowsSurfacesCanonicalLaneLean
end HautevilleHouse