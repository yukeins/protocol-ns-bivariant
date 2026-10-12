/-
Copyright (c) 2026 Navier-Stokes Extended Theory. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Navier-Stokes Formalization Team
-/

import ProtocolNSBivariant.HilbertSpaces
import Mathlib.Algebra.Lie.Basic
import Mathlib.Analysis.InnerProductSpace.Basic

/-!
# Lie Algebra Structure

We endow the StateSpace with a Lie Algebra structure, effectively 
treating the Fourier basis elements as generators of su(N).
-/

namespace ProtocolNSBivariant

variable {K : Type*} [Fintype K] [DecidableEq K]

-- We abstract that StateSpace K can be endowed with a Lie algebra structure over ℂ.
-- This requires proving that the bracket operation is alternating and satisfies Jacobi.
-- We state this as an axiom/class for the specific advection bracket.

class BivariantLieAlgebra [LieRing (StateSpace K)]
    (Γ_map : StateSpace K →ₗ[ℂ] StateSpace K →ₗ[ℂ] StateSpace K) where
  -- The bilinear map acts exactly as the Lie Bracket
  bracket_eq_tensor : ∀ (x y : StateSpace K), ⁅x, y⁆ = Γ_map x y

end ProtocolNSBivariant
