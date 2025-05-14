# @s = new congealed shard bat
# run from soul_forge/entities/summon_congealed_shard
# and from soul_forge/entities/summon_extra_shard

$loot replace entity @s weapon.mainhand loot gm4_orb_of_ankou:items/soul_shard/$(id)
data merge entity @s {CustomName:{"translate":"entity.gm4.congealed_shard","fallback":"Congealed Soul Shard§"},CustomNameVisible:0b,Team:"gm4_hide_name",Health:2.0f,DeathLootTable:"gm4:empty",PersistenceRequired:1b,Tags:["gm4_oa_congealed_shard","gm4_oa_ignore","gm4_defused_bat"],drop_chances:{mainhand:2.0f,offhand:1.0f},Motion:[0.0,0.6,0.0],active_effects:[{id:'minecraft:fire_resistance',amplifier:0b,duration:1000000,show_particles:0b}]}
function gm4_orb_of_ankou:soul_forge/entities/set_data/randomize_motion
