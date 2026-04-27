# Neovim Config
This serves as an archive for my Neovim configuration.

To ensure the debugger works correctly, create a .env file in the root directory and add the following:
```
WINDOWS_PROFILE_NAME=yourprofilename
```
This ensures the correct debuggers can correctly be found.\
Also, there is no need to mention that the executables required for the debugger need to be installed.

To clone this:
## Windows:
### Powershell:
```
git clone --depth=1 https://github.com/abdallahsoliman00/nvim-config.git $env:LOCALAPPDATA/nvim
```
### CMD:
```
git clone --depth=1 https://github.com/abdallahsoliman00/nvim-config.git %localappdata%/nvim
```

## Linux:
```
git clone --depth=1 https://github.com/abdallahsoliman00/nvim-config.git ~/.config/nvim
```

I don't know what else you're looking for, the repo name is self explanatory.
