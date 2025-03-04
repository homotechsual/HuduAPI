function New-HuduBaseURL {
	Param (
		[Parameter(Mandatory=$false,
		ValueFromPipeline=$true)]
		[String]
		$BaseURL
		)
		
	if (!$BaseURL) {
		Write-Host "Please enter your Hudu Base URL with no trailing /, for example https://demo.huducloud.com :"
		$BaseURL = Read-Host
	}
	Set-Variable -Name "Int_HuduBaseURL" -Value $BaseURL -Visibility Private -Scope script -Force

	if ($script:Int_HuduAPIKey){
		[version]$version = (Get-HuduAppInfo).version
		if ($version -lt $script:HuduRequiredVersion){
			Write-Host "A connection error occured or Hudu version is below $script:HuduRequiredVersion" -foregroundcolor yellow
		}
	}
}