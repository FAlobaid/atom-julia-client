{CompositeDisposable} = require 'atom'

module.exports =
  activate: ->
    @subs = new CompositeDisposable
    # Package submenu
    @subs.add atom.menu.add [{
      label: 'Packages',
      submenu: @menu
    }]

    # App Menu
    if atom.config.get 'julia-client.uiOptions.enableMenu'
      @subs.add = atom.menu.add @menu
      # TODO: find a less hacky way to do this
      menu = atom.menu.template.pop()
      atom.menu.template.splice 3, 0, menu

  deactivate: ->
    @subs.dispose()

  menu: [{
    label: 'Juno'
    submenu: [
      {label: 'Start Julia', command: 'julia-client:start-julia'}
      {label: 'Start Remote Julia Process', command: 'julia-client:start-remote-julia-process'}
      {label: 'Interrupt Julia', command: 'julia-client:interrupt-julia'}
      {label: 'Stop Julia', command: 'julia-client:kill-julia'}

      {type: 'separator'}

      {label: 'Open REPL', command: 'julia-client:open-REPL'}
      {label: 'Clear REPL', command: 'julia-client:clear-REPL'}
      {label: 'Open External REPL', command: 'julia-client:open-external-REPL'}
      {
        label: 'Working Directory'
        submenu: [
          {label: 'Current File\'s Folder', command: 'julia-client:work-in-current-folder'}
          {label: 'Select Project Folder', command: 'julia-client:work-in-project-folder'}
          {label: 'Home Folder', command: 'julia-client:work-in-home-folder'}
          {label: 'Select...', command: 'julia-client:select-working-folder'}
        ]
      }
      {
        label: 'Environment',
        submenu: [
          {label: 'Current File\'s Folder', command: 'julia-client:activate-current-folder'}
          {label: 'Default Environment', command: 'julia-client:activate-default-environment'}
        ]
      }
      {label: 'Select Working Module', command: 'julia-client:select-working-module'}

      {type: 'separator'}

      {label: 'Run Block', command: 'julia-client:run-block'}
      {label: 'Run All', command: 'julia-client:run-all'}
      {label: 'Format Code', command: 'julia-client:format-code'}

      {type: 'separator'}

      {label: 'Open Workspace', command: 'julia-client:open-workspace'}
      {label: 'Open Outline Pane', command: 'julia-client:open-outline-pane'}
      {label: 'Open Documentation Browser', command: 'julia-client:open-documentation-browser'}
      {label: 'Open Plot Pane', command: 'julia-client:open-plot-pane'}
      {label: 'Open Debugger Pane', command: 'julia-debug:open-debugger-pane'}

      {type: 'separator'}

      {label: 'Open Julia Startup File', command: 'julia:open-julia-startup-file'}
      {label: 'Open Juno Startup File', command: 'julia:open-juno-startup-file'}
      {label: 'Open Julia Home', command: 'julia:open-julia-home'}
      {label: 'Open Package in New Window...', command: 'julia:open-package-in-new-window'}

      {type: 'separator'}

      {
        label: 'New Terminal'
        submenu: [
          {label: 'Current File\'s Folder', command: 'julia-client:new-terminal-from-current-folder'}
          {label: 'Select Project Folder', command: 'julia-client:new-terminal'}
        ]
      }
      {label: 'New Remote Terminal', command: 'julia-client:new-remote-terminal'}

      {type: 'separator'}

      {label: 'Debug Information', command: 'julia-client:debug-info'}
      {label: 'Help...', command: 'julia:get-help'}
      {label: 'Settings...', command: 'julia-client:settings'}
    ]
  }]
