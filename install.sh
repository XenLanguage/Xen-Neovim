#!/bin/bash

echo "Installing Xen highlighting support for Neovim"

# Create sub directories in neovim config dir
NVIM_ROOT=~/.config/nvim

if [ ! -d "$NVIM_ROOT/ftdetect" ]; then
    mkdir -p "$NVIM_ROOT/ftdetect"
fi
if [ ! -d "$NVIM_ROOT/indent" ]; then
    mkdir -p "$NVIM_ROOT/indent"
fi
if [ ! -d "$NVIM_ROOT/syntax" ]; then
    mkdir -p "$NVIM_ROOT/syntax"
fi

# Create symlinks to config directories
ln -s ftdetect/xen.vim "$NVIM_ROOT/ftdetect/xen.vim"
ln -s indent/xen.vim "$NVIM_ROOT/indent/xen.vim"
ln -s syntax/xen.vim "$NVIM_ROOT/syntax/xen.vim"

# Generate uninstall script
cat >uninstall.sh <<'EOF'
#!/bin/bash
echo "Uninstalling Xen for Neovim"
NVIM_ROOT=~/.config/nvim
rm "$NVIM_ROOT/ftdetect/xen.vim"
rm "$NVIM_ROOT/indent/xen.vim"
rm "$NVIM_ROOT/syntax/xen.vim"
echo "Done."
EOF

chmod +x uninstall.sh

echo "Done. Restart Neovim to see the changes take effect."
echo "You can run ./uninstall.sh to uninstall the extension."