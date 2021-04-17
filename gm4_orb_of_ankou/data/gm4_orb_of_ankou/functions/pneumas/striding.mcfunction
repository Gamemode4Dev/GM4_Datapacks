#@s = player with striding pneuma who is above lava
#run from tick

execute align xyz run summon area_effect_cloud ~0.5 ~-1 ~0.5 {Duration:5,Tags:["gm4_oa_striding_block"],Particle:"block air"}
setblock ~ ~-1 ~ magma_block
