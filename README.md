<img src="Fabtools.png" alt="drawing" width="200"/>

# Fabtools PowerShell Module

Fabtools is a PowerShell module to be able to able to do more with Microsoft Fabric and Power BI.
It allows for various administrative tasks to be automated and integrated into workflows.

## Features

- Manage PowerBI workspaces and datasets.
- Assign PowerBI workspaces to capacities.
- Retrieve and manipulate PowerBI tenant settings.
- Handle PowerBI access tokens for authentication.
- Suspend and resume Azure capacities.
- Fabric-friendly aliases for lots of the old PowerBI cmdlets

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes.

### Prerequisites

- PowerShell 5.1 or higher
- Access to PowerBI service and Azure subscription (for certain functions)
- Necessary permissions to manage PowerBI workspaces and Fabric capacities
- The following PowerShell modules: MicrosoftPowerBIMgmt, Az.Accounts, Az.Resources

### Installing

To install the Fabtools module, you can install it from the PowerShell Gallery:

```powershell
Install-Module Fabtools 
```

Or clone the repository to your local machine and import the module:

```powershell
# Clone the repository
git clone https://github.com/Jojobit/fabtools.git

# Import the module
Import-Module ./Fabtools/Fabtools.psm1
```



## Usage

Once imported, you can call any of the functions provided by the module. For example:

```powershell
# Assign a workspace to a capacity
Register-FabricWorkspaceToCapacity -WorkspaceId "Workspace-GUID" -CapacityId "Capacity-GUID"
```

Refer to the individual function documentation for detailed usage instructions.


## [Release Notes](ReleaseNotes.md)


## Contributing

Contributions to Fabtools are welcome. Please read [CONTRIBUTING.md](CONTRIBUTING.md) for details on our code of conduct, 
and the process for submitting pull requests to us.

## Authors

- **Ioana Bouariu** - *Initial work* - [Jojobit](https://github.com/Jojobit)


See also the list of [contributors](https://github.com/Jojobit/fabtools/contributors) who participated in this project.

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details.

## Acknowledgments

- GitHub Copilot and ChatGPT for helping with the documentation
- [**Rui Romano**](https://github.com/RuiRomano) - His work on a [Fabric PowerShell module](https://github.com/RuiRomano/fabricps-pbip) has been included into this module with his permission. Thanks, Rui!
