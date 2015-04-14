define :justinaiken_dotfiles, install_zsh: true, switch_shell: true, install_oh_my_zsh: true, install_vim: true do

  username = params[:name]
  homedir  = node['etc']['passwd'][username]['dir']

  package 'git'

  if params[:install_zsh]
    package 'zsh'
  end

  if params[:switch_shell]
    bash "set_zsh" do
      code "chsh -s $(which zsh) #{username}"
      not_if { node['etc']['passwd'][username]['shell'] =~ /zsh/ }
    end
  end

  if params[:install_oh_my_zsh]
    git "#{homedir}/.oh-my-zsh" do
      repository node[:justinaiken_dotfiles][:oh_my_zsh_repository]
      reference  node[:justinaiken_dotfiles][:oh_my_zsh_revision]
      action :sync
    end
  end

  if params[:install_vim]
    package 'vim'
  end

  git "#{homedir}/dotfiles" do
    repository node[:justinaiken_dotfiles][:git_repository]
    reference  node[:justinaiken_dotfiles][:git_revision]
    action :sync
    enable_submodules true

    notifies :run, "bash[sync_dotfiles]"
  end

  bash "sync_dotfiles" do
    cwd  "#{homedir}/dotfiles"
    code "chmod +x sync.sh && ./sync.sh"

    # Don't run unless git sync changes:
    action :nothing
  end
end
