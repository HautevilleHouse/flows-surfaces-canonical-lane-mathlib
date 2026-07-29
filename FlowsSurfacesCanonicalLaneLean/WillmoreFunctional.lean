import canonicalLaneMathlib.AdmissibleClass
import FlowsSurfacesCanonicalLaneLean.SurfaceGeometry

namespace HautevilleHouse
namespace FlowsSurfacesCanonicalLaneLean

structure WillmoreFunctional where
  surface : Surface
  integrand : SurfaceParameter → ℝ
  integral : ℝ
  finite : integral < ⊤

def squareMeanCurvature (H : MeanCurvature) : SurfaceParameter → ℝ := λ p => (H.H p)^2

def zeroWillmoreFunctional : WillmoreFunctional := {
  surface := zeroSurface,
  integrand := λ _ => 0,
  integral := 0,
  finite := by norm_num
}

theorem zero_willmore_integral_finite : zeroWillmoreFunctional.finite := by
  exact zeroWillmoreFunctional.finite

theorem willmore_integral_nonneg (W : WillmoreFunctional) : 0 ≤ W.integral := by
  sorry

end FlowsSurfacesCanonicalLaneLean
end HautevilleHouse