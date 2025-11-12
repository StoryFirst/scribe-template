# Scribe Template 

Scribe Template is a Jekyll theme, to be used with Story First's Scribe. It's intended to generate a static website from your world building content. 

# Scribe Data

Scribe outputs the following data: 

**_characters/** - Each character gets their own markdown file with the format `{id}.md`, it will use the layout 'character'
**_locations/** - Each location gets their own markdown file with the format `{id}.md`, it will use the layout 'location'
**_books/** - Each Book gets their own markdown file with the format `{id}.md`, it will use the layout 'book'
**_chapters/** - Each chapter gets their own markdown file with the format `{id}.md`, it will use the layout 'chapter'
**_scenes/** - Each scene gets their own markdownfile with the format `{id}.md`, it will use the layout 'scene'
**world.md** - The world markdown file. 
**_config.yaml** Jekyll config for that specfic site. 

## Github Action Template

You should be able to use the template file `github-action-template.yml` to automate a deploy to AWS S3, for the purpose of updating the website. It requires the secrets S3_AWS_ID and S3_AWS_SECRET to be setup as well as the variable S3_BUCKET.