# vulnerable-app

Bu layihə DevSecOps praktiki ekzameni üçün hazırlanmışdır.

## Məqsəd
Tələbələrdən gözlənilir:
- Kodda zəiflikləri aşkar etmək (SAST, SCA, secrets)
- Docker obrazını təhlükəsizlik üzrə skanerləmək
- Terraform konfiqurasiyasını yoxlamaq
- CI pipeline-ına təhlükəsizlik əlavə etmək
- Hadisəyə reaksiya planı təqdim etmək

## Quraşdırma
```bash
git clone https://github.com/your-org/vulnerable-app.git
cd vulnerable-app
npm install

"⚠️ Bu layihədə məqsədli zəifliklər var. Productionda istifadə etməyin! "


---

## 🔧 Alətlər (Tələbə tərəfindən quraşdırılmalıdır)

```bash
# SAST
npm install -g semgrep

# SCA & Secrets
npm install -g snyk
go install github.com/gitleaks/gitleaks/v8@latest

# Container Security
brew install aquasecurity/trivy/trivy

# IaC Security
pip install checkov

# Node.js
npm install -g node
