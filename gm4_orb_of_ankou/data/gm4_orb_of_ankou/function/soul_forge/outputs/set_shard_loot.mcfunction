# @s = new soul shard bat
# run from soul_forge/outputs/create_shard

$loot replace entity @s armor.head loot gm4_orb_of_ankou:items/soul_shard/$(id)
data merge entity @s {CustomName:{"translate":"entity.gm4.possessed_shard","fallback":"Possessed Soul Shard§"},CustomNameVisible:0b,Team:"gm4_hide_name",DeathLootTable:"gm4:empty",PersistenceRequired:1b,Health:2.0f,Tags:["gm4_oa_possessed_soul_shard","gm4_oa_ignore","gm4_defused_bat"],active_effects:[{id:'minecraft:fire_resistance',amplifier:0b,duration:1000000,show_particles:0b}],drop_chances:{head:2F}}
