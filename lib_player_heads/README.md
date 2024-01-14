[Lantern Load]: https://github.com/LanternMC/Load

# lib_player_heads
lib_player_heads is a mcfunction library that allows other data packs to easily register player heads to a central system, which enables `minecraft:player_head` items to keep their item NBT (the contents of `Item.tag`) even after being placed down and mined.

## How to use
When a `minecraft:player_head` is placed (and subsequently broken), it retains two pieces of information: The texture (`SkullOwner.Properties.textures[0].Value`), and the name (`SkullOwner.Name`). `lib_player_heads` utilizes these two pieces of information to identify and restore `minecraft:player_head` items to the state they were in before being placed.

Importantly, `lib_player_heads` restores the player head to a _fixed_ NBT state, i.e. the data must be constant and can **not** contain any dynamic values[^1]. That means you can not store any useful information (in the information theory sense) on the player head and have it restored by this library.
Exemplary uses for this library are, but are not limited to:
- restoring item names and lore on custom items
- restoring identifying information on custom items, e.g. setting `gm4_zauber_cauldrons:{item:'crystal'}`

If multiple data packs utilizing this library are installed, player heads of all data packs will still be restored even after uninstalling all but one data pack containing this library.

[^1]: For more advanced uses `lib_player_heads` does provide a way to restore player heads to a _dynamic_ NBT state from a loot table, refer to [this section](#dynamic-restores).

### Player Head Identification
This library allows for identification by name (recommended, takes priority if a name exists!) or by texture. Which method is used depends on the data present on the placed and broken (to-be-restored) player head. If a name is present, the name method is used, otherwise the texture is used.

Hence, if you are adapting an existing data pack to use this library you will have to check your players skulls and
- modify the names to be unique per custom item if all of your skulls currently use the same name
- stick with no name, or introduce a unique name per custom item if your skulls currently have no name

The unique name should be derived from the `id` tag (discussed in the following section), but for user readability if they pick the item up too fast, it should include a string like `[Drop to Fix Item]` before the name-spaced ID.

### Player Head Register
In order to restore a player head, the head must be registered in the head register. Adding a head to the register can be done via the following commands:
```mcfunction
execute unless data storage gm4_player_heads:register heads[{id:'NAMESPACED_IDENTIFIER_FOR_SKULL'}] run data modify storage gm4_player_heads:register heads append value {id:'NAMESPACED_IDENTIFIER_FOR_SKULL',value:'TEXTURE_DATA',name:'UNIQUE_SKULL_OWNER_NAME',item:{<ITEM NBT>}}
```

It is recommended to do these calls upon reload in case the data is somehow removed, but otherwise the data will generally persist forever.

- `id:'NAMESPACED_IDENTIFIER_FOR_SKULL'` is used internally by the library to identify register entries. It should be descriptive and namespaced; versioning is recommended[^2], e.g. `gm4_zauber_cauldrons:crystal/instant_damage/v0`.
- `name:'UNIQUE_SKULL_OWNER_NAME'` is a unique name stored in the player head's `SkullOwner.Name` tag and should consist of its `id` as well as a user-facing prefix to tell players how to fix the item in case they pick it up before it can be restored, e.g. `[Drop to Fix Item] gm4_zauber_cauldrons:crystal/instant_damage/v0`. This field is used for name-based restoration and not strictly required if only texture-based restoration is used. When `SkullOwner.Name` is present on a to-be-restored `minecraft:player_head` item, this restoration method takes priority over the texture method..
- `value:'TEXTURE_DATA'` is the base64 encoded URL of the texture data of the player head. This field is used for texture-based restoration if no `SkullOwner.Name` tag is present on a to-be-restored `minecraft:player_head` item. This entry is not required if only name-based restoration is used. On the item this data is usually located at `tag.SkullOwner.Properties.textures[0].Value`.
- `item:{<ITEM NBT>}` is used to specify the _fixed_ NBT state the item should be returned to. `<ITEM NBT>` should be a raw NBT compound as it is found in the item's `tag` NBT, **without** the `SkullOwner` tag (not required as name and texture of player heads are conserved through placing and breaking). One must be careful when specifying this NBT as a discrepancy between the raw NBT compound provided and the original NBT of the item (for example from a loot table) will lead to undesired stacking issues. Notably, text components such as those present in `display.Name` or `display.Lore` may have an unexpected order if generated from a loot table, so you should be careful to replicate that order when registering your item with this library. A common way to achieve this is to generate the NBT compount by spawning-in the item using the item creation method your data pack uses (e.g. a loot table) and then getting the data from the game output.

[^2]: Not versioning your entries drastically changes how the library functions, refer to [this section](#versioning) for details.

You may provide `value`, `name`, or both, but whenever possible it is best to provide *only* `name` so that multiple unique items may share a texture without ambiguity.

#### Versioning
Depending on your use case you may want to version or not version your register entry's `id` and `name` and (optionally) `loot_table` fields. Versioning will **only work if** both `id` **and** `name` are versioned (unless you are using `value` instead of `name`, in which vase versioning `id` is sufficient). Versioning is absolutely required if you:
- use texture based identification (i.e. if you use `value`) and plan on changing the texture in the future
- use name based identification (i.e. if you use `name`) and plan on changing the name in the future

Versioning can make `lib_player_heads` restore player heads to their original state even when newer versions of the item are also present in the register. For example, if your data pack implements a beach ball player head custom item but after a couple of versions you decide that your beach ball should have the lore 'Bouncy!' and change your data pack accordingly, also adding a new head register entry with a bumped version and the new NBT data, old beach balls will still be restored to the version without lore, whilst new items will be restored to the version with lore.

Without versioning you can use `lib_player_heads` as a somewhat limited upgrade path for items. Returning to the beach ball example from above, without versioning all beach balls would be upgraded to the version with lore upon placing and breaking. Importantly, the existing head register must be removed and then re-added including the new NBT data by your updated data pack. This can be achieved using the following commands:

```mcfunction
data remove storage gm4_player_heads:register heads[{id:'NAMESPACED_IDENTIFIER_FOR_SKULL'}]
execute unless data storage gm4_player_heads:register heads[{id:'NAMESPACED_IDENTIFIER_FOR_SKULL'}] run data modify storage gm4_player_heads:register heads append value {id:'NAMESPACED_IDENTIFIER_FOR_SKULL',value:'TEXTURE_DATA',name:'UNIQUE_SKULL_OWNER_NAME',item:{<ITEM NBT>}}
```

When using `loot_table` instead of `item` (see below) you may version your loot tables to ensure proper restoration of old items or not version your loot table to always update player heads to their latest version. In the latter case versioning is practically disabled so if using unversioned loot tables it is recommended to also use unversioned `id`.

#### Dynamic Restores
Instead of specifying `item` you may specify `loot_table`, which contains a loot table resource location as a string (e.g. `'gm4_zauber_cauldrons:item/crystal/instant_health_v0'`). This should either be the loot table which is used to obtain the item in the first place. If both `item` and `loot_table` are specified, `loot_table` will take priority in versions of this library that support it. For backwards compatibility with older versions of this library you may therefore define both `item` and `loot_table`.

However, the dynamic restore functionality should only be used as a last resort, as it comes with some downsides. Notably, all information except for the texture and the name of the player head is lost upon placing it down, so it is still **impossible** to store any useful information on the player head only. Additionally, player heads which use this dynamic data restore will not restore correctly if the corresponding data pack is uninstalled.
The _dynamic_ restore system was specifically implemented to allow for unstackable player heads via attributes and should be limited to this or related use cases.

### More on Updating Player Heads
It can easily happen that, when updating your data pack, the data which your player heads should be restored to changes. This section will offer some guidelines on how this should be handled with `lib_player_heads`.

#### Case A: Texture Changes
You're changing the name (`SkullOwner.Name`) or texture (`tag.SkullOwner.Properties.textures[0].Value`) of the player head. In this case you should create a new entry in the head register for your updated player head, with an increased version number compared to the previous entry. You can remove the register command (not the register entry, just the command adding that entry) for the previous version as worlds running the older version of your data pack will already have that version of the player head added to their head register.

#### Case B: Data Changes
You're changing item data (e.g. your player head should now have `{foo:'bar'}` instead of `{food:1b}`). In general it should be noted that the head register is meant as permanent storage, and editing existing entries is **discouraged**. `lib_player_heads` is primarily a library which restores player head items to a set state, not necessarily an upgrade path.

Nevertheless, if you are not versioning your head register entries you can use this library as a -- somewhat manual -- upgrade path:
If you're not making name or texture changes (compare to Case A) you can simply edit the `item` raw NBT or the loot table your entry was pointing at in-place. If you are also making name or texture changes **you must** create a new head register entry corresponding to the new name or texture, see Case A.

#### Case C: Preserve Old Items
This is the default case if you are using the `item` restore source; old versions of player heads will always be restored to their fixed raw NBT in the head register. Editing this NBT in existing entries is **discouraged**.
If you are using the `loot_table` restore source some care must be taken to achieve this behavior: When adding the entry for the new version of your player head to the register you must point it at a new loot table and keep the old loot table around to prevent item loss when restoring old player heads.

## Example Pack
For more examples, see the provided `example_use`.
Please note that the `example_pack` must be started by calling `#load:load`, as a [proper load implementation](Lantern Load) is not included. The provided loot table `gm4_example_pack:example_head_1` in `example_pack` is NOT required.

## Technical Details
 - All player head data is stored in storage at `gm4_player_heads:register`.
 - `minecraft:player_head` items on the ground are only processed if they do not have a `Item.tag.display` NBT compound.

## License
This library, and the contents of the `lib_player_heads` directory on the [github repository](https://github.com/Gamemode4Dev/GM4_Datapacks), is licensed under the MIT License.
