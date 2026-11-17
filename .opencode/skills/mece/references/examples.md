# MECE Decomposition — Reference Examples

This file contains worked-out MECE decompositions that the agent
may reference when asked about specific domains.

## Problem trees

### Revenue decline (formula lens)

```
Revenue decline
├── Price effect
│   ├── Average price per unit ↓
│   └── Discounting / promo depth ↑
└── Volume effect
    ├── New customers ↓
    │   ├── Inorganic channel ↓
    │   └── Organic channel ↓
    └── Existing customers ↓
        ├── Churn ↑
        └── Purchases per customer ↓
```

### Rising operational costs (formula + components lens)

```
Cost increase
├── Fixed costs
│   ├── Personnel
│   ├── Facilities
│   └── Licences / subscriptions
└── Variable costs
    ├── Per-unit production
    ├── Logistics / shipping
    └── Payment processing fees
```

### User churn (process + stakeholder lens)

```
Churn
├── Involuntary (payment failure)
│   ├── Expired card
│   ├── Insufficient funds
│   └── Bank block
└── Voluntary (user cancels)
    ├── Price sensitivity
    ├── Missing feature
    ├── Poor experience
    └── Switched to competitor
```

## User stories

### Feature: "self-serve dashboard"

```text
## [View dashboard]
Goal: User sees key metrics at a glance
Scope: Read-only metrics for authenticated users

### US-01 — View overview metrics
As a logged-in user, I want to see key
metrics (revenue, active users, churn) on
the dashboard, so that I can assess system
health without opening reports.

Acceptance criteria:
- Given I am logged in, when I navigate to
  /dashboard, then I see revenue, active
  users, and churn metrics.
- Given I am not logged in, when I navigate
  to /dashboard, then I am redirected to
  /login.
- Given the data source is down, when I
  load /dashboard, then I see a degraded
  message without crashing.

Dependencies: Metrics API must be available.
Open questions / assumptions: Refresh rate is
not specified; assume 5-minute refresh.

### US-02 — Refresh dashboard data
As a user, I want to manually refresh
the dashboard, so that I can see the
latest data.

Acceptance criteria:
- Given I am on the dashboard, when I
  click "Refresh", then all metrics update
  with a loading indicator.
- Given the refresh fails, when the API
  returns an error, then I see the error
  message and my existing data remains.

Dependencies: None (depends on US-01).
Open questions / assumptions: None.
```

## IAC / platform engineering examples

### Case: "Design and operate a cloud-native PKI & SSL system for short-lived certificates"

**Problem statement:** The team needs a cloud-native, open-source PKI and SSL
management system that can fully automate the lifecycle of short-lived
certificates (e.g. 24-hour TLS certs) across a multi-cluster Kubernetes
environment, without manual renewal or downtime.

**Chosen lens:** Components / layers (infrastructure stack) + Process
(certificates lifecycle)

