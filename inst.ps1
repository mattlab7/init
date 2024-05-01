$appGroups = @{
    SAPPHIRE = @(
        "7zip.7zip", # utils
        "Brave.Brave",
        "ShareX.ShareX",
        "QL-Win.QuickLook",
        "AgileBits.1Password",
        "Tailscale.Tailscale",
        "AppWork.JDownloader",
        "Soulseek.SoulseekQt",
        "OBSProject.OBSStudio",
        "TheBrowserCompany.Arc",
        "Tixati.Tixati.Portable",
        "Google.ChromeRemoteDesktop",
        "mpv.net", # media
        "Gyan.FFmpeg",
        "Stremio.Stremio",
        "DuongDieuPhap.ImageGlass",
        "Bruno.Bruno", # dev tools
        "Canonical.Ubuntu.2204",
        "Microsoft.WindowsTerminal",
        "Microsoft.VisualStudioCode",
        "JetBrains.IntelliJIDEA.Ultimate",
        "Microsoft.VisualStudio.2022.Community.Preview",
        "9NKSQGP7F2NH", # comms (whatsapp)
        "Discord.Discord",
        "Telegram.TelegramDesktop",
        "Valve.Steam", # games
        "PrismLauncher.PrismLauncher",
        "EpicGames.EpicGamesLauncher"
    )
    QUARTZ = @(
        "7zip.7zip", # utils
        "ShareX.ShareX",
        "QL-Win.QuickLook",
        "AgileBits.1Password",
        "Tailscale.Tailscale",
        "OBSProject.OBSStudio",
        "TheBrowserCompany.Arc",
        "Google.ChromeRemoteDesktop",
        "mpv.net", # media
        "Gyan.FFmpeg",
        "Stremio.Stremio",
        "DuongDieuPhap.ImageGlass",
        "Bruno.Bruno", # dev tools
        "Canonical.Ubuntu.2204",
        "Microsoft.WindowsTerminal",
        "Microsoft.VisualStudioCode",
        "JetBrains.IntelliJIDEA.Ultimate",
        "Microsoft.VisualStudio.2022.Community.Preview",
        "9NKSQGP7F2NH", # comms (whatsapp)
        "Telegram.TelegramDesktop"
    )
}

if ($appGroups.ContainsKey($env:computername)) {
    $appsToInstall = $appGroups[$env:computername]
    Write-Host "Installing apps for $env:computername..."

    foreach ($appId in $appsToInstall) {
        Write-Host "Installing $appId"
        winget install --id $appId --accept-source-agreements --accept-package-agreements
    }
}
else {
    Write-Error "Invalid computer name. You might want to check the script before executing."
}
