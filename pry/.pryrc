# frozen_string_literal: true

# Based on https://gist.github.com/justin808/1fe1dfbecc00a18e7f2a

Pry.editor = 'nvim'

unless ENV['PRY_BW'] && defined?(PryTheme)
  Pry.color = true
  Pry.config.theme = "railscasts"
  Pry.config.prompt = PryRails::RAILS_PROMPT if defined?(PryRails::RAILS_PROMPT)
  Pry.config.prompt ||= Pry.prompt
end

# === History ===
Pry::Commands.command(/^$/, "repeat last command") do
  pry_instance.run_command Pry.history.to_a.last
end

# === PRY Commands ===

# === PryByebug Commands ===
if defined?(PryByebug)
  def display_shortcuts
    $stdout.puts <<~SHORTCUTS
      == Debugging shortcuts
      w  :  whereami
      s  :  step
      n  :  next
      c  :  continue
      f  :  finish

      == Stack Movement
      t  : backtrace
      ff : frame
      u  : up
      d  : down
      b  : break

      == Introspection
      $    :  show whole method of current context
      $ foo:  show definition of foo
      ? foo:  show docs for foo


      == Help

      Run `help` to see all the pry commands


      == Aliases

      Run `help alias` to see all aliases


      == Adding breakpoints
      https://github.com/deivid-rodriguez/pry-byebug#breakpoints

      Try `break --help`

      break SomeClass#run            # Break at the start of `SomeClass#run`.
      break Foo#bar if baz?          # Break at `Foo#bar` only if `baz?`.
      break app/models/user.rb:15    # Break at line 15 in user.rb.
      break 14                       # Break at line 14 in the current file.

      break --condition 4 x > 2      # Change condition on breakpoint #4 to 'x > 2'.
      break --condition 3            # Remove the condition on breakpoint #3.

      break --delete 5               # Delete breakpoint #5.
      break --disable-all            # Disable all breakpoints.

      break                          # List all breakpoints.
      break --show 2                 # Show details about breakpoint #2.

      Be careful not to use shortcuts for temp vars, like `u = User.first`

    SHORTCUTS
  end

  def load_debug_commands(show_help: false)
    Pry.commands.alias_command 't', 'backtrace'
    Pry.commands.alias_command 's', 'step'
    Pry.commands.alias_command 'n', 'next'
    Pry.commands.alias_command 'c', 'continue'
    Pry.commands.alias_command 'f', 'finish'
    Pry.commands.alias_command 'ff', 'frame'
    Pry.commands.alias_command 'u', 'up'
    Pry.commands.alias_command 'd', 'down'
    Pry.commands.alias_command 'b', 'break'
    Pry.commands.alias_command 'w', 'whereami'
    Pry.commands.alias_command '?', 'show-source -d'

    display_shortcuts if show_help
  end

  load_debug_commands(show_help: false)
end

Pry.commands.command "caller_method", "Shows the caller of the current method" do |depth|
  depth = depth.to_i || 1
  if /^(.+?):(\d+)(?::in `(.*)')?/ =~ caller(depth + 1).first
    file   = Regexp.last_match[1]
    line   = Regexp.last_match[2].to_i
    method = Regexp.last_match[3]
    output.puts [file, line, method]
  end
end

Pry.commands.command "copy", "Copy argument to the clip-board" do |str|
  IO.popen('pbcopy', 'w') { |f| f << str.to_s }
end

