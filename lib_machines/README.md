# lib_machines
lib_machines is a mcfunction library that adds logic for placing and breaking custom blocks. 

## Terminology
Gamemode 4 primarily uses this library for machine blocks, but any mention of "machine" or "machine blocks" below refers to any custom block.

## Installation
This library requires the Gamemode 4 forceloaded chunk library (`lib_forceload`). If a data pack includes `lib_machines`, it must also include `lib_forceload`.

## How to Use
There are 2 function tags to be used: one for placing machines (`#gm4_machines:place_down`) and one for breaking machines (`#gm4_machines:destroy`).

### Placing Down Machines
Machine blocks must be player heads with the following NBT data:

```
{SkullOwner:{Name:"BLOCK_IDENTIFIER",Properties:{textures:[{Signature:"gm4_machine"}]}}}
```

When placing down a player head with this NBT, the function tag `#gm4_machines:place_down` will run. This will run `as` the player who placed the block and `at` the center of the block that was placed. The following command should be used to verify the specific machine placed:

```mcfunction
execute if score $placed_block gm4_machine_data matches 0 store success score $placed_block gm4_machine_data if data storage gm4_machines:temp {id:"BLOCK_INDENTIFIER"} run function MODULE_NAMESPACE:machine/create
```

The function `MODULE_NAMESPACE:machine/create` should have the following commands: 
```mcfunction
summon marker ~ ~ ~ {Tags:["gm4_machine_marker","smithed.block","smithed.entity","smithed.strict","IDENTIFIER","ADD ANY EXTRA TAGS"],CustomName:'"PLEASE NAME YOUR MACHINE MARKERS"',<...>}
```

Each machine block has a marker entity located at the center of the block (`align xyz positioned ~0.5 ~0.5 ~0.5`) with the tag `gm4_machine_marker`.

The score `$rotation gm4_machine_data` stores the direction the player is facing and can be used in the `create` function:

```
1: up
2: down
3: north
4: east
5: south
6: west
```

This can be used to rotate blocks according to facing direction. Note that normally most rotated blocks (droppers, barrels, pistons, etc.) are placed with a facing direction opposite of the player's facing direction. E.g. if the player faces downwards, a placed dropper faces upwards.

The score `$single_rotation gm4_machine_data` stores the cardinal direction the player is facing and can be used in the `create` function:

```
1: north
2: east
3: south
4: west
```

This can be used to rotate blocks according to facing direction if the block doesn't have a vertical direction, such as furnaces.


The score `$face_placement gm4_machine_data` stores the face that the block was placed on and can be used in the `create` function:

```
1: north
2: east
3: south
4: west
```

This can be used to rotate blocks according to what face of the block it was placed on. Note that normally hoppers are placed with a facing direction opposite to the face that it was placed on. E.g. if a player places a hopper onto the south face of a block, it will point north, into the block it was placed on.

The scores `$x_rotation` and `$y_rotation` store the exact rotations of the player and can be used for more precise block placement than the three options outlined above.
### Breaking Machines
Every tick, machine markers will check if it is in one of the following blocks:
```
air
moving_piston
lava
water
```

If it is in one of those blocks, it will activate a destruction function tag `#gm4_machines:destroy`. This runs `as` and `at` the marker entity. This function is run during the command block sub-tick, meaning you can kill/modify items before they can be picked up by hoppers and hopper minecarts.

E.g. if the base block of a machine is a dropper, when the machine marker detects it has been broken, the dropper item can be killed and/or replaced with a custom item (likely the player head used to place down the machine block).

The following command should be used to verify the specific machine destroyed:

```mcfunction
execute if entity @s[tag=IDENTIFIER] run function MODULE_NAMESPACE:machine/destroy
```
