#===========================================================================================================================================#
#   AUTHOR  :  S
#   DATE    :  08-23-2025
#   COMMENT :  Deploying single vnet with hub/spoke and peering in Single Region
#   VERSION :  1.0
#===========================================================================================================================================#

#ResourceGroup
az group create --name rg-demo --location westus3 --tags Author=Sisay environment=dev project=tbd resource=rg
#Vnet
    #Step 1: Create Hub vnet  with 5 Subnet
        az network vnet create \
          --name hubVnet \
          --resource-group rg-demo \
          --location westus3 \
          --address-prefix 100.100.0.0/22 \
          --tags Author=Sisay environment=dev project=tbd resource=vnet topolgy=hub
        az network vnet subnet create --resource-group rg-demo --vnet-name hubVnet --name hubSubnet1 --address-prefix 100.100.0.0/24
        az network vnet subnet create --resource-group rg-demo --vnet-name hubVnet --name hubSubnet2 --address-prefix 100.100.1.0/24
        az network vnet subnet create --resource-group rg-demo --vnet-name hubVnet --name hubSubnet3 --address-prefix 100.100.2.0/24
        az network vnet subnet create --resource-group rg-demo --vnet-name hubVnet --name hubSubnet4 --address-prefix 100.100.3.0/24

    #Step 2: Create spoke vnet with 3 Subnet
        az network vnet create \
          --name spokeVnetRed \
          --resource-group rg-demo \
          --location westus3 \
          --address-prefix 100.101.0.0/22 \
          --tags Author=Sisay environment=dev project=sample resource=vnet topolgy=spoke
        az network vnet subnet create --resource-group rg-demo --vnet-name spokeVnetRed --name spokeRedSubnet1 --address-prefix 100.101.0.0/24
        az network vnet subnet create --resource-group rg-demo --vnet-name spokeVnetRed --name spokeRedSubnet2 --address-prefix 100.101.1.0/24
        az network vnet subnet create --resource-group rg-demo --vnet-name spokeVnetRed --name spokeRedSubnet3 --address-prefix 100.101.2.0/24
        az network vnet subnet create --resource-group rg-demo --vnet-name spokeVnetRed --name spokeRedSubnet4 --address-prefix 100.101.3.0/24

    #Step 3: Create spoke vnet with 3 Subnet
        az network vnet create \
          --name spokeVnetBlue \
          --resource-group rg-demo \
          --location westus3 \
          --address-prefix 100.102.0.0/22 \
          --tags Author=Sisay environment=dev project=sample resource=vnet topolgy=spoke
        az network vnet subnet create --resource-group rg-demo --vnet-name spokeVnetBlue --name spokeBlueSubnet1 --address-prefix 100.102.0.0/24
        az network vnet subnet create --resource-group rg-demo --vnet-name spokeVnetBlue --name spokeBlueSubnet2 --address-prefix 100.102.1.0/24
        az network vnet subnet create --resource-group rg-demo --vnet-name spokeVnetBlue --name spokeBlueSubnet3 --address-prefix 100.102.2.0/24
        az network vnet subnet create --resource-group rg-demo --vnet-name spokeVnetBlue --name spokeBlueSubnet4 --address-prefix 100.102.3.0/24
        
    #Step 4: Create vnet peering to create star(hub/spoke) topology
      #Hub to spoke Red
        az network vnet peering create \
          --name hubToSpokeRed \
          --resource-group rg-demo \
          --vnet-name hubVnet \
          --remote-vnet spokeVnetRed \
          --allow-vnet-access \
          --allow-forwarded-traffic true
      # Spoke Red to Hub
        az network vnet peering create \
          --name SpokeRedToHub \
          --resource-group rg-demo \
          --vnet-name spokeVnetRed \
          --remote-vnet hubVnet \
          --allow-vnet-access \
          --allow-forwarded-traffic true
      #Hub to spoke Blue
        az network vnet peering create \
          --name hubToSpokeBlue \
          --resource-group rg-demo \
          --vnet-name hubVnet \
          --remote-vnet spokeVnetBlue \
          --allow-vnet-access \
          --allow-forwarded-traffic true
      # #Spoke Blue to hub
        az network vnet peering create \
          --name SpokeBlueToHub \
          --resource-group rg-demo \
          --vnet-name spokeVnetBlue \
          --remote-vnet hubVnet \
          --allow-vnet-access \
          --allow-forwarded-traffic true
