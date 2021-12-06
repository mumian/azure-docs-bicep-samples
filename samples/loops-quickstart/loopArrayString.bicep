param rgLocation string = resourceGroup().location
param storageNames array = [
  'contoso'
  'fabrikam'
]

resource createStorages 'Microsoft.Storage/storageAccounts@2021-06-01' = [for name in storageNames: {
  name: '${name}str${uniqueString(resourceGroup().id)}'
  location: rgLocation
  sku: {
    name: 'Standard_LRS'
  }
  kind: 'StorageV2'
}]

