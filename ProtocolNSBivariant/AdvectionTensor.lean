/-
Copyright (c) 2026 Navier-Stokes Extended Theory. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Navier-Stokes Formalization Team
-/

import ProtocolNSBivariant.HilbertSpaces
import Mathlib.LinearAlgebra.BilinearMap

/-!
# Advection Tensor

We formalize the non-linear convective term of the Navier-Stokes equations
as a bilinear tensor Γ in the Fourier space.
-/

namespace ProtocolNSBivariant

variable {K : Type*} [Fintype K] [DecidableEq K]

-- The advection tensor is fundamentally a bilinear map that takes two velocity
-- fields (spinors) and returns the advected field.
-- Γ : Ψ × Ψ → Ψ
variable (Γ_map : StateSpace K →ₗ[ℂ] StateSpace K →ₗ[ℂ] StateSpace K)

-- The quadratic form for self-interaction representing the physical advection.
def advection (ψ : StateSpace K) : StateSpace K :=
  Γ_map ψ ψ

end ProtocolNSBivariant
