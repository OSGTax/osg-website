#!/data/data/com.termux/files/usr/bin/bash
# One-time setup for Claude Code on Termux
echo ""
echo "  Setting up Claude Code for mobile..."
echo ""

# Install dependencies
pkg update -y
pkg install -y nodejs git

# Install Claude Code
npm install -g @anthropic-ai/claude-code

# Clone repos if not already there
cd ~
git clone https://github.com/OSGTax/osg-website.git 2>/dev/null
git clone https://github.com/OSGTax/termux-apps.git 2>/dev/null

# Set git config if needed
git config --global pull.rebase false

echo ""
echo "  Done! To get started:"
echo ""
echo "  For the website:    cd ~/osg-website && claude"
echo "  For the planner:    cd ~/termux-apps && claude"
echo ""
