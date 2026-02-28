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
All functions should start with a header comment to make review and debugging easier. Such a header comment could look like:
```mcfunction
# Demonstrates how header comments work.
# @s = Player in survival, while tabbed-out
# at @s align xyz rotated as @r
# run from gm4:load
# scheduled from gm4:main
# with $id = Id of the player who's tabbed out
# with $timestamp = Timestamp at which the player tabbed out in seconds
```
Some of the shown lines are optional, in which case the line can be omitted completely; do not replace the line with whitespace.

The first three lines are positional:
  - **Line 1** [Optional]: `<description>` A human-readable description of what this function does and, if needed, in which context it runs. Don't be too literal.
  - **Line 2** [Required]: `@s = <description or pseudocode>` A human-readable or pseudocode description of the executing entity. May also be "unspecified" in case no executor was set intentionally.
  - **Line 3** [Required]: `at <description or pseudocode>` A human-readable or pseudocode description of the location this function is run at. May also be "unspecified" in case no location was set intentionally.

Additional lines may be present to indicate the context of the function. Each of the following may be specified multiple times, do **not** use a single line to specify multiple entries.
  - `run from <locator>` The full resource locator of a function that calls this function. Use of wildcards, e.g. `run from gm4:boats/*` is permitted.
  - `scheduled from <locator>` The full resource locator of a function that schedules this function. Use of wildcards, e.g. `run from gm4:boats/*` is permitted.
  - `rewarded from <locator>` The full resource locator of an advancement that rewards this function. Use of wildcards, e.g. `run from gm4:join/*` is permitted.
  - `with $<key>: <description>` The key of an nb tag used for the macro call of this function, as well as a description of the value the key holds. Do not specify this unless this function is a macro. Use of wildcards, e.g. `with $id_*: Set of 16 ids used to track runcows.`

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
