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
- `static/css/custom.css`: Custom CSS styles for the website
- `layouts/partials/head.html`: Custom head template that includes the custom CSS

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

### Style Customization

The site uses a custom CSS file (`static/css/custom.css`) to override specific styles from the theme. This approach ensures that customizations persist even when the theme is updated.

#### How to Customize Specific Elements

1. **Home Page Content Font Size**:
   
   The font size of the "Questions, Exploratory Musings, Projects" text on the home page is currently set to 22px. To change this size, edit the following in `static/css/custom.css`:

   ```css
   .content-container section:first-child p:nth-child(2) {
       font-size: 22px !important; /* Use !important to ensure override */
   }
   ```

2. **To Customize Post Page Styles**:
   
   Add CSS selectors targeting post content. For example, to increase the font size of post titles:

   ```css
   /* Add this to static/css/custom.css */
   .content-container h1 {
       font-size: 2.5em !important; /* Use !important for stubborn styles */
   }
   ```

3. **To Customize Other Elements**:
   
   a. First, identify the HTML structure of the element you want to customize:
      - Use browser developer tools to inspect the element
      - Look at the theme's HTML templates in `themes/dario/layouts/`
   
   b. Add a CSS selector to `static/css/custom.css` targeting that element:
      ```css
      /* Example: Change the color of links */
      a {
          color: #0066cc !important;
      }
      
      /* Example: Change the font size of the site header */
      .site-header h1 {
          font-size: 2em !important;
      }
      ```

4. **Using the !important Flag**:
   
   When customizing styles, you may sometimes need to use the `!important` flag to ensure your styles override the theme's styles:
   
   ```css
   /* Without !important - might be overridden by theme styles */
   .some-element {
       color: red;
   }
   
   /* With !important - will override most other styles */
   .some-element {
       color: red !important;
   }
   ```
   
   Use the `!important` flag when:
   - Your styles aren't being applied despite having the correct selector
   - The theme has highly specific selectors that are difficult to override
   - You've verified with browser developer tools that there's a specificity conflict

5. **Adding New CSS Files**:
   
   If you want to add additional CSS files, add them to the `static/css/` directory and then include them in `layouts/partials/head.html`:

   ```html
   <!-- Add this line in layouts/partials/head.html -->
   <link rel="stylesheet" href="{{ "css/your-new-file.css" | relURL }}" />
   ```

### Theme Customization

For more extensive customizations:

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

4. **CSS Changes Not Appearing**: If your CSS changes aren't visible:
   - Clear your browser cache (Shift+Refresh or Cmd+Shift+R on Mac)
   - Check that the CSS file is being loaded (using browser developer tools)
   - Verify the CSS selector is correctly targeting the element
   - Try adding the `!important` flag to your CSS rules
   - Use browser developer tools to inspect the element and see what styles are being applied/overridden
   - Test with a more obvious change (like changing text color) to verify your CSS is being applied

5. **Template Changes Not Reflecting**: If changes to layout templates aren't appearing:
   - Verify the template path matches Hugo's lookup order
   - Check for any errors in the Hugo server console
   - Restart the Hugo server with `hugo server --disableFastRender`

## Maintenance

See [MAINTENANCE.md](MAINTENANCE.md) for a checklist of regular maintenance tasks.

## License

This project is open source and available under the [MIT License](LICENSE). 