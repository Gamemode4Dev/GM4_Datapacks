# @s = brewing stand marker with a custom potion to be converted to a splash potion
# run from #gm4_brewing:insert/splash

execute if data entity @s data.gm4_brewing.insert.tag.gm4_zauber_cauldrons{item:"potion"} run scoreboard players set $insert gm4_brewing_data -1
execute if score $insert gm4_brewing_data matches -1 run summon tnt
