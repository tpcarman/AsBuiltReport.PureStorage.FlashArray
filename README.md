<p align="center">
    <a href="https://www.asbuiltreport.com/" alt="AsBuiltReport"></a>
            <img src='https://raw.githubusercontent.com/AsBuiltReport/AsBuiltReport/master/AsBuiltReport.png' width="8%" height="8%" /></a>
</p>
<p align="center">
    <a href="https://www.powershellgallery.com/packages/AsBuiltReport.PureStorage.FlashArray/" alt="PowerShell Gallery Version">
        <img src="https://img.shields.io/powershellgallery/v/AsBuiltReport.PureStorage.FlashArray.svg" /></a>
    <a href="https://www.powershellgallery.com/packages/AsBuiltReport.PureStorage.FlashArray/" alt="PS Gallery Downloads">
        <img src="https://img.shields.io/powershellgallery/dt/AsBuiltReport.PureStorage.FlashArray.svg" /></a>
    <a href="https://www.powershellgallery.com/packages/AsBuiltReport.PureStorage.FlashArray/" alt="PS Platform">
        <img src="https://img.shields.io/powershellgallery/p/AsBuiltReport.PureStorage.FlashArray.svg" /></a>
</p>
<p align="center">
    <a href="https://github.com/AsBuiltReport/AsBuiltReport.PureStorage.FlashArray/graphs/commit-activity" alt="GitHub Last Commit">
        <img src="https://img.shields.io/github/last-commit/AsBuiltReport/AsBuiltReport.PureStorage.FlashArray/master.svg" /></a>
    <a href="https://raw.githubusercontent.com/AsBuiltReport/AsBuiltReport.PureStorage.FlashArray/master/LICENSE" alt="GitHub License">
        <img src="https://img.shields.io/github/license/AsBuiltReport/AsBuiltReport.PureStorage.FlashArray.svg" /></a>
    <a href="https://github.com/AsBuiltReport/AsBuiltReport.PureStorage.FlashArray/graphs/contributors" alt="GitHub Contributors">
        <img src="https://img.shields.io/github/contributors/AsBuiltReport/AsBuiltReport.PureStorage.FlashArray.svg"/></a>
</p>
<p align="center">
    <a href="https://twitter.com/AsBuiltReport" alt="Twitter">
            <img src="https://img.shields.io/twitter/follow/AsBuiltReport.svg?style=social"/></a>
</p>

<p align="center">
    <a href='https://ko-fi.com/B0B7DDGZ7' target='_blank'><img height='36' style='border:0px;height:36px;' src='https://cdn.ko-fi.com/cdn/kofi1.png?v=3' border='0' alt='Buy Me a Coffee at ko-fi.com' /></a>
</p>

