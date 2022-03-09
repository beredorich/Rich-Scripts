#Money Converter

clear

$website = "https://www.x-rates.com/table/?from=USD&amount=1"
$HtmlType = "td"
$webRequest = Invoke-WebRequest $website
$webRequest.AllElements | where tagname -EQ $HtmlType | select innerText

#https://www.altaro.com/msp-dojo/web-scraping-tool-for-msps/