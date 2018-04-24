# frozen_string_literal: true

require 'rubocop/rake_task'
require 'rake/testtask'

task default: 'test:full'

Rake::TestTask.new
RuboCop::RakeTask.new

namespace :test do
  desc 'Run Rubocop and all tests'
  task full: %i[rubocop:auto_correct test]
end
