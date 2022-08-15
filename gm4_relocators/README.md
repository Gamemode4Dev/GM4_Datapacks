# Relocators

Relocators is a module that allows container blocks to be picked up and placed down, saving NBT and block state. The following blocks can be picked up:
* Shulker Box
* Barrel
* Blast Furnace
* Brewing Stand
* Chest
* Dispenser
* Dropper
* Furnace
* Hopper
* Smoker
* Trapped Chest

For more information about relocators, visit the [wiki](https://wiki.gm4.co/wiki/Relocators)

## **Compatibility**
By default, relocators will not pick up custom blocks (custom blocks are indicated by having an entity with the `smithed.entity` tag inside the block). To allow relocators to pick up and place down a custom block, follow the steps below. Note that the container block rule still applies, so custom blocks that aren't containers are not supported by default. However, additional blocks can be defined for relocator compatibility.

### **Pick Up Check**
The function tag `#gm4_relocators:pick_up_check` is called when a relocator attempts to pick up a block that has an entity with the `smithed.entity` tag inside the target block. Add a function to this tag to verify the custom block marker.  
- The verification function (called `pick_up_check` in GM4 modules) should check the tag of the custom block marker. This function is called `as` the `smithed.entity` tagged entity, so checking the tags is simple.
- In the processing function (called `set_pick_up_data` in GM4 modules), the storage `gm4_relocators:temp merge_data` should be set to contain information pertaining to the custom block: 
  - `custom_block` should be set to a string containing a unique identifier. This is used for placing the block back down and should ideally be namespaced (e.g. `gm4_`). 
  - `lore` should be set to a single line of lore that will display as the relocated block. Conventionally the lore is gray and italic. 
  - `entity_data` should contain the data that needs to be restored once the custom block is placed back down. This should only be used to save data that can change between different machines of the same type. Data that is constant for the same machine marker should not be saved; during the place down process, the entity should simply be summoned with the constant data. Any data can be stored here to be interpreted by your module later; this data is not automatically interpreted.
  - Once the storage is set, the entities connected to this block can be killed and the following command should be run:
  ```mcfunction
  scoreboard players set $found marker gm4_rl_data 1
  ```
  - This function should not delete the block, as that's handled by the relocators module

#### Example:  
function tag `#gm4_relocators:pick_up_check`
```json
{
    "values": [
        "my_module:relocate/pick_up_check"
    ]
}
```
function `my_module:relocate/pick_up_check`
```mcfunction
# load score check is technically optional for non-GM4 data packs
execute if score my_module load.status matches 1 if entity @s[tag=custom_block_marker_1] run function my_module:relocate/set_pick_up_data_1
# multiple blocks can be checked if this module has multiple custom blocks
execute if score my_module load.status matches 1 if entity @s[tag=custom_block_marker_2] run function my_module:relocate/set_pick_up_data_2
```
function `my_module:relocate/set_pick_up_data_1`
```mcfunction
# set relocator data
data modify storage gm4_relocators:temp merge_data set value {custom_block:"my_custom_block",lore:'{"text":"Custom Block","color":"gray","italic":true}'}
# save entity data; in this case rotation is stored
data modify storage gm4_relocators:temp merge_data.entity_data.Rotation set from entity @s Rotation
# scores can be stored like this
execute store result storage gm4_relocators:temp merge_data.entity_data.fill_level int 1 run scoreboard players get @s my_fill_level
# this line saves data related to a separate display armor stand
data modify storage gm4_relocators:temp merge_data.entity_data.ArmorItems set from entity @e[type=armor_stand,tag=my_custom_block_display,distance=..0.5,limit=1] ArmorItems

# kill related entities
execute positioned ~ ~-0.4 ~ run kill @e[type=armor_stand,tag=my_custom_block_display,limit=1,distance=..0.01]
kill @s
# mark as found
scoreboard players set $found_marker gm4_rl_data 1
```

### **Place Down Check**
The function tag `#gm4_relocators:place_down_check` is called when a relocator places down a custom block (i.e. the data was set during the pick up process). Add a function to this tag to verify the placement of your custom blocks. This function is run after the actual block is placed, and is run at the center of the block.
- The verification function (called `place_down_check` in GM4 modules) should check the storage to match it to the custom block identifier set during the pick up process:
```mcfunction
execute if data storage gm4_relocators:temp gm4_relocation{custom_block:"my_custom_block"}
```
- In the processing function (called `summon_block_markers` in GM4 modules), the entities required for the custom block should be created and their data should be restored. Unless changed in the verification function, this function is run at the center of the block.

#### Example:
function tag `#gm4_relocators:place_down_check`
```json
{
    "values": [
        "my_module:relocate/place_down_check"
    ]
}
```
function `my_module:relocate/place_down_check`
```mcfunction
# load score check is technically optional for non-GM4 data packs
execute if score $placed_block gm4_rl_data matches 0 if score my_module load.status matches 1 store success score $placed_block gm4_rl_data if data storage gm4_relocators:temp gm4_relocation{custom_block:"my_custom_block_1"} run function my_module:relocate/summon_block_markers_1
# multiple blocks can be checked if this module has multiple custom blocks
execute if score $placed_block gm4_rl_data matches 0 if score my_module load.status matches 1 store success score $placed_block gm4_rl_data if data storage gm4_relocators:temp gm4_relocation{custom_block:"my_custom_block_2"} run function my_module:relocate/summon_block_markers_2
```
function `my_module:relocate/summon_block_markers`
```mcfunction
# summon entities
summon armor_stand ~ ~-0.4 ~ {Small:1,NoGravity:1,Marker:1,Invulnerable:1,Invisible:1,Silent:1,DisabledSlots:4144959,Tags:["my_custom_block_display","smithed.entity","smithed.strict","new_machine_indicator"],HasVisualFire:1,CustomName:'"my_custom_block_display"',ArmorItems:[{},{},{},{id:"minecraft:gold_block",Count:1b}],Rotation:[0.0f,0.0f]}
summon marker ~ ~ ~ {Tags:["my_custom_block_marker","smithed.block","smithed.entity","smithed.strict","new_machine_indicator"],CustomName:'"my_custom_block_marker"',Rotation:[0.0f,0.0f]}

# restore data
# restore rotation
execute as @e[tag=new_machine_indicator,distance=..2] run data modify entity @s Rotation set from storage gm4_relocators:temp gm4_relocation.entity_data.Rotation
execute as @e[tag=new_machine_indicator,distance=..2] at @s rotated as @e[type=marker,tag=new_machine_indicator,distance=..2,limit=1] run tp ~ ~ ~
# restore armor items
execute as @e[type=armor_stand,tag=new_machine_indicator,distance=..2] run data modify entity @s ArmorItems set from storage gm4_relocators:temp gm4_relocation.entity_data.ArmorItems
# restore score
execute store result score @s my_fill_level run data get storage gm4_relocators:temp gm4_relocation.entity_data.my_fill_level
# remove tags
tag @e[distance=..2] remove new_machine_indicator
```


### **Adding Additional Relocatable Blocks**
By default only containers can be picked up, but additional blocks can be added by modifying a block tag and adding a function.

A block tag `#gm4_relocators:relocatable_block` can be added to your data pack with `"replace": false` in order to not overwrite the default blocks.

Once the block tag is added, an extra function must be called to handle the new blocks. By default, the data is stored, but the specific block state must be saved for it to be picked up and placed down. The `facing`, `waterlogged`, and `honey_level`0ck states are saved by default. The function tag `#gm4_relocators/pick_up/get_block_state` runs to check the block state.

#### Example:
block tag `#gm4_relocators:relocatable_block`
```json
{
  "replace": false,
  "values": [
    "minecraft:obsidian",
    "minecraft:beehive"
  ]
}
```
function tag `#gm4_relocators/pick_up/get_block_state`
```json
{
    "values": [
        "my_module:relocate/get_block_state"
    ]
}
```
function `my_module:relocate/get_block_state`
```mcfunction
# if using lantern load, there should be an intermidiate function 
#  that calls this one after checking the score
#  there are other examples for load checking in this document

# get block
execute if score $found_block gm4_rl_data matches 0 store success score $found_block gm4_rl_data if block ~ ~ ~ obsidian run data modify storage gm4_relocators:temp gm4_relocation merge value {block_state:{id:"obsidian"},lore:'{"translate":"block.minecraft.obsidian","color":"gray","italic":true}'}
execute if score $found_block gm4_rl_data matches 0 store success score $found_block gm4_rl_data if block ~ ~ ~ beehive run data modify storage gm4_relocators:temp gm4_relocation merge value {block_state:{id:"beehive"},lore:'{"translate":"block.minecraft.beehive","color":"gray","italic":true}'}
# get specific block state details
#  `facing` is already saved, so we don't need that for the beehives
execute if block ~ ~ ~ beehive[honey_level=0] run data modify storage gm4_relocators:temp gm4_relocation.block_state.honey_level set value 0
execute if block ~ ~ ~ beehive[honey_level=1] run data modify storage gm4_relocators:temp gm4_relocation.block_state.honey_level set value 1
execute if block ~ ~ ~ beehive[honey_level=2] run data modify storage gm4_relocators:temp gm4_relocation.block_state.honey_level set value 2
execute if block ~ ~ ~ beehive[honey_level=3] run data modify storage gm4_relocators:temp gm4_relocation.block_state.honey_level set value 3
execute if block ~ ~ ~ beehive[honey_level=4] run data modify storage gm4_relocators:temp gm4_relocation.block_state.honey_level set value 4
execute if block ~ ~ ~ beehive[honey_level=5] run data modify storage gm4_relocators:temp gm4_relocation.block_state.honey_level set value 5
```


### **Custom Place Down Actions**
The function tag `#gm4_relocators:place_down/place_block` is called when a relocator places down a block. Add a function to this to handle additional blocks that were added to the `#gm4_relocators:relocatable_block` block tag.

This can also be used to add custom handling for normal blocks such as adding a marker to every furnace without declaring all furnaces as custom blocks (which may cause compatibility issues). This function is run before the actual block is placed, so to get information about the block state, the storage `gm4_relocators:temp gm4_relocation.block_state` can be searched (or modified).  

#### Example: 
function tag `#gm4_relocators:place_down/place_block`
```json
{
    "values": [
        "my_module:relocate/additional_blocks",
        "my_module:relocate/check_furnace"
    ]
}
```
function `my_module:relocate/additional_blocks`
```mcfunction
# if using lantern load, there should be an intermidiate function 
#  that calls this one after checking the score
#  there are other examples for load checking in this document

# place down obsidian
execute if block ~ ~ ~ air if data storage gm4_relocators:temp gm4_relocation.block_state{id:"obsidian"} run setblock ~ ~ ~ obsidian
# place down beehive
execute if block ~ ~ ~ air if data storage gm4_relocators:temp gm4_relocation.block_state{id:"beehive"} run function my_module:relocate/place_beehive
```
function `my_module:relocate/place_beehive`
```mcfunction
# get honey level
#  facing is already stored by default
execute store result score $honey_level gm4_rl_data run data get storage gm4_relocators:temp gm4_relocation.block_state.honey_level

# place beehive based on block state
execute if score $facing gm4_rl_data matches 0..2 if score $honey_level gm4_rl_data matches 0 run setblock ~ ~ ~ beehive[facing=north,honey_level=0]
execute if score $facing gm4_rl_data matches 3 if score $honey_level gm4_rl_data matches 0 run setblock ~ ~ ~ beehive[facing=south,honey_level=0]
execute if score $facing gm4_rl_data matches 4 if score $honey_level gm4_rl_data matches 0 run setblock ~ ~ ~ beehive[facing=east,honey_level=0]
execute if score $facing gm4_rl_data matches 5 if score $honey_level gm4_rl_data matches 0 run setblock ~ ~ ~ beehive[facing=west,honey_level=0]

execute if score $facing gm4_rl_data matches 0..2 if score $honey_level gm4_rl_data matches 1 run setblock ~ ~ ~ beehive[facing=north,honey_level=1]
execute if score $facing gm4_rl_data matches 3 if score $honey_level gm4_rl_data matches 1 run setblock ~ ~ ~ beehive[facing=south,honey_level=1]
execute if score $facing gm4_rl_data matches 4 if score $honey_level gm4_rl_data matches 1 run setblock ~ ~ ~ beehive[facing=east,honey_level=1]
execute if score $facing gm4_rl_data matches 5 if score $honey_level gm4_rl_data matches 1 run setblock ~ ~ ~ beehive[facing=west,honey_level=1]

# repeat for all honey levels
```
function `my_module:relocate/check_furnace`
```mcfunction
# load score check is technically optional for non-GM4 data packs
execute if block ~ ~ ~ air if score my_module load.status matches 1 if data storage gm4_relocators:temp gm4_relocation.block_state{id:"furnace"} run summon marker ~ ~ ~ {CustomName:'"my_custom_furnace_handler"',Tags:["my_custom_furnace_handler","smithed.entity","smithed.strict"]} 
```
