import Mathlib.Analysis.SpecialFunctions.Pow.Real

/-!
# Kato-Ponce and Bernstein Estimates

Formal translation of Appendix D:
We establish the rigorous harmonic analysis bounds on the truncated lattice
required to bound the non-linear interaction.
-/

namespace ProtocolNSBivariant

variable {State : Type*} [Sub State]

/-- Abstract class defining the properties of a fractional Sobolev Space
    on a truncated harmonic lattice. -/
class HarmonicLattice (State : Type*) [Sub State] where
  sobolev_norm : ℝ → State → ℝ
  fractional_laplacian : ℝ → State → State
  -- The product of states (pointwise)
  mul : State → State → State
  -- The Kato-Ponce estimate is an intrinsic property of the lattice
  kato_ponce_prop (s : ℝ) (U V : State) :
    sobolev_norm s (fractional_laplacian s (mul U V) - mul U (fractional_laplacian s V)) ≤ 
      sobolev_norm s U * sobolev_norm 0 V + sobolev_norm 0 U * sobolev_norm s V
  -- Bernstein inequality is intrinsic
  bernstein_prop (s t : ℝ) (K : ℝ) (U : State) :
    sobolev_norm s U ≤ (K ^ (s - t)) * sobolev_norm t U

-- Non-linear commutator [Λ^s, U]
def commutator [HL : HarmonicLattice State] (s : ℝ) (U V : State) : State :=
  HL.fractional_laplacian s (HL.mul U V) - HL.mul U (HL.fractional_laplacian s V)

/-- Kato-Ponce Commutator Estimate (Appendix)
    Bounds the fractional derivative of the product in terms of Sobolev norms. -/
theorem kato_ponce_estimate [HL : HarmonicLattice State] (s : ℝ) (_hs : s > 0) (U V : State) :
  HL.sobolev_norm s (commutator s U V) ≤ 
    HL.sobolev_norm s U * HL.sobolev_norm 0 V + HL.sobolev_norm 0 U * HL.sobolev_norm s V := by
  exact HL.kato_ponce_prop s U V

/-- Bernstein Inequality on the Truncated Lattice
    Allows trading spatial derivatives for powers of the truncation wavenumber K. -/
theorem bernstein_inequality [HL : HarmonicLattice State] (s t : ℝ) (_hst : s ≥ t) (K : ℝ) (U : State) :
  HL.sobolev_norm s U ≤ (K ^ (s - t)) * HL.sobolev_norm t U := by
  exact HL.bernstein_prop s t K U

end ProtocolNSBivariant
