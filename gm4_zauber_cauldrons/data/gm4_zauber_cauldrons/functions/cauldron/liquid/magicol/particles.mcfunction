# particles displayed over a cauldron when it is filled with magicol
# @s = zauber cauldron with valid structure
# at @s align xyz
# run via function tag #gm4_zauber_cauldrons:cauldron/liquid/cauldron_particles from cauldron/structure/valid

# if liquid id is magicol, display particles

# generated with the help of bolt
for color_data in ctx.meta['magicol_colors']:
    execute unless score $displayed_particle gm4_zc_data matches 1.. store success score $displayed_particle gm4_zc_data if data storage gm4_zauber_cauldrons:temp/cauldron/ingredients liquid{id:"magicol",magicol:{color:color_data['color']}} run summon area_effect_cloud ~.5 ~.75 ~.5 {Particle:"entity_effect",Radius:0.1f,Duration:10,Color:int(color_data['particle_color'])}

# reset fake player
scoreboard players reset $displayed_particle gm4_zc_data
