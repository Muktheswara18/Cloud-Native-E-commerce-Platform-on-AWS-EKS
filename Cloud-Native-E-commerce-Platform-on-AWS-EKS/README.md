# Socks Shop Microservices Deployment on Kubernetes

---

## Overview

This project deploys the **Socks Shop microservices application** on Kubernetes using a fully automated **Infrastructure as Code (IaC)** approach. The deployment process is managed through **GitHub Actions**, which automates the creation of infrastructure, application deployment, and teardown. The project also integrates monitoring, logging, and security features, ensuring that the application is robust and secure.

---

## Features

* **Automated IaC Deployment**: Uses **Terraform** and **GitHub Actions** to automate infrastructure provisioning and application deployment.
* **Comprehensive Monitoring**: Implements **Prometheus** for monitoring, **Grafana** for visualizations, and **Alertmanager** for alert management with Slack notifications.
* **Security**: Secures communication with HTTPS using **Let's Encrypt**.
* **Scalability**: Deployed on **Kubernetes**, allowing for easy scaling and management of microservices.

---

## Architecture

The architecture includes the following components:

1.  **Kubernetes Cluster**: Managed by **AWS EKS** (Elastic Kubernetes Service), the cluster hosts the microservices that comprise the Socks Shop application.
2.  **Terraform**: Used to provision the infrastructure, including the EKS cluster, VPC, S3 bucket, and DynamoDB table.
3.  **Helm**: Manages deployment of applications and services within the Kubernetes cluster.
4.  **Prometheus**: Monitors the performance and health of the microservices, Kubernetes resources, and other critical infrastructure.
5.  **Grafana**: Provides a user-friendly interface for visualizing metrics collected by Prometheus.
6.  **Alertmanager**: Manages alerts triggered by Prometheus, with notifications sent to Slack.
7.  **Let's Encrypt**: Automatically provisions SSL certificates to secure the application with HTTPS.
8.  **Nginx Ingress Controller**: Manages external access to the services within the Kubernetes cluster, including load balancing and HTTPS termination.

---

## Repository Structure

```plaintext
SOCK-SHOP-MS/
├── .github/
│   └── workflows/                         # GitHub Actions workflows for CI/CD automation.
│       ├── actions.yml                     # Workflow for deploying infrastructure and applications.                 
├── encrypt-chart/
│   └── templates/
│       ├── cert-issue.yml                 # Kubernetes manifest for issuing SSL certificates using Let's Encrypt.
│       ├── .helmignore                    # Files and directories to ignore when packaging Helm charts.
│       ├── Chart.yaml                     # Metadata file for the Helm chart (encrypt chart).
│       └── values.yaml                    # Default configuration values for the encrypt Helm chart.
├── ingress-chart/
│   └── templates/
│       ├── .helmignore                    # Files and directories to ignore when packaging the ingress Helm chart.
│       ├── Chart.yaml                     # Metadata file for the Helm chart (ingress chart).
│       └── values.yaml                    # Default configuration values for the ingress Helm chart.
├── manifest-alertconfig/
│   ├── alertmanagerconfig.yml             # Configuration for Alertmanager, defining alert routing and receivers.
│   ├── probes.yml                         # Kubernetes readiness and liveness probes for monitoring application health.
│   └── rules.yml                          # Alerting rules defining when alerts should be triggered.
├── manifest-prometheus/
│   └── values.yaml                        # Configuration values for Prometheus, including scraping and alerting.
├── sock-shop-chart/
│   └── templates/
│       ├── deployment.yml                 # Kubernetes Deployment manifest for the Sock Shop microservices.
│       ├── namespace.yml                  # Namespace definition for isolating the Sock Shop application.
│       ├── service.yml                    # Kubernetes Service manifest to expose the Sock Shop application.
│       ├── .helmignore                    # Files and directories to ignore when packaging the Sock Shop Helm chart.
│       ├── Chart.yaml                     # Metadata file for the Sock Shop Helm chart.
│       └── values.yaml                    # Default configuration values for the Sock Shop Helm chart.
└── terraform_code/
    ├── backend.tf                         # Terraform backend configuration, using S3 and DynamoDB for state management.
    ├── terraform.tfvars                   # Terraform variable values, including S3 bucket and DynamoDB table names.
    ├── eks.tf                             # Terraform configuration to provision the EKS cluster.
    ├── provider.tf                        # Provider configuration, defining AWS as the cloud provider.
    ├── variables.tf                       # Variables file to store configurable values like region, cluster name, etc.
    └── vpc.tf                             # Terraform configuration to provision the VPC for the Kubernetes cluster.