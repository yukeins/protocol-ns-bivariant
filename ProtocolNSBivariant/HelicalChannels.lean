/-
Copyright (c) 2026 Navier-Stokes Extended Theory. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Navier-Stokes Formalization Team
-/

import ProtocolNSBivariant.HilbertSpaces
import ProtocolNSBivariant.AdvectionTensor

/-!
# Helical Channels

We define the topological decomposition of the advection tensor into
Homochiral and Heterochiral channels based on the helical parity of the interacting modes.
-/

namespace ProtocolNSBivariant

variable {K : Type*} [Fintype K] [DecidableEq K]

-- A simple inductive type to represent helical parity (spin direction).
inductive HelicalParity
  | positive
  | negative
deriving DecidableEq

-- A function that assigns a parity to each active mode.
variable (parity : K → HelicalParity)

-- An interaction channel between two modes is defined by their parities.
-- Homochiral: Same parity (stabilizing brake).
-- Heterochiral: Opposite parity (stretching/motor).
def isHomochiral (k1 k2 : K) : Prop := parity k1 = parity k2
def isHeterochiral (k1 k2 : K) : Prop := parity k1 ≠ parity k2

-- A boolean evaluation for computable contexts
def isHomochiralBool (k1 k2 : K) : Bool := parity k1 == parity k2

end ProtocolNSBivariant