# PureStorage FlashArray As Built Report
Pure Storage FlashArray AsBuiltReport is a module of the parent "AsBuiltReport" [project](https://github.com/AsBuiltReport/AsBuiltReport). AsBuiltReport is a PowerShell module which generates As-Built documentation for many common datacentre infrastructure systems. Reports can be generated in Text, HTML and MS Word formats and can be presented with custom styling to align with your company/customer's brand.

For detailed documentation around the whole project, please refer to the `README.md` file in the parent AsBuiltReport repository (linked to above). This README is specific only to the PureStorage Flasharray repository.

## :books: Sample Reports

# :beginner: Getting Started

## :floppy_disk: Supported Versions


This report is compatible with the following Purity and PowerShell versions;

| Purity Version | Pure Storage SDK | Windows PowerShell 5.1 |     PowerShell 7    |
| :--------------: | :--------------: | :----------------------: |:--------------------: |
| 4.8.0 - 5.3.0 | 1.x |   :white_check_mark:   | :x: |
| 6.0.0 or later | 2.x | :white_check_mark:   | :white_check_mark: |
## :wrench: System Requirements
PowerShell 5.1 or PowerShell 7, and the following PowerShell modules are required for generating a Pure Storage FlashArray As Built report.

Each of these modules can be easily downloaded and installed via the PowerShell Gallery
- [Pure Storage Powershell SDK Module](https://www.powershellgallery.com/packages/PureStoragePowerShellSDK/)
- [Pure Storage Powershell SDK2 Module](https://www.powershellgallery.com/packages/PureStoragePowerShellSDK2/)
- [AsBuiltReport Module](https://www.powershellgallery.com/packages/AsBuiltReport/)
### Linux & macOS
* .NET Core is required for cover page image support on Linux and macOS operating systems.
    * [Installing .NET Core for macOS](https://docs.microsoft.com/en-us/dotnet/core/install/macos)
    * [Installing .NET Core for Linux](https://docs.microsoft.com/en-us/dotnet/core/install/linux)

❗ If you are unable to install .NET Core, you must set `ShowCoverPageImage` to `False` in the report JSON configuration file.
### :closed_lock_with_key: Required Privileges
To generate a Pure Storage FlashArray report, a user account with the readonly role of higher on the FlashArray is required.

## :package: Module Installation

### PowerShell
Open a PowerShell terminal window and install each of the required modules.

```powershell
Install-Module PureStoragePowerShellSDK
Install-Module PureStoragePowerShellSDK2
install-module AsBuiltReport.PureStorage.FlashArray
```

### GitHub
If you are unable to use the PowerShell Gallery, you can still install the module manually. Ensure you repeat the following steps for the [system requirements](https://github.com/AsBuiltReport/AsBuiltReport.PureStorage.FlashArray#wrench-system-requirements) also.

1. Download the code package / [latest release](https://github.com/AsBuiltReport/AsBuiltReport.PureStorage.FlashArray/releases/latest) zip from GitHub
2. Extract the zip file
3. Copy the folder `AsBuiltReport.PureStorage.FlashArray` to a path that is set in `$env:PSModulePath`.
4. Open a PowerShell terminal window and unblock the downloaded files with
    ```powershell
    $path = (Get-Module -Name AsBuiltReport.PureStorage.FlashArray -ListAvailable).ModuleBase; Unblock-File -Path $path\*.psd1; Unblock-File -Path $path\Src\Public\*.ps1; Unblock-File -Path $path\Src\Private\*.ps1
    ```
5. Close and reopen the PowerShell terminal window.

_Note: You are not limited to installing the module to those example paths, you can add a new entry to the environment variable PSModulePath if you want to use another path._

## :pencil2: Configuration

The PureStorage FlashArray As Built Report utilises a JSON file to allow configuration of report information, options, detail and healthchecks.

A PureStorage FlashArray report configuration file can be generated by executing the following command;
```powershell
New-AsBuiltReportConfig -Report AsBuiltReport.PureStorage.FlashArray -FolderPath <User specified folder> -Filename <Optional>
```

Executing this command will copy the default PureStorage FlashArray report JSON configuration to a user specified folder.

All report settings can then be configured via the JSON file.

The following provides information of how to configure each schema within the report's JSON file.

### Report
The **Report** schema provides configuration of the PureStorage FlashArray report information.

| Sub-Schema          | Setting      | Default                        | Description                                                  |
|---------------------|--------------|--------------------------------|--------------------------------------------------------------|
| Name                | User defined | PureStorage FlashArray As Built Report | The name of the As Built Report                              |
| Version             | User defined | 1.0                            | The report version                                           |
| Status              | User defined | Released                       | The report release status                                    |
| ShowCoverPageImage  | true / false | true                           | Toggle to enable/disable the display of the cover page image |
| ShowTableOfContents | true / false | true                           | Toggle to enable/disable table of contents                   |
| ShowHeaderFooter    | true / false | true                           | Toggle to enable/disable document headers & footers          |
| ShowTableCaptions   | true / false | true                           | Toggle to enable/disable table captions/numbering            |

### Options
The **Options** schema allows certain options within the report to be toggled on or off.

### InfoLevel
The **InfoLevel** schema allows configuration of each section of the report at a granular level. The following sections can be set.

There are 6 levels (0-5) of detail granularity for each section as follows;

| Setting | InfoLevel         | Description                                                                                                                                |
|:-------:|-------------------|--------------------------------------------------------------------------------------------------------------------------------------------|
|    0    | Disabled          | Does not collect or display any information                                                                                                |
|    1    | Enabled / Summary | Provides summarised information for a collection of objects                                                                                |
|    2    | Adv Summary       | Provides condensed, detailed information for a collection of objects                                                                       |
|    3    | Detailed          | Provides detailed information for individual objects                                                                                       |
|    4    | Adv Detailed      | Provides detailed information for individual objects, as well as information for associated objects                                        |
|    5    | Comprehensive     | Provides comprehensive information for individual objects, such as advanced configuration settings                                         |

### Healthcheck
The **Healthcheck** schema is used to toggle health checks on or off.

## :computer: Examples


