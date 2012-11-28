# -*- mode: ruby -*-

require "awesome_print"

Pry.config.editor = proc { |file, line| "emacsclient +#{line} #{file}" }
Pry.config.prompt = Pry::NAV_PROMPT

def time(times = 1)
  require 'benchmark'
  ret = nil
  Benchmark.bm { |x| x.report { times.times { ret = yield } } }
  ret
end
