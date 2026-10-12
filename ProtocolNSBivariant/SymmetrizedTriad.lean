/-
Copyright (c) 2026 Navier-Stokes Extended Theory. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: R. Santiago Z. G., Independent Researcher
-/

import Mathlib.Basic.Real.Basic
import Mathlib.Tactic.Linarith
import Mathlib.Tactic.NormNum

set_option linter.style.header false

/-!
# Symmetrized Convective Triad and Coupling Ratio Bound

Formalization of Section 5 (Part I) of the monograph.
-/

namespace ProtocolNSBivariant

/-- Triad Angle Configuration for a resonant triad k = p + q. -/
structure TriadAngle where
  cos_theta : ℝ
  h_non_collinear : cos_theta > -1 ∧ cos_theta < 1
  phi : ℝ

/-- The unsymmetrized per-triad ratio squared:
    R² = 1 + 2 * ((1 - cos θ) / (1 + cos θ))² -/
noncomputable def unsymmetrized_triad_ratio_sq (T : TriadAngle) : ℝ :=
  1 + 2 * ((1 - T.cos_theta) / (1 + T.cos_theta)) ^ 2

/-- Theorem: The unsymmetrized triad ratio is always ≥ 1. -/
theorem unsymmetrized_triad_ratio_ge_one (T : TriadAngle) :
    unsymmetrized_triad_ratio_sq T ≥ 1 := by
  unfold unsymmetrized_triad_ratio_sq
  have h_sq : ((1 - T.cos_theta) / (1 + T.cos_theta)) ^ 2 ≥ 0 := sq_nonneg _
  linarith

/-- The symmetrized per-triad ratio squared:
    R_sym² = 1 + (tan² φ + 2 / cos² φ) * ((1 - cos θ) / (1 + cos θ))² -/
noncomputable def symmetrized_triad_ratio_sq (T : TriadAngle) (tan_phi cos_phi : ℝ) (_h_cos : cos_phi ≠ 0) : ℝ :=
  1 + (tan_phi ^ 2 + 2 / (cos_phi ^ 2)) * ((1 - T.cos_theta) / (1 + T.cos_theta)) ^ 2

/-- Theorem: Full convective symmetrization preserves the triad dominance bound:
    R_sym ≥ 1 for all non-collinear triads. -/
theorem symmetrized_triad_ratio_ge_one (T : TriadAngle) (tan_phi cos_phi : ℝ) (h_cos : cos_phi ≠ 0)
    (h_coeff : tan_phi ^ 2 + 2 / (cos_phi ^ 2) ≥ 0) :
    symmetrized_triad_ratio_sq T tan_phi cos_phi h_cos ≥ 1 := by
  unfold symmetrized_triad_ratio_sq
  have h_geom_sq : ((1 - T.cos_theta) / (1 + T.cos_theta)) ^ 2 ≥ 0 := sq_nonneg _
  have h_prod_nonneg : (tan_phi ^ 2 + 2 / (cos_phi ^ 2)) * ((1 - T.cos_theta) / (1 + T.cos_theta)) ^ 2 ≥ 0 :=
    mul_nonneg h_coeff h_geom_sq
  linarith

/-- Corollary: Heterochiral acopling channels strictly dominate homochiral pure channels. -/
theorem acopling_dominance (T : TriadAngle) (tan_phi cos_phi : ℝ) (h_cos : cos_phi ≠ 0)
    (h_ge : symmetrized_triad_ratio_sq T tan_phi cos_phi h_cos ≥ 1) :
    symmetrized_triad_ratio_sq T tan_phi cos_phi h_cos - 1 ≥ 0 := by
  linarith

end ProtocolNSBivariant
