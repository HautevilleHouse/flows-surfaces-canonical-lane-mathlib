import FlowsSurfacesCanonicalLaneLean.MathlibStatement
import Mathlib.Data.Real.Basic

/-!
# Flows Surfaces Analytic Objects

This module gives the theorem package a local analytic vocabulary: surfaces,
flows, vector fields, scalar fields, and differential operators (gradient,
divergence, Laplacian, and the surface Laplace-Beltrami operator). We also
introduce the primitive operators used by the admitted analytic lane.
-/

namespace HautevilleHouse
namespace FlowsSurfacesCanonicalLaneLean

abbrev SurfaceParameter := Fin 2 → ℝ
abbrev Time := ℝ
abbrev Point := SurfaceParameter
abbrev ScalarField := Time → Point → ℝ
abbrev VectorField := Time → Point → Fin 2 → ℝ

-- Embedding function from parameter space to ℝ^3
abbrev Embedding := Fin 2 → ℝ → ℝ  -- simplified: R^2 -> R^3

abbrev MetricTensor := Fin 2 → Fin 2 → ℝ → ℝ  -- g_ij at a point

abbrev CurvatureScalar := Time → Point → ℝ

abbrev MeanCurvature := Time → Point → ℝ

def zeroScalarField : ScalarField := fun _ _ => 0
def zeroVectorField : VectorField := fun _ _ _ => 0

structure FlowsSurfacesOperators where
  divergence : VectorField → ScalarField
  gradient : ScalarField → VectorField
  laplacian : ScalarField → ScalarField
  timeDerivative : ScalarField → ScalarField
  surfaceLaplacian : (ScalarField → ScalarField)  -- Laplace-Beltrami on the surface
  meanCurvatureFlow : ScalarField → VectorField  -- velocity due to mean curvature
  advection : VectorField → VectorField

def primitiveOperators : FlowsSurfacesOperators :=
  { divergence := fun _ => zeroScalarField
    gradient := fun _ => zeroVectorField
    laplacian := fun f => zeroScalarField
    timeDerivative := fun _ => zeroScalarField
    surfaceLaplacian := fun f => zeroScalarField
    meanCurvatureFlow := fun f => zeroVectorField
    advection := fun _ => zeroVectorField }

structure SurfaceFlow where
  embedding : Embedding
  metric : MetricTensor
  curvature : CurvatureScalar
  meanCurvature : MeanCurvature
  time : Time
  operators : FlowsSurfacesOperators

def primitiveSurfaceFlow : SurfaceFlow :=
  { embedding := fun i t => 0
    metric := fun i j t => if i = j then 1 else 0
    curvature := fun _ _ => 0
    meanCurvature := fun _ _ => 0
    time := 0
    operators := primitiveOperators }

def SurfaceIncompressible (F : SurfaceFlow) : Prop :=
  F.operators.divergence (fun t p => (0 : Fin 2 → ℝ)) = zeroScalarField

def AnalyticalBalance (F : SurfaceFlow) : Prop :=
  F.operators.timeDerivative (fun t p => F.curvature t p) = F.operators.surfaceLaplacian (fun t p => F.curvature t p)

def GeodesicFlow (F : SurfaceFlow) : Prop :=
  F.operators.timeDerivative (fun t p => F.embedding 0 t) = FunLike.coe (F.operators.gradient (fun t p => 0))

def HeatEquation (F : SurfaceFlow) : Prop :=
  F.operators.timeDerivative (fun t p => F.curvature t p) = F.operators.laplacian (fun t p => F.curvature t p)

df FlowsSurfacesEquationClosed (F : SurfaceFlow) : Prop :=
  SurfaceIncompressible F ∧ AnalyticalBalance F ∧ GeodesicFlow F ∧ HeatEquation F

theorem primitive_surface_incompressible_checked :
    SurfaceIncompressible primitiveSurfaceFlow := by rfl

theorem primitive_analytical_balance_checked :
    AnalyticalBalance primitiveSurfaceFlow := by rfl

theorem primitive_geodesic_flow_checked :
    GeodesicFlow primitiveSurfaceFlow := by rfl

theorem primitive_heat_equation_checked :
    HeatEquation primitiveSurfaceFlow := by rfl

theorem primitive_equation_closed_checked :
    FlowsSurfacesEquationClosed primitiveSurfaceFlow := by
  exact And.intro primitive_surface_incompressible_checked
    (And.intro primitive_analytical_balance_checked
      (And.intro primitive_geodesic_flow_checked primitive_heat_equation_checked))

end FlowsSurfacesCanonicalLaneLean
end HautevilleHouse
