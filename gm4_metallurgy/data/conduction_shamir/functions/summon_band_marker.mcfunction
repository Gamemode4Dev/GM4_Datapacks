#@s = mould requesting thorium marker clouds after mould destruction
#run from metallurgy:casting/summon_band/thorium via #metallurgy:random_band_init/thorium

#summon the marker AEC
summon area_effect_cloud ~ ~ ~ {Tags:["gm4_ml_raw_thorium_band","gm4_ml_conduction_marker"],CustomName:"\"gm4_ml_conduction_band_marker\"",Duration:1}
