# Personal Website with Hugo and Vercel

This repository contains the source code for my personal website built with Hugo and deployed on Vercel. The site uses a minimalist design inspired by Dario Amodei's personal website.

## Repository Structure

This repository has been simplified for ease of maintenance. The main components are:

- `content/`: Contains all the website content (posts, pages, etc.)
- `themes/`: Contains the Hugo themes
- `archetypes/`: Contains templates for new content
- `build.sh`: A build script for Vercel deployment
- `vercel.json`: Configuration for Vercel deployment
- `new-post.sh`: Script to create new blog posts
- `hugo.toml`: Hugo configuration file
- `cleanup-redundancies.sh`: Script to clean up unnecessary files (can be run as needed)

Note: Some standard Hugo directories (like `static/`, `layouts/`, etc.) will be created automatically by Hugo when needed.

## Theme

This website uses the "dario" theme, a minimalist theme inspired by Dario Amodei's personal website. The theme is automatically cloned during the build process from [GrantBirki/dario](https://github.com/GrantBirki/dario).

Key features of the theme:
- Clean, minimalist design
- Dark mode support
- Responsive layout
- Focus on readability

## Development Workflow

### Prerequisites

- [Hugo](https://gohugo.io/installation/) (Extended version)
- [Git](https://git-scm.com/downloads)
- [Node.js](https://nodejs.org/) (for Vercel CLI, optional)

### Local Development

1. Clone this repository:
   ```bash
   git clone https://github.com/arielszin/RSZIN.git
   cd RSZIN
   ```

2. Start the Hugo development server:
   ```bash
   hugo server -D
   ```

3. Open your browser and visit http://localhost:1313 to see the site.

### Creating New Content

Use the provided script to create new posts:

```bash
./new-post.sh "My New Post Title"
```

This will create a new post file in the `content/posts/` directory with the current date and a slug based on the title.

#### Post Format

Posts are written in Markdown and include front matter at the top. A typical post looks like:

```markdown
---
title: "My Post Title"
date: 2025-03-14
draft: false
tags: ["tag1", "tag2"]
---

Content of your post goes here...
```

## Customization

### Site Configuration

The main configuration file is `hugo.toml`. You can edit this file to change:

- Site title and description
- Author information
- Base URL
- Theme settings

### Theme Customization

If you want to customize the theme, you can:

1. Create a `layouts/` directory to override theme templates
2. Create a `static/` directory for custom CSS, JavaScript, or images
3. Modify theme parameters in `hugo.toml`

## Deployment

The site is automatically deployed to Vercel when changes are pushed to the main branch. The deployment process uses the `build.sh` script to build the Hugo site.

The `vercel.json` file is configured to use this build script and includes security headers for the site:

```json
{
  "buildCommand": "./build.sh",
  "outputDirectory": "public"
}
```

### Deployment Configuration

- **Branch**: The site deploys from the `main` branch
- **Build Command**: `./build.sh`
- **Output Directory**: `public/`
- **Domain**: www.rszin.com

## Troubleshooting

### Common Issues

1. **Missing Theme**: If you see errors about a missing theme, the build script should automatically clone it. You can also manually clone it:
   ```bash
   git clone https://github.com/GrantBirki/dario.git themes/dario
   ```

2. **Build Errors**: Check the Hugo version in `vercel.json` matches the version you're using locally.

3. **Deployment Issues**: Verify that Vercel is configured to use the `main` branch and the correct build command.

## Maintenance

See [MAINTENANCE.md](MAINTENANCE.md) for a checklist of regular maintenance tasks.

## License

This project is open source and available under the [MIT License](LICENSE). 