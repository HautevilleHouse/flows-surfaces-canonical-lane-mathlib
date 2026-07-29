---
# This file is required by the precedent import structure.
# It exports the core additive-lane projection, carriage, and idempotence laws
# that every domain package relies on. Copied verbatim from Navier-Stokes precedent.
---

namespace HautevilleHouse
namespace CanonicalLaneMathlibCore

structure Projection (S : Type) where
  toFun : S → S
  idempotent : ∀ x : S, toFun (toFun x) = toFun x

structure AdditiveLane (X : Type) [Add X] [Sub X] where
  state : X
  delta : X
  projection : Projection X
  carriedComponent : X
  xNext : X
  x_next_eq : xNext = state + projection.toFun delta
  carried_component_eq : carriedComponent = delta - projection.toFun delta
  projection_idempotent_on_delta : projection.toFun (projection.toFun delta) = projection.toFun delta

end CanonicalLaneMathlibCore
end HautevilleHouse

import CanonicalLaneMathlibCore

namespace HautevilleHouse
namespace FlowsSurfacesCanonicalLaneLean

open HautevilleHouse.CanonicalLaneMathlibCore

end FlowsSurfacesCanonicalLaneLean
end HautevilleHouse
