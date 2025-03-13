# Personal Website with Hugo and Vercel

This repository contains the source code for my personal website built with Hugo and deployed on Vercel.

## Development Workflow

### Prerequisites

- [Hugo](https://gohugo.io/installation/) (Extended version)
- [Git](https://git-scm.com/downloads)
- [Node.js](https://nodejs.org/) (for Vercel CLI, optional)

### Local Development

1. Clone this repository:
   ```bash
   git clone git@github.com:arielszin/rszin.git
   cd rszin
   ```

2. Start the Hugo development server:
   ```bash
   hugo server -D
   ```

3. Visit `http://localhost:1313` to see your site.

### Creating New Content

#### Using the helper script:

```bash
./new-post.sh "My New Post Title"
```

#### Manually:

```bash
hugo new content/posts/YYYY-MM-DD-post-title.md
```

Edit the file to add your content. Set `draft: false` when ready to publish.

### Deployment

The site is automatically deployed to Vercel when changes are pushed to the main branch.

1. Commit your changes:
   ```bash
   git add .
   git commit -m "Add new post: My Post Title"
   ```

2. Push to GitHub:
   ```bash
   git push
   ```

3. Vercel will automatically build and deploy the site.

## Maintenance

### Updating Hugo

Update the Hugo version in `vercel.json` when needed.

### Updating the Theme

If using a theme as a Git submodule:

```bash
git submodule update --remote --merge
```

## Custom Domain

The site is configured to use www.rszin.com as the custom domain. DNS is managed through GoDaddy. 