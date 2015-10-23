# ChocoPackage
Simple Chocolatey package creation example.


Chocolatey Website: https://chocolatey.org/
GitHub: https://github.com/chocolatey/chocolatey

Steps

	1.) Setup nuspec file and choco install file that will be used to create your package.
	2.) Define any dependencies inside your nuspec file. (Example below)
	3.) Setup your install script for how you want the install to happen. (Example below with also how to pass it params.)
	4.) Once script and nuspec file is ready run the pack commands to create the choco package itself. (Remember to move content files into correct locations during pack event)
	5.) Choco package should be ready to go! Run the install commands to see the results.
		- Keep in mind that choco.exe has to be installed on a machine to be able to run the choco install command. See Chocolatey's site for this setup command.
    - For better feedback and troubleshooting make sure to write to the consle in your install script.

# Pack Commands

Setup your folder and files then create you package with the cpack command.


# Nuspec File

A well defined nuspec file is crucial to this process. Not only does it help define your package but it helps to ensure dependencies

are installed on the machine so that your package will successfully install and run as expected.


# Chocolatey Install Script
  Chocolateyinstall.ps1

  This is a powershell script that will give your package its install instructions.


# Install Command example:

choco install Simple_Choco -Version 1.1.0 -packageParameters "/Environment:D1" -force -y


# How to improve your experience

One thing I found working with Chocolatey packages was that a lot of times people create their own and use their own repo source.

To make this easier you can set your sources and disable some. For instance if you work for a corporation and you cannot install from Chocolatey

you can disable that source and setup the in house source for these types of repos. Some commands to help you with this can be found in the

setup_personal_repo.ps1 file.


Another opportunity for improvement is make sure you have your code in source control. From their leverage a CI tool, such as Jenkins, to

automate your package creation and uploading to your repo. Any chance to automation always makes life easier and your work or teams efforts

better, faster, and cheaper!
