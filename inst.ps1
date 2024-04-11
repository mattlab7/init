param(
	[Parameter(Mandatory=$true)]
	[string] $Hostname
)

$appGroups = @{
	"sapphire" = @(
		"7zip.7zip", # Utilities
		"ShareX.ShareX",
		"QL-Win.QuickLook",
		"Google.Chrome.Dev",
		"AgileBits.1Password",
		"Tailscale.Tailscale",
		"AppWork.JDownloader",
		"Soulseek.SoulseekQt",
		"OBSProject.OBSStudio",
		"Tixati.Tixati.Portable",
		"Google.ChromeRemoteDesktop",
		"mpv.net", # Media
		"Gyan.FFmpeg"
		"Stremio.Stremio",
		"DuongDieuPhap.ImageGlass",
		"Bruno.Bruno", # Dev Tools
		"Canonical.Ubuntu.2204",
		"Microsoft.WindowsTerminal",
		"Microsoft.VisualStudioCode",
		"JetBrains.IntelliJIDEA.Ultimate",
		"Microsoft.VisualStudio.2022.Community.Preview",
		"9NKSQGP7F2NH", #Communication (WhatsApp)
		"Discord.Discord",
		"Telegram.TelegramDesktop",
		"Valve.Steam", # Gaming
		"PrismLauncher.PrismLauncher",
		"EpicGames.EpicGamesLauncher",
	),
	"quartz" = @(
		"7zip.7zip", # Utilities
		"ShareX.ShareX",
		"QL-Win.QuickLook",
		"Google.Chrome.Dev",
		"AgileBits.1Password",
		"Tailscale.Tailscale",
		"OBSProject.OBSStudio",
		"Google.ChromeRemoteDesktop",
		"mpv.net", # Media
		"Gyan.FFmpeg"
		"Stremio.Stremio",
		"DuongDieuPhap.ImageGlass",
		"Bruno.Bruno", # Dev Tools
		"Canonical.Ubuntu.2204",
		"Microsoft.WindowsTerminal",
		"Microsoft.VisualStudioCode",
		"JetBrains.IntelliJIDEA.Ultimate",
		"Microsoft.VisualStudio.2022.Community.Preview",
		"9NKSQGP7F2NH", #Communication (WhatsApp)
		"Telegram.TelegramDesktop",
	)
}

if ($appGroups.ContainsKey($Hostname)) {
	$appsToInstall = $appGroups[$Hostname]
	Write-Host "Installing applications from group $($Hostname):"

	foreach ($appId in $appsToInstall) {
		Write-Host "  - $($appId)"
		winget install --id=$appId -e
	}
} else {
	Write-Error "Invalid group name: $($Hostname)"
}

Write-Host "Script completed."
