Epic Online Services Godot (WIP)
=========================================
<img alt="Project Logo" src="./_media/logo.png" height="150">

### Unofficial Epic Online Services wrapper for Godot Engine 4.x (includes demo project)

<img alt="Godot3" src="https://img.shields.io/badge/-Godot 4.x-478CBF?style=for-the-badge&logo=godotengine&logoWidth=20&logoColor=white" />&nbsp;&nbsp;&nbsp;<img alt="Epic Online Services 1.15" src="https://img.shields.io/badge/-Epic Online Services 1.15-313131?style=for-the-badge&logo=epic-games&logoWidth=20&logoColor=white" />

> Tested on: Windows 10 x64 and Linux x64

> Disclaimer: This project is NOT affiliated with Epic Games Inc or Godot Engine. It doesn't endorse Epic Online Services. This project and sample Godot scenes are provided solely for educational purposes and may or may not comply with Epic Games' Design Guidelines, if you plan to release a game make sure you read the [Guidelines](https://dev.epicgames.com/docs/services/en-US/EpicAccountServices/DesignGuidelines/index.html) and any other steps needed to release a public game like asking for user consent, option to delete user data, website with privacy policy and license, etc.


#### The [godot3-mono](https://github.com/3ddelano/epic-online-services-godot/tree/godot3-mono) branch is for Godot 3.x Mono (C#)
#### The [main](https://github.com/3ddelano/epic-online-services-godot/tree/main) branch is for Godot 4.x non-mono

## [View Current Status](#current-status)

## [Demo Video (Coming Soon)](#)

## [Documentation (Coming Soon)](#)

How does it work
--------------

This project uses GDExtension to wrap the Epic Online Services C SDK so that it can be easily used in Godot using GDScript, C#, etc with similar class hierarchy and static type support. It makes use of signals for sending events like user login, logout, achievement unlock, etc.


Installation
--------------

This is a regular plugin for `Godot 4.x`. To install the plugin follow the steps below:

1. Goto the Releases section and download the [latest release](https://github.com/3ddelano/epic-online-services-godot/releases/latest)
2. Extract the zip file and copy the `addons/epic-online-services-godot` folder into the `addons/` folder in of your project.
3. Goto `Project->Project Settings->Plugins` and enable the `Epic Online Services Godot 4.x` plugin.
4. You can now use the plugin. Head to the [Documentation](#) for more information on how to use the plugin. Use the below simple script.
   ```GDScript
   # In main script
   extends Node

   func _ready():
        # Initialize the SDK
        var init_options = EOS.Platform.InitializeOptions.new()
        init_options.product_name = "PRODUCT_NAME_HERE"
        init_options.product_version = "PRODUCT_VERSION_HERE"

        var init_result := EOS.Platform.PlatformInterface.initialize(init_options)
        if init_result != EOS.Result.Success:
            print("Failed to initialize EOS SDK: ", EOS.result_str(init_result))
            return

        # Create platform
        var create_options = EOS.Platform.CreateOptions.new()
        create_options.product_id = "PRODUCT_ID_HERE"
        create_options.sandbox_id = "SANDBOX_ID_HERE"
        create_options.deployment_id = "DEPLOYMENT_ID_HERE"
        create_options.client_id = "CLIENT_ID_HERE"
        create_options.client_secret = "CLIENT_SECRET_HERE"
        create_options.encryption_key = "ENCRYPTION_KEY_HERE"

        # Enable Social Overlay on Windows
        if OS.get_name() == "Windows":
            create_options.flags = EOS.Platform.PlatformFlags.WindowsEnableOverlayOpengl

        var create_result := EOS.Platform.PlatformInterface.create(create_options)
        if not create_result:
            print("Failed to create EOS Platform")
            return

        # Setup Logs from EOS
        EOS.get_instance().connect("logging_interface_callback", Callable(self, "_on_logging_interface_callback"))
        var res := EOS.Logging.set_log_level(EOS.Logging.LogCategory.AllCategories, EOS.Logging.LogLevel.Info)
        if res != EOS.Result.Success:
            print("Failed to set log level: ", EOS.result_str(res))
    
    func _on_logging_interface_callback(msg):
        msg = EOS.Logging.LogMessage.from(msg) as EOS.Logging.LogMessage
        print("SDK %s | %s" % [msg.category, msg.message])
   ```


Development Setup
--------------

#### Pre-requisites
- Godot Engine 4.x (Get it here [Godot Engine Download](https://godotengine.org/download/))
- Epic Online Services C SDK (Download from [Epic Developer Portal](https://dev.epicgames.com/portal/sdk))
- Make sure you have accepted the Terms and Conditions for [Epic Online Services](https://www.epicgames.com/site/en-US/tos?lang=en-US)
- A product registered with Epic Games Services (Make one for free [Epic Developer Portal](https://dev.epicgames.com/portal))

To develop this plugin, follow the below steps:
1. Download/clone the repository.

2. Extract the `EOS C SDK` zip downloaded from Epic Games, rename it to `eos-sdk` and paste it in the `thirdparty/` folder. Refer to the below folder structure.
   
   <img src="./_media/eos_folder_structure.png">

3. Follow the steps to generate the GDExtension bindings for C++ based on [this tutorial](https://docs.godotengine.org/en/stable/tutorials/scripting/gdextension/gdextension_cpp_example.html#building-the-c-bindings). Now you should have dumped the GDextension API interface and built the `godot-cpp` library.

4. Build the GDExtension plugin in debug mode (With debug symbols)
   ```shell
   # In root folder
   scons platform=<platform> -j4 target=template_debug dev_build=yes
   ```
   Eg. `scons platform=windows -j4 target=template_debug dev_build=yes`

5. Build the GDExtension plugin for release (Optimized)
   ```shell
   # In root folder
   scons platform=windows -j4 target=template_release
   ```

6. The build GDExtension library will be in the `addons/epic-online-services-godot/bin/` folder with a `/demo/addons/epic-online-services-godot/bin`.


### How to run the sample project?
> The sample Godot project is located in the **Sample** folder

1. Clone/Download the repo.
2. Download the [latest release](https://github.com/3ddelano/epic-online-services-godot/releases/latest) from the Releases section and replace the existing `/addons/epic-online-services-godot` with the one from the Release (this includes the built shared libraries).
3. Copy your credentials (`Product Id`, `Sandbox Id`, `Deployment Id`, `Client Id`, `Client Secret`) of your Epic Games "Product" from the Epic Games Dev Portal and paste them in `Main.gd` script in the relevant sections. The encryption key is a random 64 character long string. These credentials need to be kept as private as possible. One way is to make sure to encrypt all scripts when exporting the final game. (See [Compiling with script key encryption](https://docs.godotengine.org/en/stable/development/compiling/compiling_with_script_encryption_key.html))

4. Configure your Product on the EOS Dev Portal with the following configuration:
  - In the `Client Policies` section in `Product Settings`, enable all the features except `Connect` (Disabled by Epic)
  - In the `Permissions` section of `Epic Account Services`, enable all three: `Basic Profile`, `Online Presence` and `Friends`. 
  - (Optional if you want some pre-made achievements)
  In the `Achievements` section in `Game Services`, use the `Bulk Import` option and import the `HelloProduct.zip` file located at `res://HelloProduct.zip`

### Bootstrapping Godot executable with Epic Online Services
If you want to use the `Account Portal` login option in Epic Online Services, you need to bootstrap the Godot/Game executable as needed by `EOS-SDK 1.15` and greater. See [Redistributable Installer](https://dev.epicgames.com/docs/services/en-US/EpicAccountServices/Crossplayacrossplatforms/RedistributableInstaller/index.html)

A sample of the generated `.ini` file for the Godot Editor is shown below (during game development):
```
ApplicationPath=Godot_v4.0.0-stable_win64.exe
WorkingDirectory=
WaitForExit=0
NoOperation=0
```
Follow the instructions in [Running the service for local development](https://dev.epicgames.com/docs/services/en-US/EpicAccountServices/Crossplayacrossplatforms/RedistributableInstaller/index.html#runningtheserviceforlocaldevelopment) and:
- During game development
  
  Bootstrap the Godot Editor executable (eg. `Godot_v4.0.0-stable_win64.exe`) to test the `Account Portal` login
- After exporting the game
  
  Bootstrap the exported game executable (eg. `My Amazing Game.exe`)

# Support Development

### Making this project took a lot of time and effort, reading the EOS documentation countless times and testing each method in Godot. I would really appreciate if you could support the project in any way.

<a href="https://www.buymeacoffee.com/3ddelano" target="_blank"><img height="41" width="174" src="https://cdn.buymeacoffee.com/buttons/v2/default-red.png" alt="Buy Me A Coffee" width="150" ></a>

#### Want to support in other ways? Contact me on Discord: `@3ddelano#6033`

Join the Discord server for discussing suggestions or bugs: [3ddelano Cafe](https://discord.gg/FZY9TqW)

## Current Status

- Auth Interface
  - [x] Implementation
  - [x] Sample
- Achievements Interface
  - [x] Implementation
  - [x] Sample
- Connect Interface
  - [x] Implementation
  - [x] Sample
- CustomInvites Interface
  - [x] Implementation
  - [x] Sample
- Friends Interface
  - [x] Implementation
  - [x] Sample
- Stats Interface
  - [x] Implementation
  - [x] Sample
- UserInfo Interface
  - [x] Implementation
  - [x] Sample
- Leaderboards Interface
  - [x] Implementation
  - [x] Sample
- KWS Interface
  - [x] Implementation
  - [ ] Sample (No general access yet)
- Lobby Interface
  - [ ] Implementation
  - [ ] Sample
- Metrics Interface
  - [x] Implementation
  - [x] Sample
- Mods Interface
  - [x] Implementation
  - [x] Sample
- P2P Interface
  - [ ] Implementation
  - [ ] Sample
- PlayerDataStorage Interface
  - [ ] Implementation
  - [ ] Sample
- Presence Interface
  - [x] Implementation
  - [x] Sample
- ProgressionSnapshot Interface
  - [x] Implementation
  - [x] Sample
- Reports Interface
  - [x] Implementation
  - [x] Sample
- RTC Interface
  - [ ] Implementation
  - [ ] Sample
- Sanctions Interface
  - [ ] Implementation
  - [ ] Sample
- Sessions Interface
  - [ ] Implementation
  - [ ] Sample
- TitleStorage Interface
  - [ ] Implementation
  - [ ] Sample
- UI Interface
  - [x] Implementation
  - [x] Sample
- Ecom Interface
  - [x] Implementation
  - [] Sample (Needs Epic Games Store access)
- AntiCheatServer Interface
  - [ ] Implementation
  - [ ] Sample
- AntiCheatClient Interface
  - [ ] Implementation
  - [ ] Sample
- Version Interface
  - [x] Implementation
  - [x] Sample