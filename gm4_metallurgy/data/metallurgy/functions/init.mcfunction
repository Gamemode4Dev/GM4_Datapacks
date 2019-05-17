#announce module installation
tellraw @a[gamemode=creative] ["",{"text":"[GM4]: Installing Metallurgy..."}]
execute unless entity @p run say GM4: Installing Metallurgy...

#declare and initialise scoreboards and settings
scoreboard players set update_happened gm4_up_check 1
scoreboard players set metallurgy gm4_modules 1
scoreboard players set metallurgy gm4_clock_tick 0

scoreboard objectives add gm4_ml_data dummy
scoreboard players set found_primed_tnt gm4_ml_data 0
scoreboard objectives add gm4_ml_heat dummy

scoreboard objectives add gm4_ml_ore_ba dummy
scoreboard objectives add gm4_ml_ore_al dummy
scoreboard objectives add gm4_ml_ore_cu dummy
scoreboard objectives add gm4_ml_ore_th dummy

#arborenda
scoreboard objectives add gm4_use_axe_dia minecraft.used:minecraft.diamond_axe
scoreboard objectives add gm4_use_axe_gol minecraft.used:minecraft.golden_axe
scoreboard objectives add gm4_use_axe_iro minecraft.used:minecraft.iron_axe
scoreboard objectives add gm4_use_axe_sto minecraft.used:minecraft.stone_axe
scoreboard objectives add gm4_use_axe_woo minecraft.used:minecraft.wooden_axe

#conduction
scoreboard objectives add gm4_volt_time dummy
scoreboard objectives add gm4_volt_damage minecraft.custom:minecraft.damage_dealt
scoreboard objectives add gm4_volt_dist dummy

#forterra
scoreboard objectives add gm4_forterra_use minecraft.mined:minecraft.stone

#ender_bolt
scoreboard objectives add gm4_bolt_damage minecraft.custom:minecraft.damage_dealt
scoreboard objectives add gm4_bolt_time dummy

#musical
scoreboard objectives add gm4_note_collect totalKillCount
scoreboard objectives add gm4_note_time dummy

#sensus
scoreboard objectives add gm4_sensus_layer dummy
scoreboard players set current_sensus_layer gm4_sensus_layer 0

#levity
scoreboard objectives add gm4_levity_sneak minecraft.custom:minecraft.sneak_time

#announce success
tellraw @a[gamemode=creative] ["",{"text":"[GM4]: Metallurgy Installed!"}]
execute unless entity @p run say GM4: Metallurgy Installed!

#check other modules to make sure they're up to date.
#$moduleUpdateList
