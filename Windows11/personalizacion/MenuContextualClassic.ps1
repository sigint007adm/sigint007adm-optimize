# Script para activar el menú contextual clásico en Windows 11
Write-Host "Configurando el menú clásico de Windows..." -ForegroundColor Cyan

# 1. Crear la clave en el registro
$RegistryPath = "HKCU:\Software\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}\InprocServer32"
If (!(Test-Path $RegistryPath)) {
    New-Item -Path $RegistryPath -Force | Out-Null
}

# 2. Establecer el valor predeterminado como vacío (requerido para que funcione)
Set-ItemProperty -Path $RegistryPath -Name "(Default)" -Value ""

Write-Host "¡Registro modificado con éxito!" -ForegroundColor Green
Write-Host "Reiniciando el Explorador de Windows para aplicar los cambios..." -ForegroundColor Yellow

# 3. Reiniciar el explorador de forma segura
Stop-Process -Name explorer -Force
