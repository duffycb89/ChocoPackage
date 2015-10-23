## This is a powershell script that will give your package its install instructions.

[String]$PackageRoot = (Split-Path -Parent (Split-Path -Parent $MyInvocation.MyCommand.Definition))
[String]$Path = (Join-Path -Path $PackageRoot -ChildPath 'content')
#[String]$Source = Join-Path -Path $Path -ChildPath 'Site'

Write-Host "Starting Install Scripts"



## >>>>> FUNCTIONS <<<<<


  Write-Host "Parsing Params"

  # Now parse the packageParameters using good old regular expression
  if ($packageParameters) {
      $match_pattern = '\/(?<option>([a-zA-Z]+)):(?<value>([`"''])?([a-zA-Z0-9- _\\:\.]+)([`"''])?)|\/(?<option>([a-zA-Z]+))'
      $option_name = 'option'
      $value_name = 'value'

      if ($packageParameters -match $match_pattern ){
          $results = $packageParameters | Select-String $match_pattern -AllMatches
          $results.matches | % {
            $arguments.Add(
                $_.Groups[$option_name].Value.Trim(),
                $_.Groups[$value_name].Value.Trim())
        }
      }
      else
      {
          Throw "Package Parameters were found but were invalid (REGEX Failure)"
      }

      if ($arguments.ContainsKey("Environment")) {
          #Write-Host "Environment Argument Found"
          $envr = $arguments["Environment"]
      Write-Host ("Environment Argument Found: {0}" -f $envr)
      [String]$Source = Join-Path -Path $Path -ChildPath ('Site\{0}' -f $envr)
      ##Copy-Item $Source -Destination $Destination -Recurse
      }

    if ($arguments.ContainsKey("SiteName")) {

      $site = $arguments["SiteName"]
      Write-Host $site
    }

} else {
      Write-Debug "No Package Parameters Passed in"
  }

  Write-Host "END Parsing Params"


Write-Host " >>>>> END Choco Install <<<<<"
