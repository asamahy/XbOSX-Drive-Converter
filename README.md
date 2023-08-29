
# XbOSX Drive Converter

This script will switch the External Drive used with Xbox One and Series S/X (so far) back and forth between being for Xbox only and a normal NTFS Drive and so it cant be used elsewhere/browsed.


## Features

- Convert to Xbox Mode
- Convert to PC/Normal Mode
- Cross platform.

## Dependencies
- GNU bash, version 3.2.57(1)-release (x86_64-apple-darwin22)
- xxd 2022-01-14 by Juergen Weigert et al.
## Installation

Clone the project

```bash
  git clone https://github.com/asamahy/XbOSX-Drive-Converter
```

## Usage/Examples

- To Change Drive to Xbox Mode
```bash
./xbosx.sh xbox /dev/disk2
```

- To Change Drive to PC/Normal Mode
```bash
./xbosx.sh pc /dev/disk2
```


## Roadmap

- List All Drives.

- Check if Drive is NTFS.

- Set the External Drive Xbox Configuration (Single or Multiple Consoles).

- Save the Xbox Identifiers for any connected Xbox.

- Modify Each Xbox's Configuration Profile.


## Disclaimer/Warning
This Script Modifies the MBR sector on your drive. It Should be Safe but I Take No Resposibility in case of any Damage
or loss of data as a result of using this script.
## FAQ

#### Can This work with any filesystem?

No, This will Only work on NTFS formatted from a windows PC. I've Tried to replicate with Paragon's NTFS for Mac
but it did not work.


## License

[GPLv3.0](https://choosealicense.com/licenses/gpl-3.0/)
