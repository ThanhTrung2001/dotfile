# Function to add a new system environment variable - Must run as administrator
function Add-ToSystemVariable {
  param (
    [Parameter(Mandatory = $true)]
    [string]$VariableName,

    [Parameter(Mandatory = $true)]
    [string]$Value
  )


  # Retrieve the current value of the system environment variable (if it exists)
  $currentValue = [Environment]::GetEnvironmentVariable($VariableName, [System.EnvironmentVariableTarget]::Machine)

  if ($currentValue) {
    Write-Host "The system variable '$VariableName' already exists with the value: $currentValue" -ForegroundColor Yellow
    Write-Host "Appending the new value to the existing variable." -ForegroundColor Yellow

    # Append the new value if it is not already part of the existing variable
    if ($currentValue -notlike "*$Value*") {
      $newValue = "$currentValue;$Value"
      [Environment]::SetEnvironmentVariable($VariableName, $newValue, [System.EnvironmentVariableTarget]::Machine)
      Write-Host "The value '$Value' has been appended to the system variable '$VariableName'." -ForegroundColor Green
    }
    else {
      Write-Host "The value '$Value' is already part of the system variable '$VariableName'." -ForegroundColor Cyan
    }
  }
  else {
    # Create the variable if it does not exist
    [Environment]::SetEnvironmentVariable($VariableName, $Value, [System.EnvironmentVariableTarget]::Machine)
    Write-Host "The system variable '$VariableName' has been created with the value: $Value" -ForegroundColor Green
  }
}

#------------------------------------------------------------------
#Create HashTable
$hashTable = @{
  "MySystemVar"  = "C:\MySystemPath"
  "MySystemVar2" = "C:\MySystemPath2"
}

# run foreach loop to add ach key-value pair into system environment
foreach ($pair in $hashtable.GetEnumerator()) {
  Add-ToSystemVariable -VariableName $pair.Key -Value $pair.Value
}
