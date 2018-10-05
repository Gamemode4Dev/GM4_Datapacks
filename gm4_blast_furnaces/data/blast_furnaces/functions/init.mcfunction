#announce module installation
tellraw @a[gamemode=creative] ["",{"text":"[GM4]: Installing Blast Furnaces..."}]
execute unless entity @p run say GM4: Installing Blast Furnaces...

#declare and initialise scoreboards and settings
scoreboard players set updateHappened gm4_upCheck 1
scoreboard players set blast_furnaces gm4_modules 1
scoreboard players set blast_furnaces gm4_clockTick 0

# add utility scoreboards
scoreboard objectives add gm4_bf_placed minecraft.used:minecraft.iron_block
scoreboard objectives add gm4_bf_placedf minecraft.used:minecraft.furnace

#announce success
tellraw @a[gamemode=creative] ["",{"text":"[GM4]: Blast Furnaces Installed!"}]
execute unless entity @p run say GM4: Blast Furnaces Installed!

#check other modules to make sure they're up to date.
execute if score bat_grenades gm4_modules matches ..1 run summon minecraft:area_effect_cloud ~ ~ ~ {CustomName:"\"Custom Crafters\"",Tags:["updateMessage"],Duration:2000}
