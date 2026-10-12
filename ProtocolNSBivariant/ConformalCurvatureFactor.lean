/-
Copyright (c) 2026 Navier-Stokes Extended Theory. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: R. Santiago Z. G., Independent Researcher
-/

import Mathlib.Basic.Real.Basic
import Mathlib.Analysis.SpecialFunctions.Exp
import Mathlib.Tactic.Linarith
import ProtocolNSBivariant.RiemannianCurvatureSaturation

set_option linter.style.header false

/-!
# Conformal Curvature Factor Bounds

This module proves that the Gaussian curvature mollifier is strictly bounded by 1,
guaranteeing that the regularized conformal factor remains strictly positive and finite.
-/

namespace RiemannianGeometry

/-- Theorem: The curvature saturation density strictly remains below 1,
    as a consequence of the strict positivity of the exponential map. -/
theorem curvature_saturation_bounded (R alpha_h Lambda_top : ℝ) :
    curvature_saturation_density R alpha_h Lambda_top < 1 := by
  unfold curvature_saturation_density
  have h_exp_pos : 0 < Real.exp (-(R ^ 2) / (alpha_h * Lambda_top)) := Real.exp_pos _
  linarith

/-- Theorem: The radicand in the conformal factor is strictly bounded away from zero
    by the positive spectral gap parameter Delta_YM > 0. -/
theorem conformal_factor_radicand_pos (R alpha_h Lambda_top Delta_YM : ℝ)
    (h_Delta : 0 < Delta_YM) :
    1 + Delta_YM - curvature_saturation_density R alpha_h Lambda_top > 0 := by
  have h1 : curvature_saturation_density R alpha_h Lambda_top < 1 :=
    curvature_saturation_bounded R alpha_h Lambda_top
  linarith

end RiemannianGeometry
