Add-Type -AssemblyName System.Windows.Forms
$screen = [System.Windows.Forms.Screen]::PrimaryScreen.Bounds
$image = New-Object System.Drawing.Bitmap($screen.Width, $screen.Height)
$graphic = [System.Drawing.Graphics]::FromImage($image)
$graphic.CopyFromScreen($screen.Location, [System.Drawing.Point]::Empty, $screen.Size)
$image.Save("$env:TEMP\capture.png", [System.Drawing.Imaging.ImageFormat]::Png)
