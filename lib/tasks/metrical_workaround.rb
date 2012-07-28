module MetricalWorkaround
  def metrical_workaround_regex
    /(\w+):\s+/
  end
  def substitute(string)
    #skip comment lines
    return string if /^\s*#/ =~ string
    string.gsub(metrical_workaround_regex, ':\1 => ')
  end
end