```
Cloud-native PKI & SSL system
├── 1. Certificate Authority (the trust anchor)
│   ├── 1a. CA software selection
│   │   ├── Root CA (long-lived, offline, HSM-protected)
│   │   └── Intermediate CA (short-lived, operational)
│   │       └── Candidates: step-ca / smallstep, Vault PKI,
│   │           cert-manager + Vault, boulder (ACME)
│   ├── 1b. Key management
│   │   ├── Key generation (algorithm, key size)
│   │   ├── Key storage (HSM / KMS / secrets manager)
│   │   └── Key rotation schedule
│   └── 1c. Trust chain distribution
│       ├── Root CA public key to all nodes
│       ├── Intermediate CA chain to services
│       └── CRL / OCSP resolver deployment
│
├── 2. Certificate lifecycle (process lens)
│   ├── 2a. Issuance
│   │   ├── CSR generation (automation pipeline)
│   │   ├── Policy validation (SAN, key usage, TTL)
│   │   └── Actual signing (intermediate CA)
│   ├── 2b. Distribution
│   │   ├── Push to workload (mounted secrets / files)
│   │   ├── Pull by workload (sidecar / agent)
│   │   └── ACME protocol (client auto-renewal)
│   ├── 2c. Renewal (automated, short-lived)
│   │   ├── Pre-expiry trigger (e.g. 80% of TTL)
│   │   ├── New CSR + sign
│   │   └── Zero-downt swap (hot-reload or graceful restart)
│   ├── 2d. Revocation
│   │   ├── Compromised key → immediate revoke
│   │   ├── CRL distribution point
│   │   └── OCSP responder availability
│   └── 2e. Audit & compliance
│       ├── All issuance / revocation logged (immutable)
│       ├── Certificate inventory / CMDB sync
│       └── Compliance reports (expiration, rotation SLA)
│
├── 3. Kubernetes integration (platform layer)
│   ├── 3a. Certificate resource (cert-manager CRD)
│   │   ├── Certificate custom resource definition
│   │   ├── CertificateRequest controller
│   │   └── Issuer / ClusterIssuer configuration
│   ├── 3b. Secret management
│   │   ├── TLS secrets in namespace
│   │   ├── Mount as volume to pods
│   │   └── Auto-reload via fsnotify / Nginx reload
│   └── 3c. Multi-cluster coordination
│       ├── Shared CA access (cross-cluster connectivity)
│       ├── Consistent policy enforcement
│       └── Failover CA (backup / DR)
│
├── 4. Operational concerns
│   ├── 4a. High availability
│   │   ├── CA cluster (minimum 3 nodes)
│   │   ├── Load balancer / service mesh ingress
│   │   └── Database/backend HA (etcd / PostgreSQL)
│   ├── 4b. Security & access control
│   │   ├── mTLS between all components
│   │   ├── Role-based access to issue / revoke
│   │   ├── Network policies (whitelist only)
│   │   └── Audit logging (SIEM integration)
│   ├── 4c. Observability
│   │   ├── Certificate expiry alerts (>30d, >7d, >24h)
│   │   ├── Revocation events
│   │   ├── CA health / uptime metrics
│   │   └── Prometheus / Grafana dashboards
│   └── 4d. DR / disaster recovery
│       ├── Root CA key backup (HSM redundancy)
│       ├── CA database backup / restore procedure
│       └── DR site CA failover test
│
└── 5. Migration & rollout
    ├── 5a. Greenfield deployment (new services)
    │   ├── Deploy CA cluster
    │   ├── Deploy cert-manager
    │   ├── Configure Issuer
    │   └── Deploy agent / sidecar to workloads
    ├── 5b. Brownfield migration (existing services)
    │   ├── Inventory current certificates
    │   ├── Priority: internal → external, high → low risk
    │   ├── Replace long-lived with short-lived per service
    │   └── Retire old CA keys after overlap period
    └── 5c. Organizational readiness
        ├── Team training (ops, dev, security)
        ├── Runbook creation
        └── Change management approval
```

**MECE check:**
- Overlap: Issuance (2a) en Distribution (2b) scheiden "wordt gemaakt"
  van "wordt geleverd". Geen overlap.
- Gap: DR (4d) ontbreekt — toegevoegd als sub-branch onder Operations.
- Edge cases: Root CA key compromise scenario's niet gedekt — toegevoegd
  onder 4b als "Compromised key → immediate revoke".
- Out of scope: Certificate signing voor code-signing (gespecialiseerd
  buiten scope van dit project).

**Next steps (prioritized):**

| ID | Node | Priority | Next action |
|----|------|----------|-------------|
| 1a | CA software selection | P0 | Compare step-ca vs Vault PKI vs ACME (boulder) |
| 1b | Key management | P0 | Design key lifecycle aligned with short cert TTL |
| 3a | cert-manager integration | P1 | Deploy cert-manager in staging cluster |
| 2c | Short-lived renewal pipeline | P1 | Implement 24h cert auto-renewal PoC |
| 4a | CA high availability | P1 | Design 3-node CA cluster architecture |
| 5b | Brownfield migration plan | P2 | Inventory existing certs before architecture decision |
| 4d | DR procedure | P3 | Document CA backup / restore procedure |

