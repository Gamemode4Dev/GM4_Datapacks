# particles displayed over a cauldron when it is filled with magicol
# @s = zauber cauldron with valid structure
# at @s align xyz
# run from gm4_zauber_cauldrons:cauldron/liquid/magicol/check_liquid_id

# display enchant particles for players with full zauber armor during the correct moon phase
scoreboard players reset $preferred gm4_zc_moon_phase
execute store result score $preferred gm4_zc_moon_phase run data get storage gm4_zauber_cauldrons:temp/cauldron/ingredients liquid.magicol.moon_phase
execute if score $preferred gm4_zc_moon_phase = $current gm4_zc_moon_phase run particle enchant ~.5 ~.75 ~.5 0.1 0.1 0.1 0.4 6 normal @a[distance=..8,advancements={gm4_zauber_cauldrons:equipment/has_full_armor=true}]

# if liquid id is magicol, display particles
# generated with the help of bolt
for color_data in ctx.meta['magicol_colors']:
    execute unless score $displayed_magicol_particle gm4_zc_data matches 1.. store success score $displayed_magicol_particle gm4_zc_data if data storage gm4_zauber_cauldrons:temp/cauldron/ingredients liquid{id:"magicol",magicol:{color:color_data['color']}} run summon area_effect_cloud ~.5 ~.75 ~.5 {Particle:"entity_effect",Radius:0.1f,Duration:10,Color:int(color_data['potion_color'])}

# set flag
scoreboard players set $displayed_liquid_particle gm4_zc_data 1

# reset fake player
scoreboard players reset $displayed_magicol_particle gm4_zc_data
