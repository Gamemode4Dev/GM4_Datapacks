Contributing to Gamemode 4 
==========================

## Adding a GM4 Module that isn't in the repo yet
- Create a fork of `GM4_Datapacks` using the Fork button in the top-right of the repo. You will then have a personal copy of the repo ready for your changes.
- Make a copy of the `GM4_template_pack` folder and rename it to the name of the module you are writing code for.
- Each module you create should be made under a separate branch so that modules can be submitted, approved and tested individually.

Inside the `gm4_template_pack` folder is code that matches the Gamemode 4 module standard. Rename the `_pack.mcmeta` file to `pack.mcmeta`. The appropriate fields inside the file should be changed.

There are several placeholder values in both file names and the files themselves.
- `MODULE_ID` within this folder should be replaced with the module name in an underscored format such as `bat_grenades` or `enderman_support_class`. This should contain only lowercase characters and underscores and should match the module name on the website if the module already exists.
- `MODULE_NAME` should be replaced with a display name for the module as this is visible to players such as `Bat Grenades` or `Enderman Support Class`. This should match the name on the website if the module already exists.

### Folders
Within the `data` folder there are two folders for the different namespaces this module will use. If the module is an extension, you will need an additional module for the base module. Because we merge modules with a copy of the base clock certain folders and files are not included in the template.
#### /gm4/
This folder contains two function tags that are called by the Gamemode 4 clocking system. Small changes need to be made (see placeholder values above).
If the module does not contain advancements then the folder `gm4/advancements` should be deleted. Otherwise the advancement details should be updated. The `root.json` file should not be deleted or changed.
#### /template/
This folder should be renamed to `MODULE_ID`. All your module code should be within this folder or within sub-folders. Place your main commands in the `main.mcfunction` file and any commands that should run every tick (avoid this if possible) into `pulse_check.mcfunction`.
Additionally place `#$moduleUpdateList` at the end of `init.mcfunction`.

### Naming and formatting standards
Please be sure to match the formatting for Gamemode 4 modules to ensure readability and consistency.

- Any name, scoreboard name or tag should be formatted as `lowercase_with_underscores`
- Scoreboards and tags should begin with the `gm4_` prefix.
- fake players used to store numbers for scoreboard operations should be named as a "#" followed by that number e.g. `scoreboard players set #100 gm4_some_scoreboard 100`
- Entities that aren't visible to the player (markers) should have custom names beginning with `gm4_` if this does not interfere with functionality.
- Names for the above two points should be as clear and relevant as possible to avoid confusion or two modules sharing the same name by mistake.
- Lore on items should have the first word capitalized and no fullstop at the end of the sentence if there is only one sentence. Other punctuation (?!) can be added.
- ANY FUNCTION that is run as an entity should have a comment on the first line stating the context of @s so it is clear what runs this file e.g. `#@s = cows with speed limit=..1 of red mushrooms`
- ALL FUNCTIONS except those included with the template file should list the functions they are called from in a comment on the first or second line of the file e.g. `#run from main`. More complicated modules with subdirectories should specify the more specific file path e.g. `#run from zauber_cauldrons:cauldron/create`

### Compatibility with GM4 Resources
- All visible text (names, lore, actionbar, advancements) should use translation keys:
```json
{
  "translate": "%1$s%3427655$s",
  "with": [
    "Clever Crushing",
    {"translate": "advancement.gm4.block_compressors.title"}
  ]
}
```
- Only when your module is about to be approved and merged, you should add `CustomModelData` id's.
- Contact the collaborators of [GM4 Resources](https://github.com/Gamemode4Dev/GM4_Resources) to make sure the correct id's are allocated. Create an issue or pull request there so the correct translation keys are added.

### Testing and submitting your module
While testing your module, you need to make sure that the `base` datapack, which you can find in this repository, is included in your world's `datapacks` folder.

To send us your finished module for testing and approval, simply submit a pull request and leave a comment if you have additional notes.

## Updating a module on the repo
If you've spotted a bug in a module or have a performance improvement you wish to make, create a branch of the repo similar to the process outlined in the section above and make your changes. Once you have edited the module files, create a pull request and leave a detailed note on why you have made your changes.
