# justinaiken_dotfiles

This is a cookbook to install and sets up my [dotfiles](https://github.com/JustinAiken/dotfiles).

- Installs ZSH, and sets it as the shell
- Installs vim
- Installs oh-my-zsh
- Installs and syncs my dotfiles

## Supported Platforms

- Debian-based Linuxes
  - Tested on Ubunutu 12.04
  - Tested on Ubunutu 14.04

## Attributes

<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['justinaiken_dotfiles']['oh_my_zsh_repository']</tt></td>
    <td>String</td>
    <td>Which repo to install oh-my-zsh from</td>
    <td><tt>https://github.com/robbyrussell/oh-my-zsh.git</tt></td>
  </tr>
  <tr>
    <td><tt>['justinaiken_dotfiles']['oh_my_zsh_revision']</tt></td>
    <td>String</td>
    <td>Which ref of oh-my-zsh to use</td>
    <td><tt>master</tt></td>
  </tr>
  <tr>
    <td><tt>['justinaiken_dotfiles']['git_repository']</tt></td>
    <td>String</td>
    <td>Which repo to install dotfiles from</td>
    <td><tt>https://github.com/JustinAiken/dotfiles.git</tt></td>
  </tr>
  <tr>
    <td><tt>['justinaiken_dotfiles']['git_revision']</tt></td>
    <td>String</td>
    <td>Which ref of dotfiles to use</td>
    <td><tt>master</tt></td>
  </tr>
  <tr>
    <td><tt>['justinaiken_dotfiles']['users']</tt></td>
    <td>Array of String</td>
    <td>List of usernames to get dotfiles treadment</td>
    <td><tt>[]</tt></td>
  </tr>
</table>

## Usage

### Automatic

Add some users to `[justinaiken_dotfiles][users]` and include `justinaiken_dotfiles` in your node's `run_list`:

```ruby
{
  "run_list": [
    "recipe[justinaiken_dotfiles]"
  ]
}
```

### Manual

Declare a `justinaiken_dotfiles` resource in your recipie:

```ruby

justinaiken_dotfiles 'some_user' do
  install_vim       true # Defaults to true, set to false if you want to skip installing vim
  install_zsh       true # Defaults to true, set to false if you want to skip installing zsh
  switch_shell      true # Defaults to true, set to false if don't want to change user's shell to zsh
  install_oh_my_zsh true # Defaults to true, set to false if you want to skip installing oh-my-zsh
end
```

## License and Authors

Author:: [Justin Aiken](https://github.com/JustinAiken)
