# Contributing to Gamemode 4
Contributions are welcome! This project uses [poetry](https://python-poetry.org/) and [beet](https://mcbeet.dev) for building our data packs.

## Prerequisites
1. Install [VSCode](https://code.visualstudio.com/)
2. Install [git](https://git-scm.com/downloads)
3. Install [Python](https://www.python.org/downloads/)
4. Install [Poetry](https://python-poetry.org/docs/)

## Setup
1. Create a fork of this repository and clone your fork locally.
2. Each module or change should be made under a separate branch so that modules can be submitted, approved and tested individually.
3. Run `poetry install`.
4. Poetry uses virtual environments, stored in a `.venv` folder. If VSCode doesn't detect this automatically, run `poetry shell` and then close and reopen the terminal. `(.venv)` should be printed in the terminal.
4. Run `beet` to build all modules an `out` folder.

## Developing
Useful commands while developing:
```bash
# Build all modules
$ beet build
$ beet watch

# Build only some modules
$ beet dev bat_grenades disassemblers

# Link the built packs to a local world (you only need to link once)
$ beet dev metallurgy *_shamir --link MyWorld

# auto-reload when changing files
$ beet dev gm4_bat_grenades --reload
```

### Load
Gamemode 4 uses [LanternMC Load](https://github.com/LanternMC/Load) so modules work nicely with other data packs. This allows modules to check which version of the gm4 base is loaded and prevents conflicts. It also allows checking whether reliant modules are installed.

If your module requires another module, you need to list it explicitly in a few places:
- `data/load/tags/functions/gm4_module_id.json`: Prepend the values list with a value for each direct dependency. The order is important!
- Create an empty function tag in `load` for each dependency. For example `#load:gm4_better_armor_stands`.
- `data/gm4_module_id/functions/load.mcfunction`: The first line checks scores to see if all dependencies are loaded. The following lines provide additional logging so the user can see which packs are incompatible or missing. This is discussed in the next section.

Initialization goes above all other commands in `init.mcfunction`. This is mostly for adding scoreboards and initializing fake players.

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
- fake players that aren't constants should be prefixed by "$" and be in `snake_case`, e.g. `$has_soul_fire_heatsource`
- Entities that aren't visible to the player (markers) should have custom names beginning with `gm4_` if this does not interfere with functionality.
- Lore on items should have the first word capitalized and no fullstop at the end of the sentence if there is only one sentence. Other punctuation (?!) can be added. Descriptions should be `"color":"gray","italic":false` whilst flavor text or commands (such as "Throw to use") should be `"color":"dark_gray","italic":true`.
- Names on items should follow Minecraft's rarity colorscheme and should be `"italic":false`.

#### Comments
- Any function except those included with the template file should start with a header comment that consists of:
```mcfunction
# Plays a particle animation upon Zauber Cauldron creation
# @s = player holding enchanted book
# at @s align xyz
# run from zauber_cauldrons:cauldron/create
```
- (Optional) A human-readable description of the function, e.g. `# Plays a particle animation upon Zauber Cauldron creation`.
- Executor information may be written in mcfunction format (e.g. `# @s = @e[type=mooshroom,limit=1,dx=0]`) or in human-readable format (e.g. `# @s = Mooshroom within same  blockspace, limit=1`). Complicated selectors should be written in a human-readable format.
- Location information should include the full location -- including any `align` or `positioned` arguments -- or be written in human-readable format if the location is   especially complicated.
- Call information can reference
  - a single function, if the function is run by `/function ...`: `# run from zauber_cauldrons:cauldron/create`.
  - a folder, if multiple functions call this function using `/function`: `# run from functions in gm4_pig_tractors:till/blocks/`.
  - a function from where it was scheduled: `# scheduled by zauber_cauldrons:cauldron/create`.
  - a combination of these, in which multiple lines would be used.

- Inline comments should be placed to partition code into logical sections and `#` should be followed by a space, e.g.
```mcfunction
# spawns items and kills player
summon Item ~ ~ ~ {Item:{id:"minecraft:bone",Count:1b}}
kill @s
```

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

If your module requires a library, e.g. `gm4_forceload`, be sure to include `gm4_forceload` as a library in your module's pack.mcmeta so that the website packages the appropriate files. An example of the libraries syntax can be see in the 1.18 Zauber Cauldrons pack.mcmeta.

Make sure to credit all relevant people in `pack.mcmeta`. Most modules credit the creator (`Creator`), updaters (`Updated by`) and the icon designer (`Icon Design`), however, you may add credits for any work relevant to the module. Each credits section consists of an array of strings, which hold the names of the contributors. To add a link to your social media site of choice add an entry to `contributors.json`.  

To send us your finished module for testing and approval, simply submit a pull request and leave a comment if you have additional notes.

### Updating a module on the repo
If you've spotted a bug in a module or have a performance improvement you wish to make, create a branch of the repo similar to the process outlined in the section above and make your changes. Once you have edited the module files, create a pull request and leave a detailed note on why you have made your changes.
