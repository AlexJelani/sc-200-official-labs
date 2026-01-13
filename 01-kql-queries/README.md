# Lab 1: KQL Queries with Microsoft Sentinel

> **SC-200 Official Lab** | **Tier 1 - Essential** | **Est. Time: 2-3 hours**

## 🎯 Lab Overview

Learn Kusto Query Language (KQL) fundamentals using Microsoft Sentinel. This lab provides a complete IaC setup to practice security data analysis and threat detection queries.

## 💰 Cost Estimate

| Resource | Cost/Hour | Daily Cost | Notes |
|----------|-----------|------------|---------|
| Log Analytics Workspace | $2.76/GB | ~$5-15 | Based on 2-5GB ingestion |
| Microsoft Sentinel | $2.76/GB | ~$5-15 | Same as Log Analytics |
| **Total Estimated** | **~$0.50/hr** | **~$10-30/day** | **Varies by data volume** |

**💡 Cost Optimization:**
- Deploy only when actively learning
- Use `terraform destroy` after each session
- 30-day retention keeps costs minimal

## 🚀 Quick Deploy

### Prerequisites
- Azure CLI authenticated
- Terraform v1.0+
- Azure subscription with Contributor access

### Deploy
```bash
cd 01-kql-queries
terraform init
terraform apply -auto-approve
```

## 📊 Infrastructure Created

- **Resource Group**: `rg-sentinel-lab`
- **Log Analytics Workspace**: Data storage & KQL engine
- **Microsoft Sentinel**: SIEM platform
- **Security Events Connector**: Sample Windows security logs

## 🔍 Lab Exercises

### 1. VS Code Setup (Recommended)
```bash
# Install KQL extension
code --install-extension ms-kusto.kusto
```

### 2. Practice Options
**Option A - VS Code (Offline):**
- Open `practice-queries.kql` for syntax highlighting
- Learn KQL syntax without Azure costs

**Option B - Live Environment:**
```bash
terraform output sentinel_workspace_url
```
- Execute queries against real data
- Full Sentinel experience

### 3. Key Skills Developed
- KQL syntax mastery
- Security event analysis
- Data correlation techniques
- Threat hunting fundamentals

## 🧹 Cleanup
```bash
terraform destroy -auto-approve
```

## 📈 Learning Outcomes

**Technical Skills:**
- KQL query construction
- Log analysis techniques
- SIEM data exploration

**SC-200 Exam Alignment:**
- 25% of exam content
- Core foundation for all other labs
- Essential for SOC analyst role

## 🔗 Resources

- [Sample KQL Queries](./sample-queries.md)
- [KQL Documentation](https://docs.microsoft.com/en-us/azure/data-explorer/kql-quick-reference)
- [Original Microsoft Lab](https://microsoftlearning.github.io/SC-200T00A-Microsoft-Security-Operations-Analyst/Instructions/Labs/LAB_AK_06_Lab1_Ex01_KQL.html)