# lib_forceload
lib_forceload is a mcfunction library adding a forceloaded chunk with common utlities. Available utilities are:
* yellow-shulker-box for inventory manipulations
* sign for text resolution
* jukebox for single item storage
* repeating command block for sub-tick execution
* armor-stand for tool-based loot table context

## How to Use
This library forceloads the chunk `29999999 7134`, which lies beyond the maximum world size, in every dimension - including custom defined dimensions. Each dimension initializes its forceloaded chunk when a player first logs into that dimension.

### Yellow Shulker Box
Every dimension gets a `yellow_shulker_box` placed at `29999998 1 7134` for use with inventory manipulations. This library follows the "yellow-shulker-box" convention, including the standard loot table.

example:
```
# move item from shulker box to output barrel
loot insert ~ ~ ~ mine 29999998 1 7134 air{drop_contents:1b}
```

### Birch Sign
Every dimension gets a `birch_wall_sign` placed at `29999998 1 7133`. This can be used to resolve json text components and retrieve the resulting string. 

example:
```
data modify block 29999998 1 7133 front_text.messages[0] set value '[{"text": "killed by "},{"storage":"my_storage:register", "nbt":"my_text.name"}]'
data modify entity @s CustomName set from block ~ ~ ~ front_text.messages[0]
```

### Jukebox
Every dimension gets a `jukebox` placed at `29999998 1 7132`. The item contained within can be used for whatever the developer wishes.

### Unique Dimension ID
In each dimension, a marker entity with the tag `gm4_dimension` is summoned. This marker has a unique scoreboard value stored in the objective `gm4_dimension`, and a name matching the dimension's string ID. 

This score can be used to dynamically store a dimension on an item, such as for a recall ability, or for your datapack to support an arbitrary number of dimensions, added by other datapacks.

### Repeating Command Block
The overworld dimension has a repeating command block running the function tag `#gm4_forceload:command_block_tick`. Adding functions to this tag lets their contents to be run at a different subtick than ordinary functions. This is commonly used to intercept item drops before a player has the change to pick them up, but may be used to properly time other datapack code.

### Armor Stand
The overworld dimension has a armor stand with the static uuid `344d47-4-4-4-f04ce104d`. This can be used with loot tables that utilize the `match_tool` predicate which require an entity with a mainhand slot. 

## License
This library, and the contents of the `lib_forceload` directory on the [github repository](https://github.com/Gamemode4Dev/GM4_Datapacks), is licensed under the MIT License.
