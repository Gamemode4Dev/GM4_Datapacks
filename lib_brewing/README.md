# lib_brewing
lib_brewing is a mcfunction library that allows other datapacks to replace custom potions with splash and lingering potions when brewed in a brewing stand. This is used to prevent the `Uncraftable Splash Potion` and `Uncraftable Lingering Potion` items from being obtainable.

## How to Use
Next to allow the module to utilize the library, two functions tags, two functions, and two loot tables should be created.
- create the function tag file 

    `/data/gm4_brewing/tags/functions/insert/splash.json`

    with the following code:
```json
{
    "values": [
        "MODULE_ID:brewing_stand/splash"
    ]
}
```

- create the function tag file 

    `/data/gm4_brewing/tags/functions/insert/splash.json`

    with the following code:
```json
{
    "values": [
        "MODULE_ID:brewing_stand/lingering"
    ]
}
```

- create the function file 

    `/data/MODULE_ID/functions/brewing_stand/splash.mcfunction`

    with the following code:
```mcfunction
# @s = brewing stand marker with a custom potion to be converted to a splash potion
# run from #gm4_brewing:insert/splash

loot spawn ~ ~ ~ loot MODULE_ID:technical/brewing_stand/splash
# uncomment this line to completely clear the potion VV
# execute if <...> run scoreboard players set $insert gm4_brewing_data -1
```

- create the function file 

    `/data/MODULE_ID/functions/brewing_stand/lingering.mcfunction`

    with the following code:
```mcfunction
# @s = brewing stand marker with a custom splash potion to be converted to a lingering potion
# run from #gm4_brewing:insert/lingering

loot spawn ~ ~ ~ loot MODULE_ID:brewing_stand/lingering
# uncomment this line to completely clear the potion VV
# execute if <...> run scoreboard players set $insert gm4_brewing_data -1
```

- create the loot table file 
    `/data/MODULE_ID/loot_tables/technical/brewing_stand/splash.json>`

    with the following code:
```json
{
    "pools": [
        {
            "rolls": 1,
            "entries": [
                {
                    "type": "minecraft:alternatives",
                    "children": [
                        {
                            "type": "minecraft:loot_table",
                            "name": "LOOT TABLE PATH TO SPLASH POTION 1",
                            "conditions": [
                                {
                                    "condition": "minecraft:entity_properties",
                                    "entity": "this",
                                    "predicate": {
                                        "nbt": "{data:{gm4_brewing:{insert:{tag:{INDICATION NBT FOR POTION 1}}}}"
                                    }
                                }
                            ]
                        },
                        {
                            "type": "minecraft:loot_table",
                            "name": "LOOT TABLE PATH TO SPLASH POTION 2",
                            "conditions": [
                                {
                                    "condition": "minecraft:entity_properties",
                                    "entity": "this",
                                    "predicate": {
                                        "nbt": "{data:{gm4_brewing:{insert:{tag:{INDICATION NBT FOR POTION 2}}}}"
                                    }
                                }
                            ]
                        }
                    ]
                }
            ],
            "functions": [
                {
                    "function": "minecraft:set_nbt",
                    "tag": "{gm4_custom_potion:1b}"
                }
            ]
        }
    ]
}
```

- create the loot table file 

    `/data/MODULE_ID/loot_tables/technical/brewing_stand/lingering.json`

    with the following code:
```json
{
    "pools": [
        {
            "rolls": 1,
            "entries": [
                {
                    "type": "minecraft:alternatives",
                    "children": [
                        {
                            "type": "minecraft:loot_table",
                            "name": "LOOT TABLE PATH TO LINGERING POTION 1",
                            "conditions": [
                                {
                                    "condition": "minecraft:entity_properties",
                                    "entity": "this",
                                    "predicate": {
                                        "nbt": "{data:{gm4_brewing:{insert:{tag:{INDICATION NBT FOR SPLASH POTION 1}}}}"
                                    }
                                }
                            ]
                        },
                        {
                            "type": "minecraft:loot_table",
                            "name": "LOOT TABLE PATH TO LINGERING POTION 2",
                            "conditions": [
                                {
                                    "condition": "minecraft:entity_properties",
                                    "entity": "this",
                                    "predicate": {
                                        "nbt": "{data:{gm4_brewing:{insert:{tag:{INDICATION NBT FOR SPLASH POTION 2}}}}"
                                    }
                                }
                            ]
                        }
                    ]
                }
            ],
            "functions": [
                {
                    "function": "minecraft:set_nbt",
                    "tag": "{gm4_custom_potion:1b}"
                }
            ]
        }
    ]
}
```

## Additional Functionality
- the contents of the brewing stand the tick before it finishes brewing can be found by the entity nbt of the marker under the following namespace:
```mcfunction
execute if data entity @s data.gm4_brewing.insert.tag.<ITEM_NBT>
```

- in the two created function files (`/brewing_stand/splash.mcfunction` and `/brewing_stand/lingering.mcfunction`) additonal commands can be run before the `/loot` command to change the outcome of the loot tables. 

- Using the following command will clear the custom potion from the brewing stand:
```mcfunction
scoreboard players set $insert gm4_brewing_data -1
```

- the function tag 
    `/data/gm4_brewing/tags/functions/finish_brew.json`
    
    runs AFTER default interactions of creating splash and lingering potions
    - to test for items in the brewing stand, use the entity data from the marker:
        - `execute if entity @s[nbt={data:{gm4_brewing:{previous_items:[BLOCK_DATA]}}}]`
        - e.g. this is the code that checks if a splash potion should be created: 
            - `execute if entity @s[nbt={data:{gm4_brewing:{previous_items:[{Slot:3b,id:"minecraft:gunpowder"}]}}}]`
