require 'serverspec'

# Required by serverspec
set :backend, :exec

describe 'dotfiles' do
  it "installs zsh" do
    expect(package :zsh).to be_installed
  end

  it "installs git" do
    expect(package :git).to be_installed
  end

  it "installs vim" do
    expect(package :vim).to be_installed
  end

  it "sets zsh as the default shell" do
    expect(user 'vagrant').to have_login_shell 'zsh'
  end

  it "installs oh-my-zsh" do
    expect(file '/home/vagrant/.oh-my-zsh').to be_directory
  end

  it "installs symlinks to dotfiles" do
    expect(file '/home/vagrant/.zshrc').to     be_symlink
    expect(file '/home/vagrant/.vimrc').to     be_symlink
    expect(file '/home/vagrant/.gitconfig').to be_symlink
  end
end
