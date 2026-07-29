import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FlowsSurfacesCanonicalLaneLean

structure RiemannSurface where
  genus : ℕ
  area : ℝ
  curvatureForm : String

def closedGeodesic (S : RiemannSurface) : Prop := True

def harmonicMap (S : RiemannSurface) : Prop := True

end FlowsSurfacesCanonicalLaneLean
end HautevilleHouse