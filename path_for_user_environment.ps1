# Function to add a value to the Path environment variable
function Add-ToUserPath {
    param (
        [Parameter(Mandatory = $true)]
        [string]$NewPath
    )

    # Retrieve the current user's Path environment variable
    $currentPath = [Environment]::GetEnvironmentVariable("Path", "User")

    # Split the Path variable into individual entries
    $pathEntries = $currentPath -split ';'

    # Check if the new path already exists in the Path variable
    if ($pathEntries -contains $NewPath) {
        Write-Host "The path '$NewPath' is already present in the user's Path environment variable." -ForegroundColor Yellow
    }
    else {
        # Append the new path to the Path variable
        $updatedPath = $currentPath + ";" + $NewPath
        # Set the updated Path variable
        [Environment]::SetEnvironmentVariable("Path", $updatedPath, "User")
        Write-Host "The path '$NewPath' has been added to the user's Path environment variable." -ForegroundColor Green
    }
}
#----------------------------------------------------------------
#Define array of paths to add to user path environment variable
$paths_to_add = @(
    "C:\MyCustomPat1",
    "C:\MyCustomPath2"
)

# Example usage: Add a new path (replace with the path you want to add)
foreach ($path in $paths_to_add) {
    Add-ToUserPath -NewPath $path
}