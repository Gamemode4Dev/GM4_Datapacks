# Code Conventions

## Table of contents
* [Naming](#naming)
* [Comments](#comments)
  * [Function headers](#function-headers)
  * [Inline comments](#inline-comments)
* [Smithed conventions](#smithed-conventions)
  * [CMD prefixing](#cmd-prefixing)
  * [Tag specification](#tag-specification)

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
    - an advancement reward: `# run from advancement damaged/armor/stall`
    - a combination of these, in which multiple lines may be used.

### Inline comments
Inline comments should be placed to partition code into logical sections and `#` should be followed by a space, e.g.
```mcfunction
# spawns items and kills player
summon Item ~ ~ ~ {Item:{id:"minecraft:bone",count:1}}
kill @s
```

## Smithed conventions
We follow the Smithed conventions in our data pack. For the full documentation, see the [Smithed Wiki](https://wiki.smithed.dev/conventions/).

### CMD prefixing
All the custom model data values in GM4 are prefixed with `3420000`. As a module developer you don't need to worry about this, it is handled by our resource pack plugin. <!-- TODO: link to resource pack docs -->

### Tag specification
Smithed defines a set of standard entity `/tag`s to ensure compatibility between different packs:
* Custom entities need to get the `smithed.entity` tag
* If the entity is a technical marker, also give it the `smithed.strict` tag
* If the entity is a custom block marker, give it the `smithed.block` tag

These tags can then be used in checks:
* When you want to target all vanilla skeletons, use `@e[type=skeleton,tag=!smithed.entity]`
* When you want to teleport nearby mobs, use `@e[tag=!smithed.strict]`
* When you want to detect a vanilla block, use `align xyz if block ~ ~ ~ obsidian unless entity @e[tag=smithed.block,dx=0]`
