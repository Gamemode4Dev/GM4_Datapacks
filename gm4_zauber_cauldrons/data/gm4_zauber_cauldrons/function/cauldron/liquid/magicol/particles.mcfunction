# particles displayed over a cauldron when it is filled with magicol
# @s = zauber cauldron with valid structure
# at @s align xyz
# run from gm4_zauber_cauldrons:cauldron/liquid/magicol/check_liquid_id

# display enchant particles for players with full zauber armor during the correct moon phase
scoreboard players reset $preferred gm4_zc_moon_phase
execute store result score $preferred gm4_zc_moon_phase run data get storage gm4_zauber_cauldrons:temp/cauldron/ingredients liquid.magicol.moon_phase
execute if function gm4_zauber_cauldrons:cauldron/liquid/magicol/check_moon_phase run particle minecraft:electric_spark ~.5 ~.78 ~.5 0.25 0.25 0.25 0.01 6 normal @a[distance=..8,advancements={gm4_zauber_cauldrons:equipment/has_full_armor=true}]

# make sure the cauldron is in loaded chunks to avoid entity buildup
execute unless loaded ~ ~ ~ run return -1

# if liquid id is magicol, display particles
# generated with the help of bolt
for color_data in ctx.meta['magicol_colors']:
    # TODO 1.20.5: figure out how this particle looked in 1.20.4
    execute unless score $displayed_magicol_particle gm4_zc_data matches 1.. store success score $displayed_magicol_particle gm4_zc_data if data storage gm4_zauber_cauldrons:temp/cauldron/ingredients liquid{id:"magicol",magicol:{color:color_data['color']}} unless entity @e[type=area_effect_cloud,dx=0,limit=1] run summon area_effect_cloud ~.5 ~.75 ~.5 {CustomName:'"gm4_zc_magicol_particle"',Tags:["gm4_zc_magicol_particle"],Particle:{type:"minecraft:entity_effect",color:[1.0,1.0,1.0,1.0]},Radius:0.1f,Duration:10,Color:int(color_data['potion_color'].to_color_code('dec'))}

# set flag
scoreboard players set $displayed_liquid_particle gm4_zc_data 1

# reset fake player
scoreboard players reset $displayed_magicol_particle gm4_zc_data
