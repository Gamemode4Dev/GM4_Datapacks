# Code Conventions

## Table of contents
* [Naming](#naming)
* [Comments](#comments)
* [Smithed conventions](#smithed-conventions)

## Naming
- Names should be as clear and relevant as possible to avoid confusion or two modules sharing the same name by mistake.
- Any name, scoreboard name or tag should be formatted as `lowercase_with_underscores`.
- Scoreboards and tags should begin with the `gm4_` prefix.
- Fake players used to store numbers for scoreboard operations should prefixed by "#" followed by the number, e.g. `scoreboard players set #100 gm4_some_scoreboard 100`.
- Fake players that aren't constants should be prefixed by "$", e.g. `$has_soul_fire_heatsource`.
- Entities that aren't visible to the player (markers) should have custom names beginning with `gm4_` if this does not interfere with functionality.
- Lore on items should have the first word capitalized and no fullstop at the end of the sentence if there is only one sentence. Other punctuation (?!) can be added. Descriptions should be `"color":"gray","italic":false` whilst flavor text or commands (such as "Throw to use") should be `"color":"dark_gray","italic":true`.
- Names on items should follow Minecraft's rarity colorscheme and should be `"italic":false`.

## Comments

### Function headers
All functions should start with a header comment that consists of:
```mcfunction
# Plays a particle animation upon Zauber Cauldron creation
# @s = player holding enchanted book
# at @s align xyz
# run from zauber_cauldrons:cauldron/create
```
1. (Optional) A human-readable description of the function, e.g. `# Plays a particle animation upon Zauber Cauldron creation`.
2. Executor information may be written in mcfunction format (e.g. `# @s = @e[type=mooshroom,limit=1,dx=0]`) or in human-readable format (e.g. `# @s = Mooshroom within same  blockspace, limit=1`). Complicated selectors should be written in a human-readable format.
3. Location information should include the full location (including any `align` or `positioned` arguments) or be written in human-readable format if the location is especially complicated.
4. Call information can reference:
    - a single function, if the function is run by `/function ...`: `# run from zauber_cauldrons:cauldron/create`.
    - a folder, if multiple functions call this function using `/function`: `# run from functions in gm4_pig_tractors:till/blocks/`.
    - a function from where it was scheduled: `# scheduled by zauber_cauldrons:cauldron/create`.
    - a function and function-tag pair: `# run from gm4_custom_crafters-3.0:process_input/check_item via #gm4_custom_crafter:custom_item_checks`.
    - a combination of these, in which multiple lines may be used.

### Inline comments
Inline comments should be placed to partition code into logical sections and `#` should be followed by a space, e.g.
```mcfunction
# spawns items and kills player
summon Item ~ ~ ~ {Item:{id:"minecraft:bone",Count:1b}}
kill @s
```

## Smithed conventions
🚧 TODO 🚧
