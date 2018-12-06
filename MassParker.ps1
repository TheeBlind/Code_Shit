#From netsparker Website: Use the below Microsoft PowerShell script to trigger the security scans, replacing the sample variables used in this example with yours (the detailed explanation of all the variables is below this script):
####What are the variables in the script?
#$URLs: the location of where the text file is saved.
#$NetsparkerReportPath: the location where web security scan reports should be saved once the scans are ready.
#NetsparkerReportTemplate: the report template Netsparker Desktop should use for the reports.

$NetsparkerExecPath = "C:\Program Files (x86)\Netsparker\Netsparker.exe"

# Variables
$URLs = "C:\Users\User1\Documents\targets_list.txt"
$NetsparkerReportPath = "C:\Users\User1\Documents\"
$NetsparkerReportTemplate = "Detailed Scan Report"
#

 foreach ($url in get-content $URLs) {
     $domain = ([System.URI]"$url").Host
     $report = $NetsparkerReportPath + $domain + "_" + (Get-Date -format "yyyyMMdHm")
     start-process -FilePath "$NetsparkerExecPath" -ArgumentList "/url ""$url"" /profile ""$domain"" /a /s /r ""$report"" /rt ""$NetsparkerReportTemplate"""

}
