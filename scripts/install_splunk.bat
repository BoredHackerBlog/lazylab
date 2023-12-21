curl.exe https://download.splunk.com/products/universalforwarder/releases/9.1.2/windows/splunkforwarder-9.1.2-b6b9c8185839-x64-release.msi --output C:\splunkuf.msi
msiexec.exe /i C:\splunkuf.msi RECEIVING_INDEXER="192.168.200.10:9997" AGREETOLICENSE=yes USE_LOCAL_SYSTEM=1 /quiet

if exist "C:\Program Files\SplunkUniversalForwarder\etc\apps\SplunkUniversalForwarder\local\" ( echo yes ) else ( echo timeout 10 )
if exist "C:\Program Files\SplunkUniversalForwarder\etc\apps\SplunkUniversalForwarder\local\" ( echo yes ) else ( echo timeout 10 )
if exist "C:\Program Files\SplunkUniversalForwarder\etc\apps\SplunkUniversalForwarder\local\" ( echo yes ) else ( echo timeout 10 )