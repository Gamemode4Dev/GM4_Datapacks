#announce module installation
tellraw @a[gamemode=creative] [{"translate":"%1$s","with":["[GM4]: ",{"translate":"text.gm4.prefix"}]},{"translate":"%1$s","with":["Installing Rituals...",{"translate":"text.gm4.modules.update.installing","with":["Rituals",{"translate":"module.gm4.rituals"}]}]}]
execute unless entity @a[limit=1] run say GM4: Installing Rituals...

#declare and initialise scoreboards and settings
scoreboard players set update_happened gm4_up_check 1
scoreboard players set rituals gm4_modules 1
scoreboard players set rituals gm4_clock_tick 0
scoreboard players set rituals_4 gm4_clock_tick 4
scoreboard players set rituals_8 gm4_clock_tick 8
scoreboard players set rituals_12 gm4_clock_tick 12

scoreboard objectives add gm4_rit_sneak minecraft.custom:minecraft.sneak_time
scoreboard objectives add gm4_rit_stock dummy
scoreboard objectives add gm4_rit_tick dummy

scoreboard objectives add gm4_rit_clear dummy
scoreboard objectives add gm4_rit_rain dummy
scoreboard objectives add gm4_rit_thunder dummy

team add gm4_rit_no_coll
team modify gm4_rit_no_coll collisionRule never

#announce success
tellraw @a[gamemode=creative] [{"translate":"%1$s","with":["[GM4]: ",{"translate":"text.gm4.prefix"}]},{"translate":"%1$s","with":["Rituals Installed!",{"translate":"text.gm4.modules.update.installed","with":["Rituals",{"translate":"module.gm4.rituals"}]}]}]
execute unless entity @a[limit=1] run say GM4: Rituals Installed!

#check other modules to make sure they're up to date.
#$moduleUpdateList
