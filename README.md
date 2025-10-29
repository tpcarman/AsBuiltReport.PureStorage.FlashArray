<!-- ********** DO NOT EDIT THESE LINKS ********** -->
<p align="center">
    <a href="https://www.asbuiltreport.com/" alt="AsBuiltReport"></a>
            <img src='https://github.com/AsBuiltReport.png' width="8%" height="8%" /></a>
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
    <a href='https://ko-fi.com/B0B7DDGZ7' target='_blank'><img height='36' style='border:0px;height:36px;' src='https://ko-fi.com/img/githubbutton_sm.svg' border='0' alt='Want to keep alive this project? Support me on Ko-fi' /></a>
</p>
<!-- ********** DO NOT EDIT THESE LINKS ********** -->

# PureStorage FlashArray As Built Report

<!-- ********** REMOVE THIS MESSAGE WHEN THE MODULE IS FUNCTIONAL ********** -->
## :exclamation: THIS ASBUILTREPORT MODULE IS CURRENTLY IN DEVELOPMENT AND MIGHT NOT YET BE FUNCTIONAL ❗

PureStorage FlashArray As Built Report is a PowerShell module which works in conjunction with [AsBuiltReport.Core](https://github.com/AsBuiltReport/AsBuiltReport.Core).

[AsBuiltReport](https://github.com/AsBuiltReport/AsBuiltReport) is an open-sourced community project which utilises PowerShell to produce as-built documentation in multiple document formats for multiple vendors and technologies.

Please refer to the AsBuiltReport [website](https://www.asbuiltreport.com) for more detailed information about this project.

# :beginner: Getting Started
Below are the instructions on how to install, configure and generate a PureStorage FlashArray As Built report.

## :floppy_disk: Supported Versions
<!-- ********** Update supported FlashArray versions ********** -->
The PureStorage FlashArray As Built Report supports the following FlashArray versions;

### PowerShell
This report is compatible with the following PowerShell versions;

<!-- ********** Update supported PowerShell versions ********** -->
| Windows PowerShell 5.1 |     PowerShell 7    |
|:----------------------:|:--------------------:|
|   :white_check_mark:   | :white_check_mark: |
## :wrench: System Requirements
<!-- ********** Update system requirements ********** -->
PowerShell 5.1 or PowerShell 7, and the following PowerShell modules are required for generating a PureStorage FlashArray As Built Report.

- [AsBuiltReport.PureStorage.FlashArray Module](https://www.powershellgallery.com/packages/AsBuiltReport.PureStorage.FlashArray/)

### :closed_lock_with_key: Required Privileges
<!-- ********** Define required privileges ********** -->
<!-- ********** Try to follow best practices to define least privileges ********** -->

## :package: Module Installation

### PowerShell
<!-- ********** Add installation for any additional PowerShell module(s) ********** -->
```powershell
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
New-AsBuiltReportConfig -Report PureStorage.FlashArray -FolderPath <User specified folder> -Filename <Optional>
```

Executing this command will copy the default PureStorage FlashArray report JSON configuration to a user specified folder.

All report settings can then be configured via the JSON file.

The following provides information of how to configure each schema within the report's JSON file.

<!-- ********** DO NOT CHANGE THE REPORT SCHEMA SETTINGS ********** -->
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

<!-- ********** Add/Remove the number of InfoLevels as required ********** -->
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
<!-- ********** Add some examples. Use other AsBuiltReport modules as a guide. ********** -->
