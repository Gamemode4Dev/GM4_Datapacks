Contributing to Gamemode 4
==========================

## Adding a GM4 Module that isn't in git yet
- Create a fork of `GM4_Datapacks` using the Fork button in the top-right of the git. Be sure to name it clearly as the module you plan to work on. You will then have a personal copy of the git ready for your changes.
- Make a copy of the `GM4_template_pack` folder and rename it to the name of the module you are writing code for.
- Each module you create should be made under a separate branch so that modules can be submitted, approved and tested individually.

Inside the `gm4_template_pack` is code that matches the Gamemode 4 module standard including a copy of the current clocking system. The `pack.mcmeta` file can remain unchanged.

There are several placeholder values in both file names and the files themselves.
- `MODULE_ID` within this folder should be replaced with the module name in an underscored format such as `bat_grenades` or `enderman_support_class`. This should contain only lowercase characters and underscores and should match the module name on the website if the module already exists.
- `MODULE_NAME` should be replaced with a display name for the module as this is visible to players such as `Bat Grenades` or `Enderman Support Class`. This should match the name on the website if the module already exists.

### Folders
Within the `data` folder there are three folders for the different namespaces this module will use.
#### /minecraft/
This folder simply contains code that lets Minecraft run the Gamemode 4 clocking system. NOTHING IN THIS FOLDER NEEDS TO BE CHANGED
#### /gm4/
This folder contains a copy of the Gamemode 4 clocking system and small changes need to be made (see placeholder values above). Be sure not to miss any of these placeholders!
If the module does not contain advancements then the file under `gm4/advancements` should be deleted. Otherwise the advancement details should be updated.

#### /template/
This folder should be renamed to your `MODULE_ID`. All your module code should within this folder or within sub-folders. Place your main commands in the `main.mcfunction` file and any commands that should run every tick (avoid this if possible) into `pulse_check.mcfunction`.

### Naming and formatting standards
Please be sure to match the formatting for Gamemode 4 modules to ensure readability and consistency.

- Scoreboards and tags should begin with the `gm4_` prefix.
- Entities that aren't visible to the player (markers) should have custom names beginning with `gm4_` if this does not interfere with functionality.
- Names for the above two points should be as clear and relevant as possible to avoid confusion or two modules sharing the same name by mistake.
- ANY FUNCTION that is run as an entity should have a comment on the first line stating the context of @s so it is clear what runs this file e.g. `#@s = cows with speed limit=..1 of red mushrooms`
- ALL FUNCTIONS except those included with the template file should list the functions they are called from in a comment on the first or second line of the file e.g. `#Called from main`

### Sending us your module code
To send us your finished module for testing and approval, simply submit a pull request and leave a comment if you have additional notes.

## Updating a module on the git
If you've spotted a bug in a module or have a performance improvement you wish to make, create a fork of the git similar to the process outlined in the section above and make your changes. Once you have edited the module files, create a pull request and leave a detailed note on why you have made your changes.
