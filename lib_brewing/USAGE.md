In order to add lib_brewing, first add the library to pack.mcmeta and load. 
- add the following line to the `"libraries"` array in <pack.mcmeta>. If the `"libraries"` array does not exist, create one below `"module_id"`
    - `"lib_brewing"`


- add the following line to the `"values"` array in </data/load/tags/functions/load:MODULE_ID.json>. This line should go above the load function that initializes the module
    - `{ "id": "#load:gm4_brewing", "required": false }`


- in </data/MODULE_ID/functions/load.mcfunction>, add the following code to the line 1. This text should be right before the words `run scoreboard players set MODULE_ID load.status 1`
    - `if score gm4_brewing load.status matches 1 `


- add the following line to </data/MODULE_ID/functions/load.mcfunction>. This line should go below the other missing log functions
    - `execute unless score gm4_brewing load.status matches 1 run data modify storage gm4:log queue append value {type:"missing",module:"MODULE_NAME",require:"lib_brewing"}`





Next to allow the module to utilize the library, two functions tags, two functions, and two loot tables should be created.
- create the function tag file </data/gm4_brewing/tags/functions/insert/splash.json>
{
    "values": [
        "MODULE_ID:brewing_stand/splash"
    ]
}


- create the function tag file </data/gm4_brewing/tags/functions/insert/lingering.json>
{
    "values": [
        "MODULE_ID:brewing_stand/lingering"
    ]
}


- create the function file </data/MODULE_ID/functions/brewing_stand/splash.mcfunction>
# @s = brewing stand marker with a custom potion to be converted to a splash potion
# run from #gm4_brewing:insert/splash

loot spawn ~ ~ ~ loot MODULE_ID:technical/brewing_stand/splash


- create the function file </data/MODULE_ID/functions/brewing_stand/lingering.mcfunction>
# @s = brewing stand marker with a custom splash potion to be converted to a lingering potion
# run from #gm4_brewing:insert/lingering

loot spawn ~ ~ ~ loot MODULE_ID:brewing_stand/lingering


- create the loot table file </data/MODULE_ID/loot_tables/technical/brewing_stand/splash.json>
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
                                        "nbt": "{data:{Insert:{tag:{INDICATION NBT FOR POTION 1}}}}"
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
                                        "nbt": "{data:{Insert:{tag:{INDICATION NBT FOR POTION 2}}}}"
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


- create the loot table file </data/MODULE_ID/loot_tables/technical/brewing_stand/lingering.json>
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
                                        "nbt": "{data:{Insert:{tag:{INDICATION NBT FOR SPLASH POTION 1}}}}"
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
                                        "nbt": "{data:{Insert:{tag:{INDICATION NBT FOR SPLASH POTION 2}}}}"
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




Additional functionality is available:
- in the two created function files (<brewing_stand/splash.mcfunction> and <brewing_stand/lingering.mcfunction>) additonal commands can be run before the `/loot` command, in order to change the outcome of the loot tables

- the function tag </data/gm4_brewing/tags/functions/finish_brew.json> runs AFTER default interactions of creating splash and lingering potions
    - to test for items in the brewing stand, use the entity data from the marker:
        - `execute if entity @s[nbt={data:{BLOCK_DATA}}]`
        - e.g. this is the code that checks if a splash potion should be created: 
            - `execute if entity @s[nbt={data:{Items:[{Slot:3b,id:"minecraft:gunpowder"}]}}]`
