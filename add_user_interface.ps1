add-pssnapin Microsoft.Exchange.Management.PowerShell.E2010
import-module ActiveDirectory

clear
write-host "Hi ! This script will help you to add an user `n`n" -foregroundcolor "Green"

$Firstname = Read-Host "Enter user firstname "
$Lastname = Read-Host "Enter user lastname "
$password = Read-Host -assecurestring "Enter user password "
$location = Read-Host "Enter user location "
$department = Read-Host "Enter a correct user department "

$Name = $Firstname.Substring(0,1).ToLower() + $Lastname.ToLower()
$email = $Firstname.ToLower() + "." + $Lastname.ToLower() + "@supmail.lan"

$pathDepartment = "ou=Users,ou=$department,ou=Departments,dc=supmail,dc=lan"
$display_name = $Firstname + " " + $Lastname

New-ADUser -Name $Name -Path $pathDepartment -AccountPassword $password -ChangePasswordAtLogon 1 -Enabled 1 -DisplayName $display_name -GivenName $Firstname -Surname $Lastname -City $location -EmailAddress $email
Enable-Mailbox -Identity $Name | Out-Null

write-host "`n`nScript finished, run again to add another user" -foregroundcolor "Green"
