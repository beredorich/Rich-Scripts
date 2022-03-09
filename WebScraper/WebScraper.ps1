#
#Web Scraper
#Related Link: https://www.elated.com/first-10-html-tags/

Add-Type -assembly System.Windows.Forms

#Function
Function webScrape {
	[cmdletbinding()]
	#Param(
		#[Parameter(Mandatory)][string]$website,
		#[Parameter(Mandatory)][string]$HtmlType
	#)
	$website = "http://quotes.toscrape.com/"
	$HtmlType = "div"
	$webRequest = Invoke-WebRequest -Uri $website
	$webRequest.AllElements | where tagname -EQ $HtmlType | select innerText
	
}
#$scraped = webScrape


#Initialize Windows Form
$myForm = New-Object System.Windows.Forms.Form
$myForm.Text = "Rich's Web Scraper"
$myForm.Width = 1000
$myForm.Height = 600

#URL Label
$urlLabel = New-Object System.Windows.Forms.Label
$urlLabel.Location = '10,10'
$urlLabel.Width = 50
$urlLabel.Text = "URL"

#URL TextBox
$urlBox = New-Object System.Windows.Forms.TextBox
$urlBox.Width = 500
$urlBox.Location = '75,10'

#Combo Label
$comboLabel = New-Object System.Windows.Forms.Label
$comboLabel.Location = '10,40'
$comboLabel.Width = 100
$comboLabel.Text = "HTML Type"

#ComboBox
$comboBox = New-Object System.Windows.Forms.ComboBox
$comboBox.Location = '150,40'
$comboBox.Width = 100
$comboBox.Items.Add("div")
$comboBox.Items.Add("h1")

#Result Box
$resultBox = New-Object System.Windows.Forms.TextBox
$resultBox.Location = '10,90'
$resultBox.Multiline = $true
$resultBox.Size = '950, 400'
#$resultBox.ReadOnly = $true

#Cancel Button
$cancelButton = New-Object System.Windows.Forms.Button
$cancelButton.Location = '900, 500'
$cancelButton.Text = "Cancel"


#Run Button
$runButton = New-Object System.Windows.Forms.Button
$runButton.Location = '800, 500'
$runButton.Text = "Run"


$myForm.Controls.Add($urlLabel)
$myForm.Controls.Add($urlBox)
$myForm.Controls.Add($comboLabel)
$myForm.Controls.Add($comboBox)
$myForm.Controls.Add($resultBox)
$myForm.Controls.Add($runButton)
$myForm.Controls.Add($cancelButton)


$endScript = $false



$cancelButton.add_click({
	$myForm.Close()
})


$runButton.add_click({
	#Output to Text File
	webScrape | Out-File -FilePath "C:\Users\Rich\Desktop\New Text Document.txt"

})





$myForm.ShowDialog()








