import-module ActiveDirectory

#Declare here cities and departments
$departments = @("Manager", "Sales", "Call Center", "Marketing", "IT Department", "Delivery team 1", "Delivery team 2", "Delivery team 3", "Delivery team 4", "Delivery team 5", "Delivery team 6", "Delivery team 7", "Delivery team 8", "Delivery team 9", "Delivery team 10", "Delivery team 11", "Delivery team 12", "Delivery team 13", "Delivery team 14", "Bordeaux Management")

#Adding base OU (muse be runned one time, comments this block for adding others departments/cities)
New-ADOrganizationalUnit -Name Departments -Path "dc=supmail, dc=lan" -ProtectedFromAccidentalDeletion 0
#End adding base OUS

#Adding departments
foreach($department in $departments)
{
    New-ADOrganizationalUnit -Name $department -Path "ou=Departments, dc=supmail, dc=lan" -ProtectedFromAccidentalDeletion 0

    New-ADOrganizationalUnit -Name Users -Path "ou=$department, ou=Departments, dc=supmail, dc=lan" -ProtectedFromAccidentalDeletion 0
    New-ADOrganizationalUnit -Name Groups -Path "ou=$department, ou=Departments, dc=supmail, dc=lan" -ProtectedFromAccidentalDeletion 0

    $buffer1 = "G_"+$department.TrimEnd("_departement")+"_R"
    $buffer2 = "G_"+$department.TrimEnd("_departement")+"_RW"

    New-ADGroup -Name $buffer1 -Path "ou=Groups, ou=$department, ou=Departments, dc=supmail, dc=lan" -GroupScope Global
    New-ADGroup -Name $buffer2 -Path "ou=Groups, ou=$department, ou=Departments, dc=supmail, dc=lan" -GroupScope Global
}
