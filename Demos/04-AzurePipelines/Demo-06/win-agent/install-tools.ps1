
Invoke-WebRequest -Uri 'https://chocolatey.org/install.ps1' -OutFile ./choco-install.ps1 ;
.\\choco-install.ps1 ;     
Remove-Item ".\choco-install.ps1" ;

choco install nodejs --version=14.18.0 -y
choco install dotnetcore-sdk -y
choco install dotnet-5.0-sdk -y
choco install git -y
choco install azure-cli -y

choco install visualstudio2019buildtools --package-parameters "--allWorkloads --includeRecommended --includeOptional --passive --locale en-US" -y

# Set Nuget 
dotnet nuget add source https://api.nuget.org/v3/index.json -n nuget.org

# Refresh Path Env for npm 
$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")

# Install Angular
npx @angular/cli@latest analytics off
npm i -g @angular/cli
npm i -g gulp webpack 
npm i -g @pnp/cli-microsoft365