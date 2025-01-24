# Windows 10 debloatieren

**Hinweis zum Creators Update:** Diese Skripte wurden **_nicht_** mit dem Creators Update getestet. Es kann alles passieren, seien Sie vorbereitet. Ich werde relevante Änderungen und aktuelle Probleme untersuchen, wenn das Update veröffentlicht/an alle weitergegeben wird.

Dieses Projekt sammelt Powershell-Skripte, die dabei helfen, Windows 10 zu debloatieren, allgemeine Einstellungen zu optimieren und grundlegende Softwarekomponenten zu installieren.

Ich teste diese Skripte auf einer virtuellen Maschine mit Windows 10 Professional 64-Bit (Englisch). Bitte lassen Sie mich wissen, wenn Sie auf Probleme stoßen. Home Edition und andere Sprachen werden nicht unterstützt. Diese Skripte sind für technisch versierte Administratoren gedacht, die wissen, was sie tun, und nur diese Phase ihrer Einrichtung automatisieren möchten. Wenn dieses Profil nicht zu Ihnen passt, empfehle ich die Verwendung eines anderen (interaktiveren) Tools – und davon gibt es viele.

**Es gibt keine Möglichkeit zum Rückgängigmachen.** Ich empfehle, diese Skripte nur bei einer Neuinstallation (einschließlich Windows-Updates) zu verwenden. Testen Sie alles, nachdem Sie sie ausgeführt haben, bevor Sie irgendetwas anderes tun. Außerdem gibt es keine Garantie, dass nach zukünftigen Updates alles funktioniert, da ich nicht vorhersagen kann, was Microsoft als Nächstes tun wird.

## Interaktivität
Die Skripte sind so konzipiert, dass sie ohne Benutzerinteraktion ausgeführt werden. Ändern Sie sie vorher. Wenn Sie einen interaktiveren Ansatz wünschen, sehen Sie sich DisableWinTracking von 10se1ucgo an.

## Neueste Version herunterladen
Code im Master-Zweig wird immer als in Entwicklung befindlich betrachtet, aber Sie möchten wahrscheinlich trotzdem die neueste Version.

- [Download [zip]](https://github.com/W4RH4WK/Debloat-Windows-10/archive/master.zip)

## Execution

Enable execution of PowerShell scripts:

    PS> Set-ExecutionPolicy Unrestricted

Unblock PowerShell scripts and modules within this directory:

    PS > ls -Recurse *.ps1 | Unblock-File
    PS > ls -Recurse *.psm1 | Unblock-File

## Usage

1. Installieren Sie alle verfügbaren Updates für Ihr System.
2. Bearbeiten Sie die Skripte nach Bedarf.
3. Führen Sie die Skripte von einer PowerShell mit Administratorrechten aus (Explorer
`Dateien > Windows PowerShell öffnen > Windows PowerShell als
Administrator öffnen`)
4. `PS > Computer neu starten`
5. Führen Sie `disable-windows-defender.ps1` noch einmal aus.
6. `PS > Computer neu starten`

## Startmenu

Früher habe ich kleine Korrekturen vorgenommen, um das Startmenü benutzerfreundlicher zu machen, wie z. B. das Entfernen von Standardkacheln, das Deaktivieren der Websuche und so weiter. Dies ist nicht mehr der Fall, da ich es satt habe. Dieses verdammte Menü bricht anscheinend aus unbekanntem Grund zusammen, ist langsam, lässt sich mühsam konfigurieren/skripten und zeigt sogar standardmäßig Werbung an!

Bitte ersetzen Sie es durch etwas Besseres, verwenden Sie entweder [Classic Shell] oder [Start
ist zurück], aber hören Sie auf, diesen Mist zu verwenden.

[Classic Shell]: <http://www.classicshell.net/>
[Start is Back]: <http://startisback.com/>

## Known Issues

### Startmenu Search

After running the scripts, the startmenu search-box may no longer work on newly
created accounts. It seems like there is an issue with account initilization
that is triggered when disabling the GeoLocation service. Following workaround
has been discovered by BK from Atlanta:

1. Delete registry key `HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\lfsvc\TriggerInfo\3`
2. Re-enable GeoLocation service (set startup type to `Automatic`)
3. Reboot
4. Login with the account having the stated issue
5. Start Cortana and set your preferences accordingly (web search and whatnot)

You may now disable the GeoLocation service again, the search box should remain
functional.

### Sysprep will hang

If you are deploying images with MDT and running these scripts, the sysprep
step will hang unless `dmwappushserivce` is active.

### XBox Wireless Adapter

Apprently running the stock `remove-default-apps` script will cause XBox
Wireless Adapters to stop functioning. I suspenc one should not remove the XBox
App when wanting to use one. But I haven't confirmed this yet, and there is a
workaround to re-enable it afterwards. See
[#78](https://github.com/W4RH4WK/Debloat-Windows-10/issues/78).

## Liability

**All scripts are provided as is and you use them at your own risk.**

## Contribute

I would be happy to extend the collection of scripts. Just open an issue or
send me a pull request.

### Thanks To

- [10se1ucgo](https://github.com/10se1ucgo)
- [Plumebit](https://github.com/Plumebit)
- [aramboi](https://github.com/aramboi)
- [maci0](https://github.com/maci0)
- [narutards](https://github.com/narutards)
- [tumpio](https://github.com/tumpio)

## License

    "THE BEER-WARE LICENSE" (Revision 42):

    As long as you retain this notice you can do whatever you want with this
    stuff. If we meet some day, and you think this stuff is worth it, you can
    buy us a beer in return.

    This project is distributed in the hope that it will be useful, but WITHOUT
    ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
    FITNESS FOR A PARTICULAR PURPOSE.
