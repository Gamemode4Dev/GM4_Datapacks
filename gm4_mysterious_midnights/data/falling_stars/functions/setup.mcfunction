#called upon start of a rare mysterious midnight. Used to select this expansion by chance.
say falling_stars.setup

summon minecraft:area_effect_cloud ~ ~ ~ {CustomName:"\"gm4_falling_stars\"",Tags:["gm4_mysterious_midnight_expansion","gm4_falling_stars"],Duration:18000,Radius:0.01,Particle:"block air"}
