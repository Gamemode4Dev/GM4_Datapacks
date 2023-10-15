# lib_potion_tracking
lib_potion_tracking is a mcfunction library that allows other datapacks to track thrown splash or lingering potions. This can be used to create custom splash/lingering potion events.

## How to Use
There are 2 function tags to be used: one to initially tag the potion to be tracked, and another which activates when the tracked potion lands.

### Marking the Potion to be Tracked
The function tag `#gm4_potion_tracking:tag_potion` is used to tag potions. This function tag runs every tick `as @e[type=potion,tag=!gm4_potion_tracking_checked]` (all potions are tagged with `gm4_potion_tracking_checked`, so each potion is only checked once). Modules should add the tag `gm4_potion` to allow the library to track the potion.

The entire entity data of the potion is stored in data storage under the namespace `gm4_potion_tracking:temp entity_data`. This storage can be used to verify the potion, but directly tagging the entity using a conditional `@s` is usually more efficient:
```mcfunction
tag @s[tag=!gm4_potion,nbt={<REQUIRED_NBT>}] add gm4_potion
```
- Note that `tag=!gm4_potion` **should** be used before checking NBT, since multiple modules will be calling this function tag, thus checking for the tag first will prevent extra unnecessary nbt checks

When the potion is tracked, a marker entity with the tag `gm4_potion_tracker` will be linked to the potion. The entire NBT data of the potion when it was thrown will be stored in the marker entity under the NBT `{data:{gm4_potion:{<Potion Entity NBT>}}}`.

#### Tagging Example
The follow function will tag all invisibility splash/lingering potions for tracking:
```mcfunction
tag @s[tag=!gm4_potion,nbt={Item:{tag:{Potion:"minecraft:invisibility"}}}] add gm4_potion
tag @s[tag=!gm4_potion,nbt={Item:{tag:{Potion:"minecraft:long_invisibility"}}}] add gm4_potion
tag @s[tag=!gm4_potion,nbt={Item:{tag:{CustomPotionEffects:[{id:"minecraft:invisibility"}]}}}] add gm4_potion
```

So if the potion was a splash potion of invisibility, the summoned marker will have the following nbt: `{data:{gm4_potion:{Item:{id:"minecraft:splash_potion",Count:1b,tag:{Potion:"minecraft:invisibility"}}}}}`


### Executing When the Potion Lands
A function tag under the namespace `#gm4_potion_tracking:potion_landed` can be used to execute commands when the potion lands. This runs `as @e[type=marker,tag=gm4_potion_tracker] at @s`.

When the potion lands, data storage under the namespace `gm4_potion_tracking:temp entity_data` is set to the original potion's entity nbt (set from the marker's entity NBT `{data:{gm4_potion:{<This data is copied over>}}}`). 

The storage should be used to verify if the potion matches the module's custom potion. The marker's entity nbt is available (This is `@s` in the context of the function tag), but storage look up is more efficient in almost all cases.

#### Landing Example
The following function will catch when invisibility potions hit something:
```mcfunction
execute if data storage gm4_potion_tracking:temp entity_data.Item.tag{Potion:"minecraft:invisibility"} run function ...
execute if data storage gm4_potion_tracking:temp entity_data.Item.tag{Potion:"minecraft:long_invisibility"} run function ...
execute if data storage gm4_potion_tracking:temp entity_data.Item.tag{CustomPotionEffects:[{id:"minecraft:invisibility"}]} run function ...
```

## License
This library, and the contents of the `lib_potion_tracking` directory on the [github repository](https://github.com/Gamemode4Dev/GM4_Datapacks), is licensed under the MIT License.
