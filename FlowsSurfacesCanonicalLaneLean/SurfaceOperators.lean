import FlowsSurfacesCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace FlowsSurfacesCanonicalLaneLean

abbrev Point := Fin 2 → ℝ
abbrev Surface := Point → ℝ
abbrev VectorField := Point → Point

def zeroSurface : Surface := fun _ => 0
def zeroVectorField : VectorField := fun _ => (0,0)

structure SurfaceOperators where
  metric : Surface → Surface → Surface
  gradient : (Surface → ℝ) → VectorField
  laplacian : Surface → Surface
  divergence : VectorField → Surface
  meanCurvature : Surface → Surface
  gaussCurvature : Surface → Surface

def primitiveSurfaceOperators : SurfaceOperators := {
  metric := fun _ _ => 0
  gradient := fun _ => zeroVectorField
  laplacian := fun _ => 0
  divergence := fun _ => 0
  meanCurvature := fun _ => 0
  gaussCurvature := fun _ => 0
}

structure SurfaceFlow where
  surface : Surface
  velocity : VectorField
  time : ℝ
  operators : SurfaceOperators

def primitiveSurfaceFlow : SurfaceFlow := {
  surface := zeroSurface
  velocity := zeroVectorField
  time := 0
  operators := primitiveSurfaceOperators
}

def IsMinimal (S : Surface) (ops : SurfaceOperators) : Prop :=
  ops.meanCurvature S = zeroSurface

def Harmonic (f : Surface → ℝ) (ops : SurfaceOperators) : Prop :=
  ops.laplacian (fun x => f x) = zeroSurface

def IncompressibleFlow (F : SurfaceFlow) : Prop :=
  F.operators.divergence F.velocity = zeroSurface

def SurfaceEquationClosed (F : SurfaceFlow) : Prop :=
  IsMinimal F.surface F.operators ∧ IncompressibleFlow F

theorem primitive_flow_surface_equation_closed :
    SurfaceEquationClosed primitiveSurfaceFlow := by
  unfold SurfaceEquationClosed IsMinimal IncompressibleFlow primitiveSurfaceFlow
  simp [primitiveSurfaceOperators, zeroSurface, zeroVectorField]

end FlowsSurfacesCanonicalLaneLean
end HautevilleHouse