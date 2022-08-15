# lib_machines
lib_machines is a mcfunction library that adds logic for placing and breaking custom blocks. 

## Terminology
Gamemode 4 primarily uses this library for machine blocks, but any mention of "machine" or "machine blocks" below refers to any custom block.

## Installation
This library requires the Gamemode 4 forceloaded chunk library ([`lib_forceload`](../lib_forceload/README.md)). If a data pack includes `lib_machines`, it must also include `lib_forceload`.

## How to Use
There are 2 function tags to be used: one for placing machines (`#gm4_machines:place_down`) and one for breaking machines (`#gm4_machines:destroy`).   
This library also supports the placement and breaking of custom machine minecarts. `#gm4_machines:place_down_cart` and `#gm4_machines:destroy_cart` should be used for minecart handling.

### **Placing Down Machines**
Machine blocks must be player heads with the following NBT data:

```mcfunction
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

### **Placing Down Machine Carts**
Machine Carts must be a minecart item (any type of minecart works) with the following NBT:
```mcfunction
{gm4_machines:{id:"CART_IDENTIFIER"},display:{Name:'UNIQUE CUSTOM NAME'}}
```
When placing down an item with this NBT, the function tag `#gm4_machines:place_down_cart` will run. This function tag will also run every 16 ticks to update custom carts dispensed from a dispenser. This will run `as` and `at` all minecarts with a custom name (only runs once per minecart), so the name of the custom machine cart should be unique and ideally have a namespace somewhere in the name. The following command should be used to verify the specific machine placed:

```mcfunction
execute if score $placed_block gm4_machine_data matches 0 store success score $placed_block gm4_machine_data if data entity @s {CustomName:'UNIQUE CUSTOM NAME'} run function MODULE_NAMESPACE:machine/create_cart
```

The function `MODULE_NAMESPACE:machine/create_cart` should have the following commands (you can replace `hopper_minecart` with any minecart type and `armor_stand` with either a `marker` or `area_effect_cloud`): 
```mcfunction
# summon new minecart
summon hopper_minecart ~ ~ ~ {Tags:["NEW_CART_IDENTIFIER","ADD ANY EXTRA TAGS"],Passengers:[{id:"minecraft:armor_stand",CustomName:'"PLEASE NAME YOUR MACHINE MARKERS"',Tags:["MARKER IDENTIFIER","gm4_machine_cart","smithed.entity","smithed.strict","ADD ANY EXTRA TAGS"],Invisible:1b,<...>}]}

# clean up
tag @s add NEW_CART_IDENTIFIER_SAVE
data modify entity @e[type=hopper_minecart,tag=NEW_CART_IDENTIFIER,distance=..0.1,limit=1] {} merge from entity @s {}
tag @s remove NEW_CART_IDENTIFIER_SAVE
# new tag is needed in case the first minecart had tags already
data merge entity @e[type=hopper_minecart,tag=NEW_CART_IDENTIFIER_SAVE,distance=..0.1,limit=1] {CustomName:'NEW_CART_NAME',Tags:["CART_IDENTIFIER","gm4_machine_cart"]}
data merge entity @s {Items:[]}
kill @s
```

### **Breaking Machines**
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

To catch and replace the item, the following function can be used:
```mcfunction
# kill entities related to machine block
execute store result score $dropped_item gm4_machine_data run kill @e[type=item,distance=..1,nbt={Age:0s,Item:{id:"minecraft:hopper",Count:1b,tag:{display:{Name:'CUSTOM NAME OF BLOCK'}}}},limit=1,sort=nearest]
kill @s

# drop item (unless broken in creative mode)
execute if score $dropped_item gm4_machine_data matches 1 run loot spawn ~ ~ ~ loot MODULE_NAMESPACE:entities/ITEM_LOOT_TABLE
```
Note that the custom name will only be present for a container block that has nbt. If the base block doesn't have block data, you can simply omit the `tag` check.

### **Breaking Machine Carts**
Every tick, machine cart markers will check if it is riding an entity (i.e. the custom machine cart). If it is no longer riding an entity, it will activate a destruction function tag `#gm4_machines:destroy_cart`. This runs `as` and `at` the marker entity. This function is run during the command block sub-tick, meaning you can kill/modify items before they can be picked up by hoppers and hopper minecarts.

E.g. if the base entity of the machine cart is a hopper minecart, when the machine marker detects it has been broken, the hopper minecart item can be killed and/or replaced with a custom item (likely the custom item used to place down the machine cart).

The following command should be used to verify the specific machine destroyed:

```mcfunction
execute if entity @s[tag=CART_MARKER_IDENTIFIER] run function MODULE_NAMESPACE:machine/destroy
```

To catch and replace the item, the following function can be used:

