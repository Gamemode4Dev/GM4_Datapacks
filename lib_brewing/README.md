# lib_brewing
lib_brewing is a mcfunction library that allows other datapacks to replace custom potions with splash and lingering potions when brewed in a brewing stand. This is used to prevent the `Uncraftable Splash Potion` and `Uncraftable Lingering Potion` items from being obtainable.

## Uses
### Splash and Lingering Conversions
This library automatically catches splash and lingering potion conversions to allow datapacks to properly replace those potions. This means whenever a potion is brewed into a splash potion using gunpowder, a set of functions will be run to replace the Uncraftable Splash Potion with a custom splash potion. Similarly, whenever a splash potion is brewed into a lingering potion using dragon's breath, a set of functions will be run to replace the Uncraftable Lingering Potion with a custom lingering potion.

Each brewing stand has a marker to track these changes. When splash and lingering potions are created, each potion is checked by calling the `#gm4_brewing:insert/splash` or `#gm4_brewing:insert/lingering` function tags (once per potion, so if there are 3 potions in the brewing stand, that function tag gets called for each potion). The full item nbt for each potion is saved into the nbt of the marker in `data.gm4_brewing.insert.tag.<ITEM_NBT>`. For example if the brewing stand has the nbt `{Items:[{Slot:0b,id:"minecraft:potion",Count:1b,tag:{my_custom_potion:1b}}]}`, the marker would have the nbt `{data:{gm4_brewing:{insert:{Slot:0b,id:"minecraft:potion",Count:1b,tag:{my_custom_potion:1b}}}}}` when it's checking the first potion. This is how you should check for your custom potions

To utilize this function, two functions tags, two functions, and two loot tables should be created. Below are the files for splash potions, and can be copied for lingering potions by replacing all instances of `splash` with `lingering`

1. create a single loot table to check the potion type and drop the proper splash potion:

loot table `MODULE_ID:technical/brewing_stand/splash`
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

2. Create a function to call the splash potion loot table when the library catches a splash potion conversion:

function `MODULE_ID:brewing_stand/splash`
```mcfunction
# @s = brewing stand marker with a custom potion to be converted to a splash potion
# run from #gm4_brewing:insert/splash

loot spawn ~ ~ ~ loot MODULE_ID:technical/brewing_stand/splash
# uncomment this line to completely clear the potion VV
# execute if <...> run scoreboard players set $insert gm4_brewing_data -1
```

3. Add your function to the library API call that runs when the library catches a splash potion conversion:

function tag `#gm4_brewing:insert/splash`
```json
{
  "values": [
    "MODULE_ID:brewing_stand/splash"
  ]
}
```


### Changing Splash and Lingering Outcomes
- In the two created functions (`/brewing_stand/splash.mcfunction` and `/brewing_stand/lingering.mcfunction`) additonal commands can be run before the `/loot` command to change the outcome of the loot tables. For example, if you want potions to turn into a water bottle if the brewing stand is surrounded by water, you could set a score and have the loot table check for that score.

- Using the following command will clear the potion from the brewing stand (should typically be used with a check so only certain custom potions are deleted):
```mcfunction
scoreboard players set $insert gm4_brewing_data -1
```

### Additional Brewing Functions
Every time a brewing stand completes a brew, the function tag `#gm4_brewing:finish_brew` runs AFTER the default interactions of creating splash and lingering potions. This allows further checks and modifications to potions (but is still restricted to the vanilla hardcoded brewing rules; i.e. it doesn't allow using dirt as a brewing ingredient). The `Items` nbt of the brewing stand is saved 1 tick before the potions finish brewing (when `#gm4_brewing:finish_brew` is called), so the brewing ingredient and original potion data is available inside the marker nbt. To test for items in the brewing stand, use the entity data from the marker: 

```mcfunction
execute if entity @s[nbt={data:{gm4_brewing:{previous_items:[BLOCK_DATA]}}}]
```

For example, this is the code that checks if a splash potion should be created: 
```mcfunction
execute if entity @s[nbt={data:{gm4_brewing:{previous_items:[{Slot:3b,id:"minecraft:gunpowder"}]}}}] ...
```


## License
This library, and the contents of the `lib_brewing` directory on the [github repository](https://github.com/Gamemode4Dev/GM4_Datapacks), is licensed under the MIT License.
