#Money Converter
#Script by: Rich Beredo
#Reference: https://www.altaro.com/msp-dojo/web-scraping-tool-for-msps/
#https://sid-500.com/2017/12/19/powershell-playing-with-text-or-how-to-get-every-x-line-from-text-output-trimreplacesplit/
#youtube: ep1 how to create a WPF GUI for your Powershell Script
#Last Update 09MAR2022

clear-host
Add-Type -AssemblyName presentationframework, presentationcore

#Website
$website = "https://www.x-rates.com/table/?from=USD&amount=1"
$webRequest = Invoke-WebRequest $website


#Parse Data
$rawData = $webRequest.ParsedHtml.all.tags("td") | ForEach-Object -MemberName innertext
$parsedData = $rawData | Select-Object -Skip 30


#Values
$currency = For ($i=0; $i -lt $parsedData.count; $i+=3){$parsedData[$i]}
$rate = For ($i=1; $i -lt $parsedData.count; $i+=3){$parsedData[$i]}

clear-host
#XAML File
$xamlLocation = "Z:\Powershell\Rich-Scripts\Money Converter\ConvertGUI\ConvertGUI\MainWindow.xaml"
$xamlRaw = Get-Content -Path $xamlLocation -Raw

#Cleans up XAML
$xamlRaw = $xamlRaw -replace 'mc:Ignorable="d"', '' -replace "x:N", 'N' -replace '^<Win.*', '<Window'
[xml]$xamlFile = $xamlRaw

#Read XAML
$reader = New-Object System.Xml.XmlNodeReader $xamlFile

#Load GUI
$gui = [Windows.Markup.XamlReader]::Load($reader)

$xamlFile.SelectNodes("//*[@Name]") | ForEach-Object {
    Set-Variable -Name "var_$($_.Name)" -Value $window.FindName($_.Name) -ErrorAction Stop
}
Get-Variable var_*
Write-Host "Cmon man"
$Null = $gui.ShowDialog()









