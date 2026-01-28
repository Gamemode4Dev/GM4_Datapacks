# lib_hooked_entity
lib_hooked_entity is a mcfunction library that enables running functions on the entity that a player hooked with a fishing rod. Without a library like this, this operation is not possible to do accurately. Furthermore, logic enabled by this library only triggers with the `fishing_rod_hooked` advancement trigger.

## Usage
Usage of this library is achieved by adding functions to the provided function tags: `#gm4_hooked_entity:on_hooked_entity`, `#gm4_hooked_entity:pre_hook_on_player`, `#gm4_hooked_entity:post_hook_on_player`

### Function Tags in order of exectution:

#### `#gm4_hooked_entity:pre_hook_on_player` 
Run before selection of the hooked entity. Think of this as what will run any time the player triggers the `fishing_rod_hooked` advancement trigger, it is run as the player and at the player. The intention of this is to access the player in any way you need to before logic is run on the hooked entity.

#### `#gm4_hooked_entity:on_hooked_entity` 
Run as the entity hooked by the player, at the fishing bobber. During this, the relevant player is tagged with `gm4_hooked_entity.player` in case you need to select them during this time frame.

#### `#gm4_hooked_entity:post_hook_on_player` 
Very similar to the `#gm4_hooked_entity:pre_hook_on_player`, just run after `#gm4_hooked_entity:on_hooked_entity`.

## Technical Details
This library operates by assigning a 16 bit binary ID in the form of scores on every entity that can be hooked by a fishing rod bobber, but only within 42 blocks of any fishing bobber. When a player uses the fishing rod and triggers `fishing_rod_hooked` they will recieve 16 advancements which are used to reconstruct the binary ID of the entity. From there the scores are used in a macro function to select the entity directly.

This method is only necessary due to 2 reasons
- `execute on` is unable to select the entity a fishing bobber is hooked into
- The height that the fishing bobber sits in an entity is dependent on that entity's hitbox height which cannot be known in advance of selection. (With the exceptions of paintings and item frames)

## License
This library, and the contents of the `lib_hooked_entity` directory on the [github repository](https://github.com/Gamemode4Dev/GM4_Datapacks), is licensed under the MIT License.