**Assumptions:**
- Kubernetes 1.25+ across all clusters
- Team has operator-level access to cluster namespaces
- Budget allows open-source only (no commercial CA)
- Certificate TTL target: 24 hours (industry best practice per
  Mozilla/CABC rules)

**Open questions:**
- Root CA: on-premises HSM available, or cloud KMS required?
- Multi-cluster: geographically distributed or single-region?
- Existing certificate inventory — estimated volume (thousands or millions
  of certs per year)?
- ACME protocol: supported by chosen CA software? Required by any
  client workload?

---

### Case: "Design a CI/CD pipeline for infrastructure-as-code"

**Problem statement:** The team needs a CI/CD pipeline that validates,
secrets-scans, tests, and deploys Infrastructure-as-Code (Terraform,
Ansible, Kubernetes manifests) from commit to production with
mandatory gatechecks.

**Chosen lens:** Process (pipeline stages) + Components (tools / gates)

```
IaC CI/CD Pipeline
├── 1. Commit / trigger
│   ├── 1a. Code committed to feature branch
│   └── 1b. PR opened → pipeline triggers
├── 2. Validation gates
│   ├── 2a. Lint (terraform validate / ansible-lint)
│   ├── 2b. Static analysis (Checkov / tfsec / ansible-semaphore)
│   ├── 2c. Secrets scanning (gitleaks / truffleHog)
│   └── 2d. Policy as code (Open Policy Agent / Conftest)
├── 3. Planning / preview
│   ├── 3a. Terraform plan (show changes)
│   ├── 3b. Drift detection (compare state vs live)
│   └── 3c. Cost estimation (infracost)
├── 4. Approval
│   ├── 4a. Peer review (required reviewers)
│   ├── 4b. Security review (for infra changes)
│   └── 4c. Manual approve gate (for production)
├── 5. Apply / deploy
│   ├── 5a. Staging environment (ephemeral or shared)
│   ├── 5b. Integration tests (provisioned infra)
│   └── 5c. Production apply (scheduled window or gated)
└── 6. Post-deploy
    ├── 6a. State file sync / locking
    ├── 6b. Compliance reporting (audit trail)
    └── 6c. Rollback procedure (if post-deploy tests fail)
```

**MECE check:**
- Overlap: Validation (2) en Planning (3) scheiden "is dit geldig" van
  "wat verandert er". Geen overlap.
- Gap: Post-deploy rollback (6c) ontbreekt — toegevoegd als sub-branch.
- Edge cases: Rollback na partial apply — gedekt onder 6c.

**Next actions (prioritized):**

| ID | Node | Priority | Next action |
|----|------|----------|-------------|
| 2b | Static analysis | P0 | Integrate Checkov / tfsec into pipeline |
| 2c | Secrets scanning | P0 | Integrate gitleks into pre-commit + CI |
| 3a | Terraform plan | P1 | Add "terraform plan" to all PR pipelines |
| 5a | Staging environment | P1 | Provision ephemeral staging per PR |
| 4c | Production approval gate | P1 | Configure manual gate in pipeline |
| 6c | Rollback procedure | P2 | Document rollback runbook |

**Assumptions:**
- Terraform state stored in remote backend (S3 + DynamoDB lock)
- All infrastructure provisioned via IaC (no manual changes)
- Production changes require manual approval (4c).

**Open questions:**
- Which toolchain: Terraform / Pulumi / OpenTofu?
- Git provider: GitHub / GitLab / Gitea?
- Cloud provider(s): AWS / GCP / Azure / on-prem?
- Team size and expected pipeline throughput (PRs per day)?

