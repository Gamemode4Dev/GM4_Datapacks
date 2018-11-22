#announce module installation
tellraw @a[gamemode=creative] ["",{"text":"[GM4]: Installing Master Armor Stands..."}]
execute unless entity @p run say GM4: Installing Master Armor Stands...

#declare and initialise scoreboards and settings
scoreboard players set updateHappened gm4_upCheck 1
scoreboard players set master_armor_stands gm4_modules 1
scoreboard players set master_armor_stands gm4_clockTick 0
#
# Create scoreboards
#
scoreboard objectives add gm4_as_trigger trigger
scoreboard objectives add gm4_as_pose dummy
scoreboard objectives add gm4_give_book dummy
#
# Changes the gamerule sendCommandFeedback to false
#
gamerule sendCommandFeedback false

#announce success
tellraw @a[gamemode=creative] ["",{"text":"[GM4]: Master Armor Stands Installed!"}]
execute unless entity @p run say GM4: Master Armor Stands Installed!

#check other modules to make sure they're up to date.
execute if score bat_grenades gm4_modules matches ..1 run summon minecraft:area_effect_cloud ~ ~ ~ {CustomName:"\"Bat Grenades\"",Tags:["updateMessage"],Duration:2000}
execute if score bat_grenades gm4_modules matches ..1 run summon minecraft:area_effect_cloud ~ ~ ~ {CustomName:"\"Another Module\"",Tags:["updateMessage"],Duration:2000}

#
# I don't know what this does but it said in the CONTRIBUTING.md that it has to be here
#

#$moduleUpdateList
