#!/usr/bin/env bash
set -euo pipefail

# Run this from your Obsidian root (e.g. /d/New Obsidian/New Obsidian)

BASE="Keyes-Cloud-Solutions"

# Top-level Keyes Cloud Solutions folders
mkdir -p "$BASE"
mkdir -p "$BASE/00-Shared-Templates"/{AWS-Templates,GCP-Templates,Azure-Templates,MultiCloud-Patterns,Module-Library}
mkdir -p "$BASE/Portfolio"/{Case-Studies,Images,Website-Files}

# Define 3 projects
PROJECTS=(
  "Project-01-AWS-GCP-MultiCloud"
  "Project-02-AWS-Network-Redesign"
  "Project-03-GCP-DataCenter-Migration"
)

for PROJ in "${PROJECTS[@]}"; do
  ROOT="$BASE/$PROJ"

  echo "Creating structure for $ROOT"

  # Architecture
  mkdir -p "$ROOT/Architecture"/{Diagrams,Design-Docs,Reference}

  # Terraform layout (per project)
  mkdir -p "$ROOT/Terraform"/{AWS,GCP,Modules,env-dev,env-prod}

  # Documentation (Instructor + Portfolio versions)
  mkdir -p "$ROOT/Documentation"/{Instructor-Version,Portfolio-Version}

  # Testing and results
  mkdir -p "$ROOT/Testing/Test-Results"/{ping-tests,traceroute-tests,web-access-tests}

  # Deliverables (PDFs, final docs, etc.)
  mkdir -p "$ROOT/Deliverables"

  # Assets (screenshots, exports)
  mkdir -p "$ROOT/Assets"/{Screenshots,Exports/PNG,Exports/PDF}

  # Local-only area (ignored from Git / portfolio)
  mkdir -p "$ROOT/Local-Only"
done

echo "Keyes Cloud Solutions folder structure created."

