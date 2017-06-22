#!/usr/bin/env ruby
# Encoding: utf-8
# IBM WebSphere Application Server Liberty Buildpack
# Copyright 2013-2014 the original author or authors.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# require 'fileutils'

# class IOLogger < IO
#   @@file_out = nil
#   def initialize(fd, mode)
#     super(fd, mode)
#     @@file_out = File.new('staging_task.log', 'a') if @@file_out.nil?
#     @@file_out.sync = true
#     @tty_out = IO.new(fd, mode)
#   end

#   def puts(*strings)
#     @tty_out.puts(strings.join("\n"))
#     @@file_out.puts(strings.join("\n"))
#   end

#   def print(*strings)
#     @tty_out.print(strings.join("\n"))
#     @@file_out.print(strings.join("\n"))
#   end
# end

# $stdout = IOLogger.new(1, 'w')
# $stderr = IOLogger.new(2, 'w')
$stdout.sync = true
$stderr.sync = true

$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)

require 'liberty_buildpack/buildpack'

build_dir = ARGV[0]

LibertyBuildpack::Buildpack.initialize_env(ARGV[2]) unless ARGV[2].nil?

LibertyBuildpack::Buildpack.drive_buildpack_with_logger(build_dir, 'Compile failed with exception %s', &:compile)

# FileUtils.mkdir_p(File.join(ARGV[0], 'logs'))
# FileUtils.cp('staging_task.log', File.join(ARGV[0], 'logs', 'staging_task.log'))
