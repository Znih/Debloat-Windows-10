#   Description:
# This script disables unwanted Windows services. If you do not want to disable
# certain services comment out the corresponding lines below.

$services = @(
    "diagnosticshub.standardcollector.service" # Microsoft (R) Diagnostics Hub Standard Collector Service
    "DiagTrack"                                # Diagnostics Tracking Service
    "dmwappushservice"                         # WAP Push Message Routing Service
    "HomeGroupListener"                        # HomeGroup Listener
    "HomeGroupProvider"                        # HomeGroup Provider
    "lfsvc"                                    # Geolocation Service
    "MapsBroker"                               # Downloaded Maps Manager
    "NetTcpPortSharing"                        # Net.Tcp Port Sharing Service
    "RemoteAccess"                             # Routing and Remote Access
    "RemoteRegistry"                           # Remote Registry
    #"SharedAccess"                             # Internet Connection Sharing (ICS)
    "TrkWks"                                   # Distributed Link Tracking Client
    "WbioSrvc"                                 # Windows Biometric Service
    #"WlanSvc"                                 # WLAN AutoConfig
    #"WMPNetworkSvc"                            # Windows Media Player Network Sharing Service | ausklammern wenn der Player bereits deinstalliert wurde
    "wscsvc"                                   # Windows Security Center Service
    "WSearch"                                  # Windows Search
    "XblAuthManager"                           # Xbox Live Auth Manager | ausklammern wenn der Player bereits deinstalliert wurde
    "XblGameSave"                              # Xbox Live Game Save Service | ausklammern wenn der Player bereits deinstalliert wurde
    "XboxNetApiSvc"                            # Xbox Live Networking Service | ausklammern wenn der Player bereits deinstalliert wurde
    "XboxGipSvc"                               # Xbox Accessory Management Service | ausklammern wenn der Player bereits deinstalliert wurde
    #"xbgm"                                     # Xbox Game Monitoring | ZUGRIFF VERWEIGERT!!! Dienst löschen!!
    "SEMgrSvc"                                 # Zahlungs- und NFC/SE-Manager
    "DiagTrack"                                # Benutzererfahrung und Telemetrie im verbundenen Modus
    "WpnService"                                # Windows-Pushbenachrichtigungssystemdienst
	
    
    "WerSvc"
    "WebClient"
    "upnphost"
    "DoSvc"
    "SSDPSRV"
    "PcaSvc"
    "PolicyAgent"
    "ALG"
    "Fax"
    #"WcsPlugInService"
    "Wecsvc"
    #"MpsSvc"                                     # Windows Firewall
    "WbioSrvc"                                   # Windows-Biometriedienst
    "icssvc"                                     # Windows-Dienst fÃŒr mobile Hotspots
    "NcaSvc"                                     # NetzwerkkonnektivitÃ€ts-Assistent
    "iphlpsvc"                                   # IP-Hilfsdienst
    "WinHttpAutoProxySvc"                        # WinHTTP-Web Proxy Auto-Discovery-Dienst
    "WalletService"                              # Von Clients der Funktion 'Brieftasche' verwendete Hostobjekte
    #"UsoSvc"                                     # Update Orchestrator Service | wenn Dienst deaktiviert wird, lassen sich in den Einstellungen Update und Sicherheit nicht mehr oeffnen
    "PhoneSvc"                                   # Verwaltet den Telefoniestatus des Geräts
    "TapiSrv"                                    # Tel-API-Support (TAPI)
    #"EntAppSvc"                                  # Verwaltungsdienst für Unternehmens-Apps | ZUGRIFF VERWEIGERT!!! Dienst löschen!!
    "spectrum"                                   # Windows Perception Service (Ermöglicht die räumliche Wahrnehmung, räumliche Eingaben und holografisches Rendering.)
    "wisvc"                                      # Windows-Insider-Dienst
    "FrameServer"                                # Windows-Kamera-FrameServer
    "LicenseManager"                             # Windows-Lizenz-Manager-Dienst
    "WinRM"                                      # Windows-Remoteverwaltung (WS-Verwaltung)
    "wcncsvc"                                    # Windows-Sofortverbindung - Konfigurationsregistrierungsstelle | Implementierung des WPS (Wireless Protected Setup)-Protokoll
    "RetailDemo"                                 # Dienst für Einzelhandelsdemos
    "SmsRouter"                                  # Microsoft Windows SMS-Routerdienst
    "PNRPsvc"                                    # Peer Name Resolution-Protokoll
    "p2psvc"                                     # Peernetzwerk-Gruppenzuordnung
    "p2pimsvc"                                   # Peernetzwerkidentitäts-Manager
    "PNRPAutoReg"                                # PNRP-Computernamenveröffentlichungs-Dienst
    "HvHost"                                     # HV-Hostdienst
    "vmicvmsession"                              # Hyper-V PowerShell Direct-Dienst
    "vmickvpexchange"                            # Hyper-V-Datenaustauschdienst
    "vmictimesync"                               # Hyper-V-Dienst für Zeitsynchronisierung
    "vmicshutdown"                               # Hyper-V-Dienst zum Herunterfahren des Gasts
    "vmicguestinterface"                         # Hyper-V-Gastdienstschnittstelle
    "vmicrdv"                                    # Hyper-V-Remotedesktopvirtualisierungsdienst
    "vmicheartbeat"                              # Hyper-V-Taktdienst
    "vmicvss"                                    # Hyper-V-Volumeschattenkopie-Anforderer
    "AJRouter"                                   # AllJoyn-Routerdienst
    #"wlidsvc"                                   # Anmelde-Assistent für Microsoft-Konten | gilt auch für UNC Mapping
    #"embeddedmode"
    "AppReadiness"
    #"Schedule"
    "DevQueryBroker"
    #"SystemEventsBroker"
    
    # Services which cannot be disabled
    #"WdNisSvc"
)

foreach ($service in $services) {
    Write-Output "Trying to disable $service"
    Get-Service -Name $service | Set-Service -StartupType Disabled
}
