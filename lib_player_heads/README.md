[Lantern Load]: https://github.com/LanternMC/Load

# lib_player_heads
lib_player_heads is a mcfunction library that allows other data packs to easily register player heads to a central system, which enables `minecraft:player_head` items to keep their item NBT (the contents of `Item.tag`) even after being placed down and mined.

## How to use
When a `minecraft:player_head` is placed (and subsequently broken), it retains two pieces of information: The texture (`SkullOwner.Properties.textures[0].Value`), and the name (`SkullOwner.Name`). `lib_player_heads` utilizes these two pieces of information to identify and restore `minecraft:player_head` items to the state they were in before being placed.

### Player Head Identification
This library allows for identification by name (recommended, takes priority if a name exists!) or by texture. Which method is used depends on the data present on the placed and broken (to-be-restored) player head. If a name is present, the name method is used, otherwise the texture is used.

Hence, if you are adapting an existing data pack to use this library you will have to check your players skulls and
- modify the names to be unique per custom item if all of your skulls currently use the same name
- stick with no name, or introduce a unique name per custom item if your skulls currently have no name

The unique name should be derived from the `id` tag (discussed in the following section), but for user readability if they pick the item up too fast, it should include a string like `[Drop to Fix Item]` before the name-spaced ID.

### Player Head Register
In order to restore a player head, the head must be registered in the head registry. Adding a head to the registry can be done via the following commands:
```mcfunction
execute unless data storage gm4_player_heads:register heads[{id:'NAMESPACED_IDENTIFIER_FOR_SKULL'}] run data modify storage gm4_player_heads:register heads append value {id:'NAMESPACED_IDENTIFIER_FOR_SKULL',value:'TEXTURE_DATA',name:'UNIQUE_SKULL_OWNER_NAME',loot_table:'NAMESPACED_LOOT_TABLE_NAME'}
```

It is recommended to do these calls upon reload in case the data is somehow removed, but otherwise the data will generally persist forever.

- `id:'NAMESPACED_IDENTIFIER_FOR_SKULL'` is used internally by the library to identify registry entries. It should be descriptive and namespaced; versioning is recommended, e.g. `gm4_zauber_cauldrons:crystal/instant_damage/v0`.
- `name:'UNIQUE_SKULL_OWNER_NAME'` is a unique name stored in the player head's `SkullOwner.Name` tag, e.g. `[Drop to Fix Item] gm4_zauber_cauldrons:crystal/instant_damage/v0`. This field is used for name-based restoration and not strictly required if only texture-based restoration is used. When `SkullOwner.Name` is present on a to-be-restored `minecraft:player_head` item, this restoration method takes priority over the texture method.
- `value:'TEXTURE_DATA'` is the base64 encoded URL of the texture data of the player head. This field is used for texture-based restoration if no `SkullOwner.Name` tag is present on a to-be-restored `minecraft:player_head` item. This entry is not required if only name-based restoration is used. On the item this data is usually located at `tag.SkullOwner.Properties.textures[0].Value`.
- `loot_table:'NAMESPACED_LOOT_TABLE_NAME'` is the loot table to be used to restore the `minecraft:player_head` item, e.g. `gm4_zauber_cauldrons:crystal/instant_damage_v0`. This should either be the loot table which is used to obtain the item in the first place. Alternatively, `item:{<ITEM NBT>}` can be specified as a legacy option if `loot_table` is **not** specified. `<ITEM NBT>` should be a raw NBT compound as it is found in the item's `tag` nbt, **without** the `SkullOwner` tag (not required as name and texture of player heads are conserved through placing and breaking). The legacy `item` option is not recommended as a discrepancy between the raw NBT compound provided and the original NBT of the item (for example from a loot table) will lead to undesired stacking issues. Notably, text components such as those present in `display.Name` or `display.Lore` may have an unexpected order if generated from a loot table, so you should be careful to replicate that order when registering your item with this library.

You may provide `value`, `name`, or both, but whenever possible it is best to provide *only* `name` so that multiple unique items may share a texture without ambiguity.

### Updating Player Heads
It can easily happen that, when updating your data pack, the data which your player heads should be restored to changes. This section will offer some guidelines on how this should be handled with `lib_player_heads`.

#### Case A: Texture Changes
You're changing at least the name (`SkullOwner.Name`) or texture (`tag.SkullOwner.Properties.textures[0].Value`) of the player head. In this case you should create a new entry in the registry for your updated player head, with an increased version number compared to the previous entry. You can remove the registry command for the previous version as worlds running the older version of your data pack will already have that version of the player head added to their registry.

#### Case B: Data Changes
You're changing item data (e.g. your player head should now have `{foo:'bar'}` instead of `{food:1b}`). In general it should be noted that the head registry is meant as permanent storage, and editing existing entries is **not supported**. `lib_player_heads` is a library which restores player head items to a set state, not an upgrade path. Nevertheless, if you are using the `loot_table` restoration source you can use this library as a -- somewhat manual -- upgrade path:
If you're not making name or texture changes (compare to Case A) you can simply edit the loot table your entry was pointing at in-place. If you are also making name or texture changes you must create a new registry entry, see Case A.

#### Case C: Preserve Old Items
This is the default case if you are using the legacy `item` restore source; old versions of player heads will always be restored to their fixed raw nbt in the registry. Editing this nbt in existing entries is **not supported**.
If you are using the `loot_table` restore source some care must be taken to achieve this behavior: When adding the entry for the new version of your player head to the registry you must point it at a new loot table and keep the old loot table around to prevent item loss when restoring old player heads.

## Example Pack
For more examples, see the provided `example_use`.
Please note that the `example_pack` must be started by calling `#load:load`, as a [proper load implementation](Lantern Load) is not included. The provided loot table `gm4_example_pack:example_head_1` in `example_pack` is NOT required.

## Technical Details
 - All player head data is stored in storage at `gm4_player_heads:register`.
 - `minecraft:player_head` items on the ground are only processed if they do not have a `Item.tag.display` NBT compound.

## License
This library, and the contents of the `lib_player_heads` directory on the [github repository](https://github.com/Gamemode4Dev/GM4_Datapacks), is licensed under the MIT License.
