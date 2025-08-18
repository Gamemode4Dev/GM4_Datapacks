# make the bogged ride a spider
# @s = bogged
# at @s
# run from mob/init/mob_type/skeleton/base

tag @s add gm4_sr_extra_mob
ride @e[tag=gm4_mu_self,distance=..0.1,limit=1] mount @s