---

### Case: "Design a multi-tenant secrets management platform"

**Problem statement:** The organisation runs 12 microservices across 4
Kubernetes clusters. Each service has 50–200 secrets (API keys, DB
credentials, TLS certs). Current practice: hardcoded env vars in Git.
Need a cloud-native, auditable, rotation-capable secrets platform.

**Chosen lens:** Stakeholders (personas) + Process (secrets lifecycle)

```
Secrets Management Platform
├── 1. Secret storage (component lens)
│   ├── 1a. Encryption at rest (KMS)
│   ├── 1b. Encryption in transit (mTLS)
│   └── 1c. Access logging (immutable audit)
├── 2. Secret lifecycle (process lens)
│   ├── 2a. Creation / onboard
│   │   ├── API key generation
│   │   ├── Credential rotation on creation
│   │   └── Initial permission assignment
│   ├── 2b. Access / usage
│   │   ├── Lookup / retrieval by service identity
│   │   ├── Rotation during runtime (hot update)
│   │   └── Expired secret rejection
│   ├── 2c. Rotation (scheduled)
│   │   ├── Schedule (e.g. 90 days)
│   │   ├── Trigger new credential generation
│   │   ├── Update all dependent services
│   │   └── Deprecate old credential (grace period)
│   └── 2d. Deletion / revocation
│       ├── Service decommissioned
│       ├── Employee offboarding
│       └── Key compromise incident
├── 3. Access control (stakeholder lens)
│   ├── 3a. Service identities (workload → secret)
│   │   ├── mTLS certificate-based
│   │   ├── IAM role / service account mapped
│   │   └── Least-privilege per secret label
│   ├── 3b. Developer access (read-only / audit)
│   │   ├── View secret metadata (not value)
│   │   ├── Request temporary access (time-bounded)
│   │   └── Audit log visibility
│   └── 3c. Admin access (full)
│       ├── Create / modify / delete secrets
│       ├── Manage rotation policies
│       └── View full audit trail
└── 4. Integration (platform layer)
    ├── 4a. Kubernetes (native)
    │   ├── CSI driver (volume mount)
    │   ├── External Secrets Operator
    │   └── Init-container injection
    ├── 4b. Non-Kubernetes
    │   ├── SDK / API (REST / gRPC)
    │   ├── CLI tool for humans
    │   └── Vault Agent / sidecar
    └── 4c. Rotation automation
        ├── Cron / event-based triggers
        ├── Callback to services (reload hook)
        └── Health check after rotation
```

**MECE check:**
- Overlap: Lifecycle (2) vs Access control (3). Scheiden "het geheim"
  van "wie erbij mag". Geen overlap.
- Gap: Compliance reporting ontbreekt — toegevoegd onder 4c als
  sub-branch van admin access.

**Next actions (prioritized):**

| ID | Node | Priority | Next action |
|----|------|----------|-------------|
| 1a | Encryption architecture | P0 | Design encryption at rest + in transit |
| 2a | Onboarding pipeline | P0 | Build first secret onboarding flow |
| 4a | Kubernetes integration | P1 | Deploy External Secrets Operator |
| 3a | Service identity model | P1 | Map services to secret ACLs |
| 2c | Automated rotation | P1 | Implement 90-day rotation PoC |
| 4b | Non-K8s integration | P2 | CLI + SDK for non-container workloads |

**Assumptions:**
- 12 services, 4 clusters, ~100 secrets/service average
- Cloud provider: AWS (EKS) + on-prem (OpenShift)
- Current tools: Git (insecure), no secrets platform
- Compliance requirements: PCI-DSS, GDPR

**Open questions:**
- Open-source vs. self-hosted commercial (Vault = open-core)?
- Cloud provider primary: AWS / GCP / hybrid?
- Estimated secret count: 600–2400 active secrets?
- Integration with existing IAM (IdP) for developer access (3b)?
"
