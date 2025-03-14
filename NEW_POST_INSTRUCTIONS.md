# Creating a New Post

This document provides step-by-step instructions for creating new posts on your Hugo website.

## Step 1: Open Terminal

Open your terminal and navigate to your project directory:

```bash
cd /Users/arielszin/RSZIN
```

## Step 2: Run the new-post.sh Script

Use the `new-post.sh` script with your post title in quotes:

```bash
./new-post.sh "Your New Post Title"
```

For example:
```bash
./new-post.sh "My Thoughts on AI Development"
```

This script will:
- Create a new Markdown file in the `content/posts/` directory
- Name the file with today's date and a slug based on your title (e.g., `2025-03-15-my-thoughts-on-ai-development.md`)
- Add the proper front matter (title, date, draft status)

## Step 3: Edit the Post Content

The script will tell you where the file was created. Open this file in your preferred text editor to add your content:

```bash
# The file path will be something like:
content/posts/2025-03-15-my-thoughts-on-ai-development.md
```

## Step 4: Write Your Post

Edit the Markdown file. It will have this structure:

```markdown
---
title: "My Thoughts on AI Development"
date: 2025-03-15
draft: true
tags: []
---

Write your content here...
```

- Add your content below the front matter
- Add relevant tags in the tags array (e.g., `tags: ["AI", "Technology", "Ethics"]`)
- Change `draft: true` to `draft: false` when you're ready to publish

## Step 5: Preview Your Post

Run the Hugo development server to preview your post:

```bash
hugo server -D
```

Visit http://localhost:1313 in your browser to see how your post looks.

## Step 6: Commit and Push Your Changes

When you're satisfied with your post:

```bash
git add content/posts/2025-03-15-my-thoughts-on-ai-development.md
git commit -m "Add new post: My Thoughts on AI Development"
git push origin main
```

This will trigger the deployment on Vercel, and your post will be published to your website.

## Optional: Using the Script's Built-in Git Push

Alternatively, the `new-post.sh` script will ask if you want to push changes to GitHub immediately:

```
Would you like to push changes to GitHub now? (y/n):
```

If you type `y`, it will automatically commit and push your new post. If the post is still marked as a draft, it will warn you and ask for confirmation.

## Note on Draft Status

- Posts with `draft: true` will only appear when running the server with `-D` flag or when specifically published
- For production, change to `draft: false` when you're ready to make the post public

## Markdown Formatting Tips

Here are some common Markdown formatting options you can use in your posts:

### Headers

```markdown
# Header 1
## Header 2
### Header 3
```

### Emphasis

```markdown
*italic text*
**bold text**
***bold italic text***
```

### Lists

```markdown
- Item 1
- Item 2
  - Subitem 2.1
  - Subitem 2.2

1. Numbered item 1
2. Numbered item 2
```

### Links

```markdown
[Link text](https://www.example.com)
```

### Images

```markdown
![Alt text](path/to/image.jpg)
```

### Code

```markdown
`inline code`

```python
# Code block with syntax highlighting
def hello_world():
    print("Hello, World!")
```
```

### Blockquotes

```markdown
> This is a blockquote
```

### Horizontal Rule

```markdown
---
```

## Additional Resources

- [Hugo Documentation](https://gohugo.io/documentation/)
- [Markdown Guide](https://www.markdownguide.org/basic-syntax/)
- [README.md](README.md) for more information about the website structure and customization 