require 'grit'

module MetricalWorkaround
  def replace_hashes
    if working_directory_clean?
      do_replace_hashes
    else
      puts "Your working directory is not clean, please commit your changes"
      puts " before you let me mingle with your ruby sources!"
    end
  end
  def do_replace_hashes
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
  def metrical_workaround_regex
    /(\w+):\s+/
  end
  def substitute(string)
    #skip comment lines
    return string if /^\s*#/ =~ string
    string.gsub(metrical_workaround_regex, ':\1 => ')
  end
  def working_directory_clean?
    app_dir = File.expand_path("../../..", __FILE__)
    puts app_dir
    repo = Grit::Repo.new(app_dir)
    status = repo.status
    working_directory_clean = true
    [:untracked,:changed,:added].each do | change|
      a = status.send(change).keys.select { |fn| /\.rb$/ =~ fn}
      if a.any?
        puts "You have #{change} ruby files:"
        puts a.inspect
        working_directory_clean = false
      end
    end
    working_directory_clean
  end  
end
