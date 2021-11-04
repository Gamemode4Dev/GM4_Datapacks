[Lantern Load]: https://github.com/LanternMC/Load

# lib_player_heads
lib_player_heads is a mcfunction library that allows other datapacks to easily register player heads to a central system, which enables `minecraft:player_head` items to keep their item NBT (the contents of `Item.tag`) even after being placed down and mined.

## How to use
Items can be restored based on their texture or `SkullOwner.Name`.
Note that if your item currently has a `SkullOwner.Name`, this lookup method will take priority over the texture method, so you may need to manually upgrade old items to have a more unique value for `SkullOwner.Name`.
Additionally, items with the `gm4_player_head:1b` tag will be excluded from processing, so you are recommended to put this tag on all custom skulls so they are not processed unnecessarily.

If your items do not currently have a name, your pack should register the items based on their texture.
Otherwise, it is recommended to use a unique name.
The unique name should be derived from the `id` tag, but for user readability if they pick the item up too fast, it should include a string like `[Drop to Fix Item]` before the namespaced ID.

To register a player head, the data pack must invoke the following command at least once for each player head to be registered:

```mcfunction
execute unless data storage gm4_player_heads:register heads[{id:"NAMESPACED_IDENTIFIER_FOR_SKULL"}] run data modify storage gm4_player_heads:register heads append value {id:"NAMESPACED_IDENTIFIER_FOR_SKULL",value:'TEXTURE_DATA',name:'UNIQUE_SKULL_OWNER_NAME',item:{<CONTENTS OF TAG NBT>}}
```

It is recommended to do these calls upon reload in case the data is somehow removed, but otherwise the data will generally persist forever.

- `NAMESPACED_IDENTIFIER_FOR_SKULL` is an indentifier used internally by the library. It should be descriptive and namespaced; versioning is recommended. For an example, see the provided `example_use`.
- `TEXTURE_DATA` is the texture data of the player head. On the item this is usually located at `tag.SkullOwner.Properties.textures[0].Value`.
- `UNIQUE_SKULL_OWNER_NAME` is a unique name stored in the player head's `SkullOwner.Name` tag. When `SkullOwner.Name` is present, this lookup method takes priority over the texture method.
- `<CONTENTS OF TAG NBT>` is to be replaced with the item data the skull should regain after being placed and broken. Bear in mind that a discrepancy between the NBT provided here and the original NBT of the item (for example from a loot table) will lead to undesired stacking issues. Notably, text components such as those present in `display.Name` or `display.Lore` may have an unexpected order if generated from a loot table, so you should be careful to replicate that order when registering your item with this library.

You may provide `value`, `name`, or both, but whenever possible it is best to provide *only* `name` so that multiple unique items may share a texture without ambiguity.

Please note that the `example_pack` must be started by calling `#load:load`, as a [proper load implementation](Lantern Load) is not included. The provided loot table in `example_pack` is NOT required.

## Technical Details
 - All player head data is stored in storage at `gm4_player_heads:register`.
 - Player heads with the `gm4_player_head:1b` tag will be excluded from processing.
