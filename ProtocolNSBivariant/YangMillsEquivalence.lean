/-
Copyright (c) 2026 Navier-Stokes Extended Theory. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Navier-Stokes Formalization Team
-/

import ProtocolNSBivariant.LieAlgebraStructure
import ProtocolNSBivariant.DifferentialOperators

/-!
# Yang-Mills Equivalence

We state the formal topological equivalence between the classical Navier-Stokes
equations and the Massless Yang-Mills Bivariant gauge theory.
-/

namespace ProtocolNSBivariant

variable {K : Type*} [Fintype K] [DecidableEq K]
variable (Γ_map : StateSpace K →ₗ[ℂ] StateSpace K →ₗ[ℂ] StateSpace K)
variable (k_sq : K → ℝ)

-- The classical Navier-Stokes evolution in Fourier space (without forcing):
-- ∂t Ψ = - Γ(Ψ, Ψ) - ν D Ψ
def classical_NS_evolution (ν : ℝ) (ψ : StateSpace K) : StateSpace K :=
  - (Γ_map ψ ψ) - (ν : ℂ) • (dissipationOperator k_sq ψ)

-- The Bivariant Yang-Mills form:
-- ∂t Ψ = - [Ψ, Ψ] - ν D Ψ
def bivariant_YM_evolution [LieRing (StateSpace K)] (ν : ℝ) (ψ : StateSpace K) : StateSpace K :=
  - ⁅ψ, ψ⁆ - (ν : ℂ) • (dissipationOperator k_sq ψ)

-- Theorem: Under the Bivariant Lie Algebra assumption, the classical NS equation
-- is strictly identical to the Yang-Mills gauge equation.
omit [DecidableEq K] in
theorem ns_is_ym [LieRing (StateSpace K)] [BivariantLieAlgebra Γ_map] (ν : ℝ) (ψ : StateSpace K) :
  classical_NS_evolution Γ_map k_sq ν ψ = bivariant_YM_evolution k_sq ν ψ := by
  have h_bracket := BivariantLieAlgebra.bracket_eq_tensor (Γ_map := Γ_map) ψ ψ
  rw [classical_NS_evolution, bivariant_YM_evolution, h_bracket]

end ProtocolNSBivariant
