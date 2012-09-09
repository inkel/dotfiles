# -*- mode: ruby -*-

require "awesome_print"

Pry.config.editor = proc { |file, line| "emacsclient +#{line} #{file}" }
Pry.config.prompt = Pry::NAV_PROMPT
