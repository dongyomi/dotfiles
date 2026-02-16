## Setup

#### 1. Auto Installation

```
chmod +x install.sh && ./install.sh && kitty --start-as maximized
```

#### 2. Manual Settings

Launch nvim and install the following tools via Mason.nvim

- `clang-format`
- `clangd`
- `lua-language-server`
- `stylua`

Access postgre and create a user and database
 
 ```
 sudo -i -u postgres psql
 ```
