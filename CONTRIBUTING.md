Contributing to Gamemode 4
==========================

## Adding a new GM4 Module
- Create a fork of `GM4_Datapacks` using the Fork button in the top-right of the repo. You will then have a personal copy of the repo ready for your changes.
- Each module you create should be made under a separate branch so that modules can be submitted, approved and tested individually.

### Getting the template
- Go to [https://gm4.co/modules/generator](https://gm4.co/modules/generator) to generate your module template. Be sure to **not** package the base.
- All the functionality of your module should be inside the `gm4_module_id` namespace. The exception to this is visible advancements, which go in `gm4`. If your module does not have advancements you can delete this namespace.

### Load
Gamemode 4 uses [LanternMC Load](https://github.com/LanternMC/Load) so modules work nicely with other data packs. This allows modules to check which version of the gm4 base is loaded and prevents conflicts. It also allows checking whether reliant modules are installed.

If your module requires another module, you need to list it explicitly in a few places:
- `data/load/tags/functions/gm4_module_id.json`: Prepend the values list with a value for each direct dependency. The order is important!
- Create an empty function tag in `load` for each dependency. For example `#load:gm4_custom_crafters`.
- `data/gm4_module_id/functions/load.mcfunction`: The first line checks scores to see if all dependencies are loaded. The following lines provide additional logging so the user can see which packs are incompatible or missing. This is discussed in the next section.

Initialization goes above all other commands in `init.mcfunction`. This is mostly for adding scoreboards.

#### Logging
Messages can be logged during the load process. This can be done by appending to the `queue` tag in the `gm4:log` storage. Here are a few examples:
```mcfunction
data modify storage gm4:log queue append value {type:"install",module:"XP Storage"}
data modify storage gm4:log queue append value {type:"missing",module:"Relocators",require:"Custom Crafters"}
```

### Ticking
Gamemode 4 modules use `/schedule` to run functions every few ticks. There are 2 standard clock speeds. Both functions schedule itself. You are free to add a different clock speed, however these are the standards:
- `tick.mcfunction` runs every tick.
- `main.mcfunction` runs every 16 ticks.

### Naming and formatting standards
Please be sure to match the formatting for Gamemode 4 modules to ensure readability and consistency.

- Names should be as clear and relevant as possible to avoid confusion or two modules sharing the same name by mistake.
- Any name, scoreboard name or tag should be formatted as `lowercase_with_underscores`
- Scoreboards and tags should begin with the `gm4_` prefix.
- fake players used to store numbers for scoreboard operations should be named as a "#" followed by that number e.g. `scoreboard players set #100 gm4_some_scoreboard 100`
- Entities that aren't visible to the player (markers) should have custom names beginning with `gm4_` if this does not interfere with functionality.
- Lore on items should have the first word capitalized and no fullstop at the end of the sentence if there is only one sentence. Other punctuation (?!) can be added. Descriptions should be `"color":"gray","italic":false` whilst flavor text or commands (such as "Throw to use") should be `"color":"dark_gray","italic":true`.
- Names on items should follow Minecraft's rarity colorscheme and should be `"italic":false`.

#### Comments
- Any function that is run as an entity should have a comment on the first line stating the context of @s so it is clear what runs this file e.g. `#@s = cows with speed limit=..1 of red mushrooms`
- All except those included with the template file should list the functions they are called from in a comment on the first or second line of the file e.g. `#run from main`. More complicated modules with subdirectories should specify the more specific file path e.g. `#run from zauber_cauldrons:cauldron/create`

### Compatibility with GM4 Resources
- All text visible to survival players (names, lore, actionbar, advancements) should use translation keys like this:
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

If your module requires a forceloaded chunk, be sure to include `gm4_forceload` as a library in your module's pack.mcmeta so that the website packages the appropriate files. An example of the libraries syntax can be see in the 1.16 Zauber Cauldrons pack.mcmeta.

To send us your finished module for testing and approval, simply submit a pull request and leave a comment if you have additional notes.

## Updating a module on the repo
If you've spotted a bug in a module or have a performance improvement you wish to make, create a branch of the repo similar to the process outlined in the section above and make your changes. Once you have edited the module files, create a pull request and leave a detailed note on why you have made your changes.