```mcfunction
# kill entities related to machine cart
execute store result score $dropped_item gm4_machine_data run kill @e[type=item,distance=..2,nbt={Age:0s,Item:{id:"minecraft:hopper_minecart",Count:1b,tag:{display:{Name:'CUSTOM NAME OF THE CART'}}}},limit=1,sort=nearest]
kill @s

# drop item (unless broken in creative mode)
execute if score $dropped_item gm4_machine_data matches 1 run loot spawn ~ ~ ~ loot MODULE_NAMESPACE:entities/ITEM_LOOT_TABLE
```

# Custom Crafters
Bundled in the machines library is the custom crafting library, as it is assumed that machine blocks will be crafted with the Gamemode 4 Custom Crafter. 

If you would like to remove functionality of the Gamemode 4 Custom Crafter, remove the appropriate function calls from `#load:gm4_machines/enumerate` and `#load:gm4_machines/resolve_load`.

## How to Use
Custom Crafters have a function tag used to check recipes: `#gm4_custom_crafters:check_recipes`. Data packs should use this to set up recipes to be crafted in a custom crafter. Custom Crafters run every 16 ticks automatically checking for recipes and replacing them with their appropriate output.

Below is specific details in implementing a `check_recipes` function. Custom Crafters will only run recipe checks if all slots have the same item count.

### Check that no other recipes have been completed

`execute if score $crafted gm4_crafting matches 0 store result score $crafted gm4_crafting`
### Check the slot count
This should be set to the number of filled slots. For example if a recipe has 2 empty slots, the slot count should be 7 (9-2).

`if score $slot_count gm4_crafting matches <number>`

### Check the stack size
This should be set to the maximum count of the input items. For example if you have a recipe that will create 4 items for each single recipe (like log -> planks), then this should be set to `..16`, since 16*4 = 64, which is the maximum stack size for planks. This means only up to 16 items in each slot will work for this recipe.

`if score $stack_size gm4_crafting matches ..<number>`

### Check the Items
This checks the `Items` block data (moved to storage for efficiency), which represents the recipe input. Note that `Count` should not be checked here, since multi-crafting is supported by setting the `stack_size`

`if data storage gm4_custom_crafters:temp/crafter {Items:[<...>]}`

### Loot Replace
`run loot replace block ~ ~ ~ container.0 loot MODULE_NAMESPACE:crafting/RECIPE_NAME`

### **Full Function:**
```mcfunction
execute if score $crafted gm4_crafting matches 0 store result score $crafted gm4_crafting if score $slot_count gm4_crafting matches <number> if score $stack_size gm4_crafting matches ..<number> if data storage gm4_custom_crafters:temp/crafter {Items:[<...>]} run loot replace block ~ ~ ~ container.0 loot MODULE_NAMESPACE:crafting/RECIPE_NAME
```

- afformentioned loot table:
```json
{
  "type": "minecraft:generic",
  "pools": [
    {
      "rolls": 8,
      "entries": [
        {
          "type": "minecraft:item",
          "name": "minecraft:air"
        }
      ]
    },
    {
      "rolls": 1,
      "entries": [
        {
          "type": "minecraft:loot_table",
          "name": "LOOT_TABLE_TO_ITEM",
          "functions": [
            {
              "function": "minecraft:set_count",
              "count": "MULTIPLIER"
            }
          ]
        }
      ]
    }
  ]
}

```
- It is convention to put the recipe output in the last slot, but this loot table can be flexible, as long as it replaces all 9 slots. Loot tables pools are run in order, so multiple items can be outputted (such as emptying a water bucket and replacing it with an empty bucket).

### Set the Multiplier
When setting the outputs with the loot table, the count determines how much the item stack will be multiplied by. For example setting the count to 4 will output 4 of that item per recipe (like the log -> planks example below).

## Recipe Check Example
### function
```mcfunction
# 1 oak log -> 4 oak planks (shapeless)
execute if score $crafted gm4_crafting matches 0 store result score $crafted gm4_crafting if score $slot_count gm4_crafting matches 1 if score $stack_size gm4_crafting matches ..16 if data storage gm4_custom_crafters:temp/crafter {Items:[{id:"minecraft:oak_log"}]} run loot replace block ~ ~ ~ container.0 loot gm4_craft:crafting/oak_planks
```
### loot table
```json
{
  "type": "minecraft:generic",
  "pools": [
    {
      "rolls": 8,
      "entries": [
        {
          "type": "minecraft:item",
          "name": "minecraft:air"
        }
      ]
    },
    {
      "rolls": 1,
      "entries": [
        {
          "type": "minecraft:item",
          "name": "oak_planks",
          "functions": [
            {
              "function": "minecraft:set_count",
              "count": "4"
            }
          ]
        }
      ]
    }
  ]
}
```
In the example above, the stack size is 16 because 16 maximum input items * 4 output items per recipe = 64 total output items max.
