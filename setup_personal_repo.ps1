# Powershell commands to disable the default choco install repo and setup your
# own personal / company repo. This allows you to run your commands without
# having to specify your source.


#Add personal repo as a source: (Artifactory / Nexus perhaps)
Start-Process "$chocoExe" -ArgumentList "sources add -name artifactory -source "http://myArtifactory.com"

#Disable the default chocolatey source
Start-Process "$chocoExe" -ArgumentList "sources disable -name chocolatey"

choco sources add -name artifactory -source
choco sources disable -name chocolatey
