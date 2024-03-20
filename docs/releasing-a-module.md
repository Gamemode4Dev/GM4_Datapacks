# Releasing a Module
This guide is for maintainers that want to publish a new module on Modrinth and Smithed. Unlike our own website, this does require some manual setup.

## Table of contents
* [Creating promo material](#creating-promo-material)
* [Initial project setup](#initial-project-setup)
* [Configuring the repo](#configuring-the-repo)
* [Finishing the release](#finishing-the-release)

## Creating promo material
Before a module is able to be released on Modrinth and Smithed, some promo material needs to be created:
* Readme
* Module icon
* Short demo video

## Initial project setup

### Modrinth
1. Log in to your own account, go to the Gamemode 4 [organization settings](https://modrinth.com/organization/gamemode4/settings/projects) and click on "Create a project"
2. Set **Name** to the module name, for example `Holographic Tags`
3. Set **URL** to the module ID joined with dashes, for example `gm4-holographic-tags`
4. Set **Summary** to the website description, for example `Set up floating messages with a simple name tag!`
5. Upload the project **Icon** using the source `pack.png`
6. Set the **License** to `GNU General Public License v3`
7. Set the **External links** to github repo, wiki page, discord invite, and patreon link
8. If it exists, add a **Featured gallery image** from the gm4.co repo, preferably in `webp` format

### Smithed
1. Log in to the shared Gamemode 4 account and [create a new pack](https://smithed.net/edit?new=true)
2. Set **Project id** to the module ID, for example `gm4_holographic_tags`
3. Set **Project name** to the module name, combined with "Gamemode 4", for example `Holographic Tags | Gamemode 4`
4. Set **Short project description** to the website description, for example `Set up floating messages with a simple name tag!`
5. Set **Project website** to the module on gm4.co, for example `https://gm4.co/modules/holographic-tags`
6. On the **Versions** tab, add a dummy version using tag `0.0.1`, this will need to be removed later
7. Set the **Datapack URL** to the zip on the release branch, for example `https://raw.githubusercontent.com/Gamemode4Dev/GM4_Datapacks/release/1.20/gm4_holographic_tags_1_20.zip`
8. Set **Supported Versions** to the latest release

## Configuring the repo
Add the Modrinth and Smithed project IDs to the module's `beet.yaml` file. Commit or PR this change to the default branch and let the workflow run.

For example:
```yaml
# ...
meta:
  # ...
  modrinth:
    project_id: AzpWemXn
  smithed:
    pack_id: gm4_holographic_tags
```

## Finishing the release

### Modrinth
1. After the first version has been uploaded by the github action, add accurate **Tags** in settings
2. Submit the data pack for review

### Smithed
1. Remove the temporary `0.0.1` version
