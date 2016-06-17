import-module ActiveDirectory

$CsvOutput = Import-Csv -Delimiter ";" -Path C:\Users\Administrateur.SUPMAIL\Desktop\Scripts\Employees.csv
$password = ConvertTo-SecureString -String("Supinf0") -AsPlainText -Force

foreach($User in $CsvOutput)
{
    $Name = $User.Firstname.Substring(0,1).ToLower() + $User.Lastname.ToLower()
    $Firstname = $User.Firstname
    $Lastname = $User.Lastname
    $location = $User.location
    $department = $User.department
    $userid = $User.ID
    $email = $User.Firstname.ToLower() + "." + $User.Lastname.ToLower() + "@supmail.lan"

    $pathDepartment = "ou=Users,ou=$department,ou=Departments,dc=supmail,dc=lan"
    $display_name = $Firstname + " " + $Lastname

    New-ADUser -Name $Name -EmployeeID $userid -Path $pathDepartment -AccountPassword $password -ChangePasswordAtLogon 1 -Enabled 1 -DisplayName $display_name -GivenName $Firstname -Surname $Lastname -City $location -EmailAddress $email

}