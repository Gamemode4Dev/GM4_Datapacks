#announce module installation
tellraw @a[gamemode=creative] [{"translate":"%1$s%3427655$s","with":["[GM4]: ",{"translate":"text.gm4.prefix"}]},{"translate":"%1$s%3427655$s","with":["Installing End Fishing...",{"translate":"text.gm4.modules.update.installing","with":[{"translate":"module.gm4.end_fishing"}]}]}]
execute unless entity @a[limit=1] run say GM4: Installing End Fishing...

#declare and initialise scoreboards and settings
scoreboard players set update_happened gm4_up_check 1
scoreboard players set end_fishing gm4_modules 1
scoreboard players set end_fishing gm4_clock_tick 0

scoreboard objectives add gm4_cast_rod minecraft.used:minecraft.fishing_rod
scoreboard objectives add gm4_ef_timer dummy
scoreboard objectives add gm4_ef_id dummy
scoreboard objectives add gm4_ef_lure dummy
scoreboard objectives add gm4_ef_up_bait dummy
scoreboard objectives add gm4_ef_data dummy
execute unless score seed gm4_ef_data matches 0.. run scoreboard players set seed gm4_ef_data 731031
scoreboard players set mult gm4_ef_data 1664525
scoreboard players set incr gm4_ef_data 1013904223
scoreboard players set #100 gm4_ef_data 100
scoreboard players set #6 gm4_ef_data 6
scoreboard players set #0 gm4_ef_data 0
scoreboard players set #57 gm4_ef_data 57
scoreboard players set #4 gm4_ef_data 4

#announce success
tellraw @a[gamemode=creative] [{"translate":"%1$s%3427655$s","with":["[GM4]: ",{"translate":"text.gm4.prefix"}]},{"translate":"%1$s%3427655$s","with":["End Fishing Installed!",{"translate":"text.gm4.modules.update.installed","with":[{"translate":"module.gm4.end_fishing"}]}]}]
execute unless entity @a[limit=1] run say GM4: End Fishing Installed!

#check other modules to make sure they're up to date.
#$moduleUpdateList
