# lib_player_heads
lib_player_heads is a mcfunction library that allows other datapacks to easily register player heads to a central system, which enables `minecraft:player_head` items to keep their item NBT (the contents of the `tag` NB tag) even after being placed down and mined.

## How to use
To register a player head, the datapack must invoke the following command at least once for each player head to be registered:
`execute unless data storage gm4_player_heads:register heads[{id:"NAMESPACED_IDENTIFIER_FOR_SKULL"}] run data modify storage gm4_player_heads:register heads append value {id:"NAMESPACED_IDENTIFIER_FOR_SKULL",value:'TEXTURE_DATA',item:{<CONTENTS OF TAG NBT>}`
It is recommended to do these calls upon reloads.

- `NAMESPACED_IDENTIFIER_FOR_SKULL` is an indentifiert used internally by the library. It should be descriptive and namespaced; versioning is recommended. For an example, see the provided `example_use`.
- `TEXTURE_DATA` is the texture data of the player head. On the item this is usually located at `tag.SkullOwner.Properties.textures[0].Value`
- `<CONTENTS OF TAG NBT>` is to be replaced with the item data the skull should regain after being placed and broken. Bear in mind that a discrepancy between the NBT provided here and the original NBT of the item (for example from a loot table) will lead to undesired stacking issues.

Please note that the `example_pack` must be started by calling `#load:load`, as a proper load implementation is not included. The provided loot table in `example_pack` is NOT required.

## Technical Details
All player head data is stored in storage at `gm4_player_heads:register`.
