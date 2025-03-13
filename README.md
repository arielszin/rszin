# RSZIN Hugo Website

This is the source code for the RSZIN website built with Hugo.

## Project Structure

- `content/`: Contains all the content for the website
- `themes/`: Contains the theme(s) used by the website
- `static/`: Contains static files like images, CSS, and JavaScript
- `layouts/`: Contains custom layout templates
- `archetypes/`: Contains content templates
- `data/`: Contains data files
- `i18n/`: Contains internationalization files
- `assets/`: Contains files that will be processed by Hugo Pipes

## Theme Management

The website uses the "dario" theme, which is managed as a Git submodule. See the [themes/README.md](themes/README.md) file for more information on how the theme is managed.

## Local Development

1. Start the Hugo development server:
   ```bash
   hugo server -D
   ```

2. Visit `http://localhost:1313` to see your site.

## Creating New Content

From the parent directory, run:

```bash
./new-post.sh "My New Post Title"
```

This will create a new post with the correct frontmatter and open it for editing.

## Building the Site

To build the site for production:

```bash
hugo --gc --minify
```

The built site will be in the `public/` directory.

## Deployment

The site is automatically deployed to Vercel when changes are pushed to the main branch of the parent repository. 