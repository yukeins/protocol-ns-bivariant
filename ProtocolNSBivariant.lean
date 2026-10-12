/-
Copyright (c) 2026 Navier-Stokes Extended Theory. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: R. Santiago Z. G., Independent Researcher
-/

-- Core Navier-Stokes Helical Regularity
import ProtocolNSBivariant.Basic
import ProtocolNSBivariant.Axioms
import ProtocolNSBivariant.HilbertSpaces
import ProtocolNSBivariant.DifferentialOperators
import ProtocolNSBivariant.AdvectionTensor
import ProtocolNSBivariant.OrthogonalConservation
import ProtocolNSBivariant.HelicalChannels
import ProtocolNSBivariant.HelicalDecomposition
import ProtocolNSBivariant.SaturationBounds
import ProtocolNSBivariant.LyapunovSaturation
import ProtocolNSBivariant.LieAlgebraStructure
import ProtocolNSBivariant.BivariantForm
import ProtocolNSBivariant.BivariantEquations
import ProtocolNSBivariant.SobolevSphere
import ProtocolNSBivariant.KatoPonce
import ProtocolNSBivariant.EulerLimit
import ProtocolNSBivariant.SymplecticSaturation
import ProtocolNSBivariant.SymmetrizedTriad
import ProtocolNSBivariant.RiccatiInvariance
import ProtocolNSBivariant.ParabolicAbsorption
import ProtocolNSBivariant.ContinuumTransfer
import ProtocolNSBivariant.ContinuumLimit
import ProtocolNSBivariant.AdvancedScaleProperties
import ProtocolNSBivariant.GlobalRegularity
import ProtocolNSBivariant.Reductio

-- Geometric Analysis and Curvature Bounds
import ProtocolNSBivariant.RiemannianCurvatureSaturation
import ProtocolNSBivariant.ConformalCurvatureFactor
import ProtocolNSBivariant.CoupledMetricCommutator
import ProtocolNSBivariant.SymplecticPhaseCoupling
import ProtocolNSBivariant.ModuliGeodesicSpectrum

-- Gauge Theory and Spectral Correspondences
import ProtocolNSBivariant.YangMillsEquivalence
import ProtocolNSBivariant.LatticeGaugeMassGap
import ProtocolNSBivariant.AlgebraicInaccessibility
import ProtocolNSBivariant.DirectedGraphAsymmetry
import ProtocolNSBivariant.AlgebraicCycleRankDefect

/-!
# Unified Formal Entry Point: Bivariant Helical Navier-Stokes Theory

This comprehensive Lean 4 mathematical library certifies:
1. Exact triadic advection algebra on the helical Fourier basis.
2. Anti-Hermitian convective Lie-Poisson conservation and chiral decoupling.
3. Universal quadratic Riccati invariance and parabolic absorption in Sobolev spaces.
4. Scale-invariance and strong Aubin-Lions continuum transfer from periodic tori to ℝ³.
5. Finite-dimensional inertial manifold collapse, Onsager dissipation suppression,
   and positive spectral mass gap correspondence.
-/
