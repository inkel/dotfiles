#! /usr/bin/env ruby

require 'fileutils'

INSTALL_SCRIPT = File.expand_path( __FILE__)

DST = if ARGV[0].nil?
        ENV['HOME']
      else
        File.expand_path(ARGV[0])
      end

raise "Destination #{DST} is not a directory or doesn't exists" unless File.directory?(DST)

Dir['*'].each do |file|
  expanded = File.expand_path(file)
  next if expanded == INSTALL_SCRIPT
  FileUtils.ln_sf expanded, File.join(DST, ".#{file}")
end
