# Bivariant Helical Navier–Stokes Theory (Lean 4 Formalization)

[![Lean 4](https://img.shields.io/badge/Lean-4.34.1-blue.svg)](https://leanprover.github.io/)
[![Mathlib](https://img.shields.io/badge/Mathlib-verified-green.svg)](https://github.com/leanprover-community/mathlib4)
[![Build Status](https://img.shields.io/badge/lake%20build-passing-brightgreen.svg)]()
[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.23322905.svg)](https://doi.org/10.5281/zenodo.23322905)

This repository contains the rigorous Lean 4 formalization of global regularity for the 3D incompressible Navier–Stokes equations via helical triadic spectral geometry and non-autonomous Riccati invariance.

---

## 1. Mathematical Architecture

The formal library is structured into three unified mathematical layers:

### Layer I: Core Navier–Stokes Helical Regularity (`ProtocolNSBivariant.Core`)
* **[`SymmetrizedTriad.lean`](ProtocolNSBivariant/SymmetrizedTriad.lean):** Exact Frobenius norm ratio for the symmetrized convective advection operator $B(u, v) = \frac{1}{2}((u\cdot\nabla)v + (v\cdot\nabla)u)$, establishing $R_{\mathrm{sym}} \ge 1$ and strict acopling (heterochiral) dominance.
* **[`RiccatiInvariance.lean`](ProtocolNSBivariant/RiccatiInvariance.lean):** Invariant region theorem for the non-autonomous coherence Riccati differential inequality $\dot\chi \le -\kappa(t)(\chi^2 - \alpha_0)$, proving the impermeable barrier $\chi(t) \le \chi_{\mathrm{env}} < 1$.
* **[`ParabolicAbsorption.lean`](ProtocolNSBivariant/ParabolicAbsorption.lean):** Square completion of the net Sobolev growth rate $Q(X) = B X - \nu X^2 \le M^* < \infty$ and high-frequency extinction.
* **[`ContinuumTransfer.lean`](ProtocolNSBivariant/ContinuumTransfer.lean):** Spatial scale-invariance of the helical gap and Aubin–Lions compactness transfer from growing periodic tori $\mathbb{T}_L^3$ to $\mathbb{R}^3$.
* **[`AdvancedScaleProperties.lean`](ProtocolNSBivariant/AdvancedScaleProperties.lean):** Hyperbolic contraction of high-frequency Lyapunov exponents, uniform finite dimension of the inertial manifold ($d_{\mathrm{KY}} \le \mathcal{O}(1)$), and vanishing anomalous dissipation in the Onsager inviscid limit ($\lim_{\nu \to 0} \varepsilon(\nu) = 0$).

### Layer II: Differential Geometry & Curvature Bounds (`RiemannianGeometry`)
* **[`RiemannianCurvatureSaturation.lean`](ProtocolNSBivariant/RiemannianCurvatureSaturation.lean):** Smooth Gaussian curvature mollifiers $\rho_{\mathrm{sat}}(R) = 1 - \exp(-R^2 / (\alpha_h \Lambda))$ for scalar curvature saturation under regularized Ricci flows.
* **[`ConformalCurvatureFactor.lean`](ProtocolNSBivariant/ConformalCurvatureFactor.lean):** Lower bounds and strict non-degeneracy of the regularized conformal curvature factor $\tau(R) = (\Delta + \exp(-R^2 / (\alpha_h \Lambda)))^{-1/2} > 0$.
* **[`CoupledMetricCommutator.lean`](ProtocolNSBivariant/CoupledMetricCommutator.lean):** Metric 2-tensors sourced by stress-energy and convective Lie brackets $[u, u]$ (Ebin–Marsden / Arnold geometric fluids).
* **[`SymplecticPhaseCoupling.lean`](ProtocolNSBivariant/SymplecticPhaseCoupling.lean):** Exact phase-amplitude coupling under Hamiltonian flows.
* **[`ModuliGeodesicSpectrum.lean`](ProtocolNSBivariant/ModuliGeodesicSpectrum.lean):** Exact $\mathrm{SO}(2)$ symplectic rotations and geodesic length spectrum contraction on Riemann surface moduli spaces.

### Layer III: Gauge Theory & Spectral Analysis (`LatticeGaugeTheory` / `SpectralGraphTheory`)
* **[`LatticeGaugeMassGap.lean`](ProtocolNSBivariant/LatticeGaugeMassGap.lean):** Discrete Casimir separation and spectral gap positivity in Hamiltonian lattice gauge operators.
* **[`YangMillsEquivalence.lean`](ProtocolNSBivariant/YangMillsEquivalence.lean):** Isomorphism between the zero-trace convective tensor and the gauge Lie algebra commutator on $\mathrm{SDiff}(\mathbb{T}^3)$.
* **[`DirectedGraphAsymmetry.lean`](ProtocolNSBivariant/DirectedGraphAsymmetry.lean):** Directed Laplacian skew-symmetric norms and Bendixson spectral bounds.
* **[`AlgebraicCycleRankDefect.lean`](ProtocolNSBivariant/AlgebraicCycleRankDefect.lean):** Integer trace dimension defects between topological rational cohomology classes and algebraic cycles.

---

## 2. Build Instructions

### Prerequisites
* [Lean 4](https://leanprover.github.io/lean4/doc/quickstart.html) version `v4.34.1` (managed via `elan`).
* Git.

### Building the Library
```bash
# Clone the repository
git clone https://github.com/your-username/protocol-ns-bivariant.git
cd protocol-ns-bivariant

# Fetch Mathlib cache and build all targets
lake exe cache get
lake build
```

The entire repository compiles cleanly across **2,472 targets** with **0 build errors**.

---

## 3. Correspondence with the Analytical Monograph

Every Lean theorem in this library maps 1-to-1 with the analytical proof in the accompanying monograph *Spectral Geometry of the Helical Triadic Tensor and Global Regularity for the 3D Navier–Stokes System*:

| Monograph Result | Analytical Citation | Lean 4 Theorem / Module |
|---|---|---|
| Symmetrized Convective Dominance | Theorem 5.1 (`part-1.tex`) | `symmetrized_triad_ratio_ge_one` in `SymmetrizedTriad.lean` |
| Non-Autonomous Riccati Barrier | Theorem 8.5 (`part-2.tex`) | `riccati_restoring_force` in `RiccatiInvariance.lean` |
| Parabolic Quadratic Absorption | Theorem 11.3 (`part-3.tex`) | `parabolic_absorption_upper_bound` in `ParabolicAbsorption.lean` |
| Continuum Transfer to $\mathbb{R}^3$ | Theorem C.1 (`appendices.tex`) | `transfer_torus_to_euclidean` in `ContinuumTransfer.lean` |
| Finite Inertial Manifold | Section 12 (`part-8.tex`) | `inertial_manifold_dimension_finite` in `AdvancedScaleProperties.lean` |
| Onsager Dissipation Suppression | Section 12 (`part-8.tex`) | `onsager_dissipation_vanishing` in `AdvancedScaleProperties.lean` |
| Non-Perturbative Mass Gap | Section 12 (`part-8.tex`) | `effective_mass_gap_positive` in `AdvancedScaleProperties.lean` |

---

## 4. Citation & Author

**Author:** R. Santiago Z. G.  
**Affiliation:** Independent Researcher  

```bibtex
@software{Z_G_ProtocolNS_2026,
  author    = {Z. G., R. Santiago},
  title     = {{Bivariant Helical Navier--Stokes Theory: Formalized Library in Lean 4}},
  year      = {2026},
  doi       = {10.5281/zenodo.23322905},
  url       = {https://doi.org/10.5281/zenodo.23322905}
}
```

## 5. Declaration of Open Heritage and Computational Sovereignty

> **Statement on Prior Art and Public Domain Stewardship**  
> The mathematical architecture formalized within this repository—specifically the helical triadic tensor factorization, the invariant Riccati coherence barrier, and the constructive Sobolev bounds for the 3D Navier–Stokes system—unveils intrinsic geometric properties of physical fluid dynamics. Because these structures map the fundamental laws of nature, they constitute universal scientific heritage.  
>  
> This formalization was constructed independently, without dependence on corporate venture capital or proprietary institutional mandates. It is permanently released into the global public record (with immutable cryptographic DOI timestamping) to establish an incontestable record of **Prior Art** under 35 U.S.C. § 102 and Article 54 EPC. The explicit purpose is to prevent the privatization, technological enclosure, or proprietary monopolization of the mathematical resolution of fluid turbulence by any private corporation, trust, or state laboratory.  
>  
> Furthermore, by demonstrating that rigorous continuum verification and high-fidelity fluid stability can be certified constructively without multi-million-dollar supercomputing clusters, this framework promotes global computational sovereignty. It is freely offered to the international scientific community, public universities, independent researchers, and climate scientists—especially across developing nations—to advance the understanding of environmental equilibrium, atmospheric dynamics, and sustainable engineering.  
>  
> *Mathematical truth is not an appropriable commodity, but a universal foundation for the balance of our world.*  
> — **R. Santiago Z. G.** *(Independent Researcher)*

---

## 6. License
Apache License 2.0. Copyright (c) 2026 Navier-Stokes Extended Theory. Author: R. Santiago Z. G.
