# Download the latest version of Java
Invoke-WebRequest -Uri "https://javadl.oracle.com/webapps/download/AutoDL?BundleId=244554_d7fc238d0cbf4b0dac67be84580cfb4b" -OutFile "$env:TEMP\java_installer.exe"

# Install Java
Start-Process -FilePath "$env:TEMP\java_installer.exe" -ArgumentList "/s" -Wait

# Set the JAVA_HOME environment variable
[System.Environment]::SetEnvironmentVariable("JAVA_HOME", "C:\Program Files\Java\jdk-16.0.2", "Machine")

# Add Java to the PATH environment variable
$oldPath = [System.Environment]::GetEnvironmentVariable("PATH", "Machine")
$newPath = "$oldPath;C:\Program Files\Java\jdk-16.0.2\bin"
[System.Environment]::SetEnvironmentVariable("PATH", $newPath, "Machine")

# Download JetBrain IDE
Invoke-WebRequest -Uri "https://download.jetbrains.com/idea/ideaIC-2023.1.exe" -OutFile "$env:TEMP\jetbrain_installer.exe"

# Install JetBrain
Start-Process -FilePath "$env:TEMP\jetbrain_installer.exe" -ArgumentList "/s" -Wait
