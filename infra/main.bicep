@description('Azure region for the Static Web App. Defaults to the resource group location.')
param location string = resourceGroup().location

@description('Globally unique name for the Azure Static Web App resource.')
@minLength(2)
@maxLength(40)
param name string

@description('Single production environment for this workload.')
@allowed([
  'prd'
])
param environment string = 'prd'

@description('Static Web App SKU. Keep Free for a low-traffic first production release, upgrade to Standard later if needed.')
@allowed([
  'Free'
  'Standard'
])
param skuName string = 'Free'

@description('Optional extra resource tags.')
param tags object = {}

var defaultTags = {
  environment: environment
  managedBy: 'bicep'
  workload: 'static-web-app'
}

resource staticWebApp 'Microsoft.Web/staticSites@2025-03-01' = {
  name: name
  location: location
  tags: union(defaultTags, tags)
  sku: {
    name: skuName
    tier: skuName
  }
  properties: {}
}

output staticWebAppName string = staticWebApp.name
output resourceId string = staticWebApp.id
output defaultHostname string = staticWebApp.properties.defaultHostname
