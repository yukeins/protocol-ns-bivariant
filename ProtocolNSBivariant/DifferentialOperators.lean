/-
Copyright (c) 2026 Navier-Stokes Extended Theory. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Navier-Stokes Formalization Team
-/

import ProtocolNSBivariant.HilbertSpaces
import Mathlib.Analysis.InnerProductSpace.Basic

/-!
# Differential Operators

We define the dissipation operator D, representing the Laplacian in Fourier space.
It acts as a diagonal, positive-definite linear operator D = |k|^2.
-/

namespace ProtocolNSBivariant

variable {K : Type*} [Fintype K] [DecidableEq K]

-- The wave vector magnitude squared for each mode k.
-- We abstract this as a function from K to ℝ.
variable (k_sq : K → ℝ)

-- The dissipation operator is a linear map that scales each mode by its |k|^2.
def dissipationOperator : StateSpace K →ₗ[ℂ] StateSpace K where
  toFun := fun ψ k ↦ (k_sq k : ℂ) * ψ k
  map_add' := by
    intro x y
    funext k
    simp [mul_add]
  map_smul' := by
    intro c x
    funext k
    exact mul_left_comm (k_sq k : ℂ) c (x k)

end ProtocolNSBivariant
