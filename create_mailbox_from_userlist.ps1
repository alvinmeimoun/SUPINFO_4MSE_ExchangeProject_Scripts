$CsvOutput = Import-Csv -Delimiter ";" -Path C:\Users\Administrateur.SUPMAIL\Desktop\Scripts\Employees.csv

add-pssnapin Microsoft.Exchange.Management.PowerShell.E2010

foreach($User in $CsvOutput)
{
    $Name = $User.Firstname.Substring(0,1).ToLower() + $User.Lastname.ToLower()

    Enable-Mailbox -Identity $Name
}