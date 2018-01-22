#!/usr/bin/env ruby

def print_options
  puts "You have the option to:"
  puts "  [1] Overwrite all existing dotfiles (careful!)"
  puts "  [2] Create *_USER dotfiles which are sourced by the original"
  puts "  [3] Ask for each dotfile"
  puts ""
  puts "Please select 1, 2, or 3:"
end

def prompt(*args)
  print *args
  choice = gets.strip
end


$excluded_files = ['.', '..', '.git', 'install.rb', 'README.md']
$dircolors_files = ['dir_colors_dark', 'dir_colors_light']

def start
  backup = true
  backup = prompt('Backup dotfiles?[y] ') until ['y', 'n'].include? backup
  backup_dir = "~/.files_backup"
  `mkdir -p #{backup_dir}`

  Dir.foreach('.') do |dotfile|
    next if $excluded_files.include? dotfile

    relative_dotfile = "~/.#{dotfile}"
    puts relative_dotfile
    target = File.expand_path(relative_dotfile)


    puts "File #{target} exists" if File.exist? target
    puts '  1. Overwrite'
    puts "  2. Append _USER (ie #{target}_USER)"
    puts "  3. Choose new name"
    puts "  4. Skip"
    puts "  5. Skip all"

    action = nil
    action = prompt('Choice: ').to_i until [1, 2, 3, 4, 5].include? action

    case action
    when 1 then
    when 2 then target += '_USER'
    when 3 then target = File.expand_path('~/' + prompt('New name: '))
    when 4 then next
    when 5 then break
    end

    `cp -L #{target} #{backup_dir}` if backup && File.exist?(target)

    puts "#{dotfile} --> #{target}"
    `ln -s -f #{File.expand_path(dotfile)} #{target}`
    puts
  end

  if prompt('Install vim plugins?[y] ') == 'y'
    `curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim > /dev/null 2>&1`
    `vim +PlugInstall +qall > /dev/null 2>&1`
  end
end

def install_dotfiles(dotfiles, overwrite = false)
  dotfiles.each do |dotfile|
    target = "~/.#{dotfile}"
    target += "_USER" unless overwrite
    `ln -s #{target} #{dotfile}`
  end
end

def install_vim_plug
  `curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim`
  `vim +PlugInstall +qall`
end

start
