# Research Subsite

This repo generates an R Shiny application with searchable `entries`. Each entry is a link to an tool (i.e., another app) or piece of research. Available at: [Flipside Crypto Research](https://science.flipsidecrypto.xyz/research)

# Adding Entries

## Entry

An entries csv is used as a simple internal database to all entries.

| title      | url          | description              | imgsrc              | tags                          |
|---------------|---------------|---------------|---------------|---------------|
| Main Title | URL to entry | 1-2 sentence under title | local link to image | searchable keywords for entry |

## Entry Image

Entry images should be placed in the `www/images/` folder; imgsrc should follow the structure `images/imagename.png`.
