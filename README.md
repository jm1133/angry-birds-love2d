# Angry Birds LÖVE2D

An accurate **work-in-progress** port of Angry Birds' proprietary engine to **LÖVE2D**, the free and open-source game framework that uses Lua.

This project is **not** a decompilation or an official game release. Instead, it is a reimplementation of the original Angry Birds engine.

By default, the engine is bundled with **Angry Birds Classic 1.6.3.1 (PC)**, although many other versions of Angry Birds Classic, Angry Birds Seasons, and their platform variants are supported.

---

# Downloading the Engine

First, download the latest LÖVE2D nightly build and extract it into a folder.

> **Note:** The download may contain a ZIP file inside another ZIP file. Be sure to extract the one containing the executable, DLLs, and other engine files.

Next, download the source code for this project and copy all of its contents into the same folder.

Finally, copy the Angry Birds `DATA` folder into that directory.

## Linux

On Linux, simply install LÖVE (the Flatpak version is recommended), navigate to the project directory, and run:

```bash
love .
```

---

# Running the Game

You can start the game in any of the following ways:

### UNIVERSAL
- Drag `main.lua` onto `love.exe`.
### WINDOWS
- Launch `AngryBirds.exe`, a small launcher included with the project that performs the same task.
### LINUX
- Launch `AngryBirds.linux`, a small launcher included with the project that performs the same task
> **Note:** This linux file needs to be made executable with then command: `chmod +x AngryBirds.linux` and ran with the command: `./AngryBirds.linux`

---

# Building the Game

To package the project as a standalone executable, first create a `.love` archive and then follow the official LÖVE distribution guide:

https://love2d.org/wiki/Game_Distribution

---

# Command-Line Arguments

The engine supports the following optional command-line arguments:

| Argument | Description |
|----------|-------------|
| `--datapath`, `-dp` | Overrides the default `DATA` directory and uses a separate save-data folder. Useful for mods or loading directly from `.zip`, `.ipa`, or `.apk` files. Example: `--datapath 2.2.0.apk` |
| `--model`, `-m` | Overrides the detected device model. Useful for testing Android, Roku, and other platforms. |
| `--skipintro`, `-si` | Automatically skips the splash screen during startup. |
| `--run`, `+` | Executes a line of Lua code before the game starts. Examples: `--run "releaseBuild = true"` or `+"autoScale = 240"` |
| `--deletedata`, `-dd` | Prompts to delete save data (`settings.lua` and `highscores.lua`). |
| `--cheats`, `-c` | Enables cheat mode by forcing `cheatsEnabled`, overriding `options.lua`. |
| `--blamelength`, `-bl` | Sets the length of bytecode tracebacks. Useful when debugging compiled Lua files. Defaults to `0` for better performance. |
| `--nosave`, `-ns` | Prevents the engine from saving Lua data files such as `settings.lua` and `highscores.lua`. |

---

# Debug Controls

The engine includes several built-in debugging shortcuts.

| Shortcut | Action |
|----------|--------|
| **Shift + D** or click the bottom-right corner | Opens the debug console. It allows Lua code to be executed at runtime and displays a scrollable log of all `print()` output. |
| **Shift + A** | Runs the game at **5×** speed. |
| **Shift + Z** | Completely pauses the game. Press **A** to advance one frame or **Shift + A** to advance five frames. |

---

# Runtime Variables

The following variables can be modified through the debug console.

| Variable | Description |
|----------|-------------|
| `timeScale` | Controls the overall game speed. Default: `1`. |
| `audioSpeed` | Controls audio pitch and playback speed. Default: `1`. |
| `accurateAudioSpeed.on` | Attempts to emulate a forced sample rate for sound effects. Default: `false`. |
| `gravity.x` | Horizontal gravity. Default: `0`. |
| `gravity.y` | Vertical gravity. Default: `20`. |
| `autoScale` | Automatically scales the display to a target screen height. Default: `0` (`720` on Android). |
| `displayScale` | Scales the entire display. Automatically controlled by `autoScale` when enabled. Default: `1`. |

---

# Optional Dependencies

The following external tools enable support for additional Angry Birds versions.

## OpenSSL

The `libcrypto` library (part of OpenSSL) is used to decrypt encrypted Lua files.

Download `libcrypto-3.dll` from:

https://slproweb.com/products/Win32OpenSSL.html

## LZMA SDK

The LZMA SDK is used to extract Lua files compressed using the LZMA format.

Download the SDK from:

https://www.7-zip.org/sdk.html

The required executable is:

```text
bin/x64/lzma.exe
```

---

# Included Libraries

The following open-source projects are included with the engine.

## FiOne

https://github.com/Rerumu/FiOne

Used to execute compiled Lua bytecode (with several project-specific modifications).

> This library may eventually be replaced, as it is licensed under the GPL and has relatively high memory usage, causing the garbage collector to run more frequently.

## love-webp

https://github.com/ImagicTheCat/love-webp

Provides support for loading WebP images.

## lua-bit-numberlua

https://github.com/davidm/lua-bit-numberlua

Acts as a replacement for LuaJIT's `bit` library when LuaJIT is unavailable.

---

# Disclaimer

This project is an independent reimplementation of the Angry Birds engine.

It is **not** affiliated with, endorsed by, or sponsored by Rovio Entertainment Corporation.