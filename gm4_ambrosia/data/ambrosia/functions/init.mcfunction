#announce module installation
tellraw @a[gamemode=creative] ["",{"text":"[GM4]: Installing Ambrosia..."}]
execute unless entity @p run say GM4: Installing Ambrosia...

#declare and initialise scoreboards and settings
scoreboard players set update_happened gm4_up_check 1
scoreboard players set ambrosia gm4_modules 1
scoreboard players set ambrosia gm4_clock_tick 0
scoreboard objectives add gm4_bees dummy
scoreboard objectives add gm4_hive_timer dummy
scoreboard objectives add gm4_bee_data dummy

scoreboard objectives add gm4_leaf_broken minecraft.mined:minecraft.oak_leaves
scoreboard players set #10 gm4_bee_data 10
scoreboard players set #100 gm4_bee_data 100
scoreboard players set #16 gm4_bee_data 16
scoreboard players set #10000 gm4_bee_data 10000

# set naturalRegeneration to false
gamerule naturalRegeneration false

#announce success
tellraw @a[gamemode=creative] ["",{"text":"[GM4]: Ambrosia Installed!"}]
execute unless entity @p run say GM4: Ambrosia Installed!

#check other modules to make sure they're up to date.
#$moduleUpdateList
