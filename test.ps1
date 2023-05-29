# Specify the file path to the new wallpaper image
$wallpaperPath = "$HOME" + "Downloads\troll-face-meme.jpg"

# Set the wallpaper using the SystemParametersInfo function from user32.dll
Add-Type -TypeDefinition @"
using System;
using System.Runtime.InteropServices;

public class WallpaperChanger {
    [DllImport("user32.dll", CharSet = CharSet.Auto)]
    public static extern int SystemParametersInfo(int uAction, int uParam, string lpvParam, int fuWinIni);
}

"@

# Constants for the wallpaper change action
$SPI_SETDESKWALLPAPER = 0x0014
$SPIF_UPDATEINIFILE = 0x01
$SPIF_SENDCHANGE = 0x02

# Call the SystemParametersInfo function to change the wallpaper
[WallpaperChanger]::SystemParametersInfo($SPI_SETDESKWALLPAPER, 0, $wallpaperPath, $SPIF_UPDATEINIFILE -bor $SPIF_SENDCHANGE)
