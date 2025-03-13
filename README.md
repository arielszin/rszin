# Personal Website with Hugo and Vercel

This repository contains the source code for my personal website built with Hugo and deployed on Vercel.

## Repository Structure

This repository has been simplified for public access. The main components are:

- `rszin/`: The main Hugo website directory
- `build.sh`: A simplified build script for Vercel deployment
- `vercel.json`: Configuration for Vercel deployment
- `new-post.sh`: Script to create new blog posts

## Development Workflow

### Prerequisites

- [Hugo](https://gohugo.io/installation/) (Extended version)
- [Git](https://git-scm.com/downloads)
- [Node.js](https://nodejs.org/) (for Vercel CLI, optional)

### Local Development

1. Clone this repository:
   ```bash
   git clone --recursive https://github.com/arielszin/RSZIN.git
   cd RSZIN
   ```

2. Navigate to the Hugo project directory:
   ```bash
   cd rszin
   ```

3. Start the Hugo development server:
   ```bash
   hugo server -D
   ```

4. Open your browser and visit http://localhost:1313 to see the site.

### Creating New Content

Use the provided script to create new posts:

```bash
./new-post.sh "My New Post Title"
```

This will create a new post file in the `rszin/content/posts/` directory with the current date and a slug based on the title.

## Deployment

The site is automatically deployed to Vercel when changes are pushed to the main branch. The deployment process uses the `build.sh` script to build the Hugo site.

The `vercel.json` file is configured to use this build script:

```json
{
  "buildCommand": "./build.sh",
  "outputDirectory": "public"
}
```

## Maintenance

See [MAINTENANCE.md](MAINTENANCE.md) for a checklist of regular maintenance tasks.

## License

This project is open source and available under the [MIT License](LICENSE). 