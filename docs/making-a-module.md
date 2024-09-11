# Making a Module
Before making a module, follow the 
[Getting Started](./getting-started.md) guide to setup development.

## Table of contents
* [Module setup](#module-setup)
  * [Beet config](#beet-config)
  * [Load](#load)
* [Writing the module](#writing-the-module)
  * [Guidebook pages](#guidebook-pages)
  * [Tests](#tests)
* [Submitting a pull request](#submitting-a-pull-request)
* [Finishing up for release](#finishing-up-for-release)
  * [Credits](#credits)
  * [Readme](#readme)
  * [Icon](#icon)
  * [Images](#images)
  * [Readme](#readme)
  * [Wiki page](#wiki-page)

## Module setup
As with any changes to the repository, create a new branch:
```
git checkout -b my-new-module
```

Start by copying the `gm4_bat_grenades` folder to the new module ID. It is by far the smallest module so it's easy to use as a template.
* Rename the folder `gm4_bat_grenades/data/gm4_bat_grenades` to `gm4_<module_id>/data/gm4_<module_id>`.
* In the `functions` folder, find and replace all instances of `bat_grenades` with `<module_id>`.

### Beet config
Each module has a `beet.yaml` file that contains information on how to build the pack and some metadata used on the website.
```yaml
# The ID and name of this module. The ID should always be the same as the current directory name
id: gm4_disassemblers
name: Disassemblers
# Version "patch" value is managed by a github action. Leave it as 'X'
version: '1.3.X'

# Load the current directory
data_pack:
  load: .

# The build pipeline for this module
pipeline:
  # First run any plugins to generate extra files or make changes programatically
  - gm4_disassemblers.generate_disassembly

  # Extend the default config for modules. This adds the base library and other boilerplate
  - gm4.plugins.extend.modules

  # Include any libraries
  - gm4.plugins.include.lib_machines
  - gm4.plugins.include.lib_custom_crafters

# Metadata for the build and publishing on the website
meta:
  gm4:
    versioning:
      # A list of minimum-required versions for libraries or other modules
      required:
        - lib_custom_crafters: 3.0.0
        - lib_machines: 1.1.0
        - gm4_bat_grenades: 1.2.0

      # A list of any functions that create "schedule loop clocks". Necessary to turn off the module in case of a load failure
      schedule_loops:
        - main # namespace assumed to be the module id
        - gm4_bat_grenades:tick # but one can be manually specified

    website:
      # A description. This should be a good summary of what this module adds or achieves, to get someone interested in this module
      description: Break apart gold and iron tools and weapons for materials. Attach this to a mobfarm to finally make use of those extra armour sets!
      # Any recommended modules
      recommended:
        - gm4_resource_pack
        - gm4_relocators
      # Important notes for people when they download the module. This can be empty
      notes: []
      # Keywords used by gm4.co's search feature, may be omitted
      search_keywords:
        - shamir
        - enderpuff

    # Either null or a link to the YouTube video
    video: null
    # Either null or a link to the wiki page
    wiki: https://wiki.gm4.co/wiki/Disassemblers
    # The credits section. Can have different titles each being a list of names
    credits:
      Creator:
        - Sparks
      Textures by:
        - kyrkis

  modrinth: # This section is only necessary when publishing to Modrinth
    project_id: itk6Zfe2
  smithed: # This section is only necessary when publiching to Smithed
    pack_id: gm4_disassemblers
```

### Load
Gamemode 4 uses [LanternMC Load](https://github.com/LanternMC/Load) so modules work nicely with other data packs. This allows modules to check which version of the gm4 base is loaded and prevents conflicts. It also allows checking whether reliant modules are installed.

The required files to interact with LanternMC Load are generated automatically by a beet plugin included in the `extend.module` config, based on the metadata specified in `meta.gm4.versioning` of the `beet.yaml`.

If all required dependencies are present, Lantern Load will call `init.mcfunction`. This function is written by the developer, and is responsible for adding necessary scoreboards and `/schedule`-ing any clocked functions, specified in `meta.gm4.versioning.schedule_loops`.

#### Logging
Messages can be logged during the load process. This can be done by appending to the `queue` field in the `gm4:log` storage. Here are a few examples:
```mcfunction
data modify storage gm4:log queue append value {type:"text",message:"We've been attempting to contant you about your cars extended warranty"}
data modify storage gm4:log queue append value {type:"install",module:"Bat Grenades"}
```

#### Ticking
Gamemode 4 modules use `/schedule` to run functions every few ticks. There are 2 standard clock speeds. Both functions schedule itself. You are free to add a different clock speed, however these are the standards:
- `tick.mcfunction` runs every tick.
- `main.mcfunction` runs every 16 ticks.

## Writing the module
When writing the data pack, make sure to follow our [Code Conventions](./code-conventions.md).

### Translatable text
All text visible to survival players (names, lore, actionbar, advancements) should use translation fallbacks like this:
```json
{
  "translate": "advancement.gm4.block_compressors.title",
  "fallback": "Clever Crushing"
}
```
Additionally, every translation key defined by your data pack should be listed in the `translations.csv` babelbox file, along with its fallback as the `en_us` translation.

### Custom model data
Gamemode 4 uses a custom beet plugin that enables the use of string references instead of hard-to-remember integers when dealing with custom model data. After configuring the custom model data values your data pack will use in the `beet.yaml` or `model_data`.yaml files, the plugin will auto-assign the unique integer values and substitute them into the data pack output by the beet build process. 

As a simple example:
```yaml
# beet.yaml
meta:
  gm4:
    model_data:
      - item: rabbit_hide
        reference: gm4_bat_grenades:item/bat_leather
```
```mcfunction
give @s rabbit_hide[custom_model_data="gm4_bat_grenades:item/bat_leather"]
```

This plugin also has infrastructure to auto-generate most parts of the resource pack. For more advanced usage, refer to [Resource Pack Management](./resource-pack-management.md)

### Guidebook pages
Each Gamemode 4 module must include guidebook pages to aid in the explaination and progression of the module. Details on how to add a section to the guidebook can be found in [`gm4_guidebook/CONTRIBUTING.md`](https://github.com/Gamemode4Dev/GM4_Datapacks/blob/master/gm4_guidebook/CONTRIBUTING.md).

### Tests
Automated tests for modules should be added in the `data/gm4_module_id/test` folder. The tests will automatically run in GitHub Actions when you submit a PR. For local development and for the full documentation, see the [PackTest](https://github.com/misode/packtest) project.

## Submitting a pull request
At any point when you feel the module is ready to recieve feedback or testing, you can create a pull request. You can still make changes afterwards.

*See also: [Getting Started § Submitting changes](./getting-started.md#submitting-changes)*

## Finishing up for release

### Credits
Make sure to credit all relevant people in `beet.yaml`. Most modules credit the creator (`Creator`), updaters (`Updated by`) and the icon designer (`Icon Design`), however, you may add credits for any work relevant to the module. Each credits section consists of an array of strings, which hold the names of the contributors.

If you also want a link to a social profile, add an entry to `gm4/contributors.json`:
```jsonc
[
    // ...
    {
        "name": "YourName",
        "links": ["https://github.com/yourname"]
    },
    // ...
]
```

### Icon
If the module already has an icon, replace the `pack.png` and `pack.svg`. Otherwise, remove these files so the module will use the placeholder icon.

<!-- TODO: Describe icon formats and creation process -->

### Images
Add promotional assets to an `images` folder. These can be gifs or pictures which showcase some of the module's features.

<!-- TODO: Describe image formats and creation process -->

### Readme
Create a `README.md` file in the root of the module directory. The contents of this file will be used on distribution platforms like Modrinth and Smithed.

### Wiki page
After a module has been accepted, a wiki page may be created on [wiki.gm4.co](https://wiki.gm4.co/Main_Page).

<!-- TODO: Describe wiki creation process, either on the wiki or here -->
