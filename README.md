# Azure Hub-Spoke Network Setup

This project provides an Azure CLI script to automate the creation of a hub-and-spoke virtual network topology in Microsoft Azure. It includes the setup of a resource group, hub and spoke VNets with multiple subnets, and VNet peering to establish connectivity between the networks.

## 📦 Project Description

The script performs the following tasks:
- Creates a resource group named `rg-demo` in the `westus3` region.
- Sets up a hub VNet (`hubVnet`) with 4 subnets.
- Sets up two spoke VNets (`spokeVnetRed` and `spokeVnetBlue`) each with 4 subnets.
- Establishes VNet peering between the hub and each spoke to form a star topology.

## ✅ Prerequisites

- Azure CLI installed and logged in (`az login`)
- Azure subscription with permission to create resources
- Bash or PowerShell environment to run the script

## 🚀 Usage Instructions

1. Open a terminal and ensure you are logged into Azure:
   ```bash
   az login
   ```
