/-
Copyright (c) 2026 Navier-Stokes Extended Theory. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Navier-Stokes Formalization Team
-/

import Mathlib.Analysis.InnerProductSpace.Basic
import Mathlib.Analysis.InnerProductSpace.PiL2

/-!
# Hilbert Spaces for Bivariant Navier-Stokes

We define the fundamental state space for the fluid in the Fourier domain.
For the rigorous Galerkin approximation, we consider a finite dimensional
inner product space over the complex numbers.
-/

namespace ProtocolNSBivariant

-- Let K be the finite index set of active Fourier modes.
variable {K : Type*} [Fintype K] [DecidableEq K]

-- The state space Ψ is the function space of complex vectors over K.
-- This represents the velocity field in the spectral domain.
abbrev StateSpace (K : Type*) [Fintype K] := K → ℂ

open scoped BigOperators

noncomputable instance instInnerStateSpace {K : Type*} [Fintype K] : Inner ℂ (StateSpace K) where
  inner x y := ∑ k, (starRingEnd ℂ) (x k) * y k

end ProtocolNSBivariant
