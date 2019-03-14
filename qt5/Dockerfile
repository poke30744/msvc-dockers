# escape=`

FROM poke30744/buildtools2017:latest
LABEL Description="Windows development environment with VC 2017 & Qt 5.12.1"

# Disable crash dialog for release-mode runtimes
RUN reg add "HKLM\SOFTWARE\Microsoft\Windows\Windows Error Reporting" /v Disabled /t REG_DWORD /d 1 /f
RUN reg add "HKLM\SOFTWARE\Microsoft\Windows\Windows Error Reporting" /v DontShowUI /t REG_DWORD /d 1 /f

# Download the QT installer
ADD http://download.qt.io/official_releases/online_installers/qt-unified-windows-x86-online.exe C:\qt.exe

# Copy the silent install script
COPY qtifwsilent.qs C:\qtifwsilent.qs

# Install QT silently
RUN powershell -NoProfile -ExecutionPolicy Bypass -Command `
    $ErrorActionPreference = 'Stop'; `
    $Env:QT_INSTALL_DIR = 'C:\\Qt' ; `
    Start-Process C:\qt.exe -ArgumentList '--verbose --script C:\qtifwsilent.qs' -NoNewWindow -Wait ; `
    Remove-Item C:\qt.exe -Force ; `
    Remove-Item C:\qtifwsilent.qs -Force
