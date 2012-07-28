# http://www.ruby-forum.com/topic/202257
require File.expand_path("../../../lib/tasks/metrical_workaround", __FILE__)
include MetricalWorkaround

namespace :metrical do
  desc "revert hash syntax 1.9 => 1.8 as dirty workaround"
  task :revert do
    #result = %x(git log)
    #puts result
    Dir.glob('**/*.rb').each do | sourcefile |
      puts "#######################################"
      puts "#{sourcefile}"
      puts "#######################################"
      lines = File.open(sourcefile).readlines
      lines.each do |line|
        if metrical_workaround_regex =~ line
          puts line
          line = substitute(line)
          puts line
        end
      end
    end
  end
end

